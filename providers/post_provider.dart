import 'package:flutter/material.dart';
import 'package:instagram_app/models/post_model.dart';
import 'package:instagram_app/services/api_service.dart';

class PostProvider extends ChangeNotifier {
  // Instanciamos o seu serviço que já está na pasta certa
  final ApiService _apiService = ApiService();

  List<PostModel> _posts = [];
  bool _loading = false;

  List<PostModel> get posts => _posts;
  bool get loading => _loading;

  // Esta é a nova função que você mencionou
  Future<void> fetchPosts() async {
    _loading = true;
    notifyListeners(); // Faz o app mostrar o carregamento

    try {
      _posts = await _apiService.getPosts();
    } catch (e) {
      print("Erro ao buscar dados: $e");
    } finally {
      _loading = false;
      notifyListeners(); // Faz a lista aparecer na tela
    }
  }
}
