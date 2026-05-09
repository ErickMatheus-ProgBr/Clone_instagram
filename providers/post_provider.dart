import 'package:flutter/material.dart';
import 'package:instagram_app/models/post_model.dart';
import 'package:instagram_app/models/users_model.dart';
import 'package:instagram_app/services/api_service.dart';

class PostProvider extends ChangeNotifier {
  // Instanciamos o seu serviço que já está na pasta certa
  final ApiService _apiService = ApiService();

  List<PostModel> _posts = [];
  bool _loading = false;

  List<PostModel> get posts => _posts;
  bool get loading => _loading;

  Future<void> fetchPost() async {
    _loading = true;
    notifyListeners();

    try {
      var postsData = await _apiService.getPosts();
      var photosData = await _apiService.getPhotos();
      var usersData = await _apiService.getUserName();

      for (var i = 0; i < postsData.length; i++) {
        // 1. Atribui a foto se ela existir
        if (i < photosData.length) {
          postsData[i].imageUrl = "https://picsum.photos/500/500?random=${postsData[i].id}";
        }

        // 2. Atribui o usuário (Sempre fora do IF da foto, mas dentro do FOR)
        var userPost = usersData.firstWhere(
          (user) => user.id == postsData[i].userId,
          orElse: () => UsersModel(id: 0, userName: "Desconhecido"),
        );
        postsData[i].username = userPost.userName;
      }

      _posts = postsData;
    } catch (e) {
      print("Erro ao buscar dados: $e");
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
