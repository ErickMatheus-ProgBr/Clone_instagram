import 'package:http/http.dart' as http;
import 'package:instagram_app/models/post_photo.dart';
import 'package:instagram_app/models/users_model.dart';
import 'dart:convert';
import 'package:instagram_app/models/post_model.dart';
import 'package:instagram_app/models/video_model/videoModel.dart';

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

class VideoService {
  final String _ApiUrl = "https://api.jsonsilo.com/public/4bd081be-8b29-4d64-ad16-5221b6a18b76";

  Future<List<Video>> fetchInstagramVideo() async {
    try {
      // 1. Faz a chamada HTTP do tipo GET para o site
      final response = await http.get(Uri.parse(_ApiUrl));

      // 2. Se o status for 200 (Sucesso!)
      if (response.statusCode == 200) {
        // 🌟 CORREÇÃO AQUI: Como a API retorna um objeto {}, decodificamos primeiro como Map
        final Map<String, dynamic> decodedData = json.decode(utf8.decode(response.bodyBytes));

        // Pegamos a lista que está guardada dentro da chave 'videos'
        final List<dynamic> listaDeVideosJson = decodedData['videos'] ?? [];

        // Transformamos cada item da lista do JSON em um objeto do seu modelo Video
        return listaDeVideosJson.map((item) => Video.fromJson(item)).toList();
      } else {
        print("Erro no Servidor: Código ${response.statusCode} - ${response.body}");
        throw Exception("Erro ao carregar Video da Api");
      }
    } catch (e, stackTrace) {
      print("Erro no Service: $e");
      print("Erro no StackTrace: $stackTrace");
      return []; // Retorna uma lista vazia se der ruim (ex: sem internet)
    }
  }
}
