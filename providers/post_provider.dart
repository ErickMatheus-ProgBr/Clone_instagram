import 'package:flutter/material.dart';
import 'package:instagram_app/models/post_model.dart';
import 'package:instagram_app/models/users_model.dart';
import 'package:instagram_app/models/video_model/videoModel.dart';
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

class PostProviderVideo with ChangeNotifier {
  final VideoService _videoService = VideoService(); // Instancia o serviço que criamos

  List<Video> _videoProfile = []; // Lista privada que vai guardar os vídeos da API

  bool _isLoading = false; // Variável para controlar o loading (o círculo de carregamento na tela)

  // Getters para a tela conseguir ler os dados sem alterá-los direto
  List<Video> get videoProfile => _videoProfile;
  bool get isLoading => _isLoading;

  // 🌟 FUNÇÃO PRINCIPAL: Vai ser chamada ao abrir a tela
  Future<void> loadingVideoService() async {
    _isLoading = true;
    notifyListeners(); // Avisa a tela para mostrar o CircularProgressIndicator

    _videoProfile = (await _videoService.fetchInstagramVideo())
        .cast<Video>(); // Busca os dados lá do service
    // _videosDoPerfil = await _videoService.fetchInstagramVideos(); Esse é o que o chat deu

    _isLoading = false;
    notifyListeners(); // Avisa a tela que os dados chegaram para renderizar o Grid!
  }
}
