package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"os"
	"strconv"
	"sync"

	"github.com/gorilla/mux"
)

type VideoCard struct {
	ID               int     `json:"id"`
	Name             string  `json:"name"`
	Description      string  `json:"description"`
	ImageUrl         string  `json:"imageUrl"`
	Price            float64 `json:"price"`
	FullDescription  string  `json:"fullDescription"`
}

var (
	videoCards   []VideoCard
	videoCardsMu sync.RWMutex
)

func loadCards() error {
	file, err := os.Open("cards.json")
	if err != nil {
		if os.IsNotExist(err) {
			videoCards = []VideoCard{}
			return nil
		}
		return err
	}
	defer file.Close()

	data, err := ioutil.ReadAll(file)
	if err != nil {
		return err
	}
	return json.Unmarshal(data, &videoCards)
}

func saveCards() error {
	data, err := json.MarshalIndent(videoCards, "", "  ")
	if err != nil {
		return err
	}
	return ioutil.WriteFile("cards.json", data, 0644)
}

func getCardsHandler(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	videoCardsMu.RLock()
	defer videoCardsMu.RUnlock()
	json.NewEncoder(w).Encode(videoCards)
}

func getCardByIDHandler(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	idStr := vars["id"]
	id, err := strconv.Atoi(idStr)
	if err != nil {
		http.Error(w, "Invalid ID", http.StatusBadRequest)
		return
	}

	videoCardsMu.RLock()
	defer videoCardsMu.RUnlock()
	for _, card := range videoCards {
		if card.ID == id {
			json.NewEncoder(w).Encode(card)
			return
		}
	}
	http.Error(w, "Card not found", http.StatusNotFound)
}

func createCardHandler(w http.ResponseWriter, r *http.Request) {
	var newCard VideoCard
	if err := json.NewDecoder(r.Body).Decode(&newCard); err != nil {
		http.Error(w, "Invalid data", http.StatusBadRequest)
		return
	}

	videoCardsMu.Lock()
	defer videoCardsMu.Unlock()
	newCard.ID = getNextID()
	videoCards = append(videoCards, newCard)

	if err := saveCards(); err != nil {
		http.Error(w, "Failed to save", http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(newCard)
}

func updateCardHandler(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	idStr := vars["id"]
	id, err := strconv.Atoi(idStr)
	if err != nil {
		http.Error(w, "Invalid ID", http.StatusBadRequest)
		return
	}

	var updatedCard VideoCard
	if err := json.NewDecoder(r.Body).Decode(&updatedCard); err != nil {
		http.Error(w, "Invalid data", http.StatusBadRequest)
		return
	}

	videoCardsMu.Lock()
	defer videoCardsMu.Unlock()
	for i, card := range videoCards {
		if card.ID == id {
			updatedCard.ID = id
			videoCards[i] = updatedCard
			if err := saveCards(); err != nil {
				http.Error(w, "Failed to save", http.StatusInternalServerError)
				return
			}
			w.Header().Set("Content-Type", "application/json")
			json.NewEncoder(w).Encode(updatedCard)
			return
		}
	}
	http.Error(w, "Card not found", http.StatusNotFound)
}

func deleteCardHandler(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	idStr := vars["id"]
	id, err := strconv.Atoi(idStr)
	if err != nil {
		http.Error(w, "Invalid ID", http.StatusBadRequest)
		return
	}

	videoCardsMu.Lock()
	defer videoCardsMu.Unlock()
	for i, card := range videoCards {
		if card.ID == id {
			videoCards = append(videoCards[:i], videoCards[i+1:]...)
			if err := saveCards(); err != nil {
				http.Error(w, "Failed to save", http.StatusInternalServerError)
				return
			}
			w.WriteHeader(http.StatusNoContent)
			return
		}
	}
	http.Error(w, "Card not found", http.StatusNotFound)
}

func getNextID() int {
	maxID := 0
	for _, card := range videoCards {
		if card.ID > maxID {
			maxID = card.ID
		}
	}
	return maxID + 1
}

func main() {
	if err := loadCards(); err != nil {
		log.Fatalf("Error loading cards: %v", err)
	}

	r := mux.NewRouter()
	r.HandleFunc("/cards", getCardsHandler).Methods("GET")
	r.HandleFunc("/cards/{id:[0-9]+}", getCardByIDHandler).Methods("GET")
	r.HandleFunc("/cards", createCardHandler).Methods("POST")
	r.HandleFunc("/cards/{id:[0-9]+}", updateCardHandler).Methods("PUT")
	r.HandleFunc("/cards/{id:[0-9]+}", deleteCardHandler).Methods("DELETE")

	fmt.Println("Server running on port 8080")
	log.Fatal(http.ListenAndServe(":8080", r))
}
