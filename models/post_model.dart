import 'package:http/http.dart' as http;
import 'dart:convert';

// 1. O MODELO (O molde do seu post)
class PostModel {
  final int userId; // Na API original é int
  final int id; // Na API original é int
  final String title;
  final String body;

  PostModel({required this.userId, required this.id, required this.title, required this.body});

  // Fábrica que transforma o JSON da internet em um objeto Dart
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json["userId"] ?? '',
      id: json["id"] ?? '',
      title: json["title"] ?? '',
      body: json["body"] ?? '',
    );
  }
}
