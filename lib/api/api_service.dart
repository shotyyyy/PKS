import 'package:dio/dio.dart';
import '../models/video_card.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'http://10.0.2.2:8080'),
  );

  Future<List<VideoCard>> getCards() async {
    try {
      final response = await _dio.get('/cards'); // Путь к API
      final data = response.data as List;
      return data.map((json) => VideoCard.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<VideoCard> createCard(VideoCard card) async {
    try {
      final response = await _dio.post('/create', data: card.toJson());
      return VideoCard.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateCard(VideoCard card) async {
    try {
      await _dio.put('/update/${card.id}', data: card.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteCard(int id) async {
    try {
      await _dio.delete('/delete/$id');
    } catch (e) {
      rethrow;
    }
  }

  Future<VideoCard> getCardById(int id) async {
    try {
      final response = await _dio.get('/$id');
      return VideoCard.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}