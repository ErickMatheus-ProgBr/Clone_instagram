import 'package:http/http.dart' as http;
import 'dart:convert';

// 1. O MODELO (O molde do seu post)
class PostModel {
  final int userId; // Na API original é int
  final int id; // Na API original é int
  String? imageUrl;
  final String title;
  final String body;
  String? username;

  PostModel({
    required this.userId,
    required this.id,
    this.imageUrl,
    required this.title,
    required this.body,
    this.username,
  });

  // Fábrica que transforma o JSON da internet em um objeto Dart
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json["userId"] ?? '',
      id: json["id"] ?? '',
      imageUrl: json["url"] ?? '',
      title: json["title"] ?? '',
      body: json["body"] ?? '',
      username: json["username"],
    );
  }
}
