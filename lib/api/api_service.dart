import 'package:dio/dio.dart';
import '../models/video_card.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'http://10.0.2.2:8080'),
  );

  Future<List<VideoCard>> getCards() async {
    try {
      final response = await _dio.get('/products');
      final data = response.data as List;
      return data.map((json) => VideoCard.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<VideoCard> createCard(VideoCard card) async {
    try {
      final response = await _dio.post('/products/create', data: card.toJson());
      return VideoCard.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateCard(VideoCard card) async {
    try {
      await _dio.put('/products/update/${card.id}', data: card.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteCard(int id) async {
    try {
      await _dio.delete('/products/delete/$id');
    } catch (e) {
      rethrow;
    }
  }

  Future<List<VideoCard>> getCartItems() async {
    try {
      final response = await _dio.get('/cart');
      final data = response.data as List;
      return data.map((json) => VideoCard.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addToCart(VideoCard card, int quantity) async {
    try {
      await _dio.post('/cart/add', data: {
        'id': card.id,
        'quantity': quantity,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateCartItem(int id, int quantity) async {
    try {
      await _dio.put('/cart/update/$id', data: {'quantity': quantity});
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeFromCart(int id) async {
    try {
      await _dio.delete('/cart/remove/$id');
    } catch (e) {
      rethrow;
    }
  }

  Future<List<VideoCard>> getFavoriteItems() async {
    try {
      final response = await _dio.get('/favorites');
      final data = response.data as List;
      return data.map((json) => VideoCard.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addToFavorites(VideoCard card) async {
    try {
      await _dio.post('/favorites/add', data: {'id': card.id});
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeFromFavorites(int id) async {
    try {
      await _dio.delete('/favorites/remove/$id');
    } catch (e) {
      rethrow;
    }
  }
}
