import 'package:http/http.dart';

class PostPhoto {
  final int id;
  final String url;
  final String thumbnailUrl;

  PostPhoto({required this.id, required this.url, required this.thumbnailUrl});

  factory PostPhoto.fromJson(Map<String, dynamic> json) {
    return PostPhoto(id: json["id"], url: json["url"], thumbnailUrl: json["thumbnailUrl"]);
  }
}
