import 'package:http/http.dart' as http;
import 'package:instagram_app/models/post_photo.dart';
import 'package:instagram_app/models/users_model.dart';
import 'dart:convert';
import 'package:instagram_app/models/post_model.dart';

class ApiService {
  final String _url = 'https://jsonplaceholder.typicode.com/posts?_limit=10';

  Future<List<PostModel>> getPosts() async {
    try {
      final response = await http.get(Uri.parse(_url));

      if (response.statusCode == 200) {
        List<dynamic> dataJson = jsonDecode(response.body);
        // Agora o PostModel.fromJson será reconhecido!
        return dataJson.map((item) => PostModel.fromJson(item)).toList();
      } else {
        throw Exception("Erro: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Falha na conexão");
    }
  }

  Future<List<PostPhoto>> getPhotos() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => PostPhoto.fromJson(item)).toList();
      } else {
        throw Exception("Erro: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Falha na coneção");
    }
  }

  Future<List<UsersModel>> getUserName() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => UsersModel.fromJson(item)).toList();
      } else {
        throw Exception("Erro: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Falha na coneção");
    }
  }
}
