import 'package:flutter/material.dart';
import 'package:instagram_app/models/post_model.dart';

class Postdetailscreen extends StatelessWidget {
  // REMOVA a linha: final dynamic post;
  // REMOVA o construtor antigo: const Postdetailscreen({super.key, required this.post});

  const Postdetailscreen({super.key}); // Deixe o construtor simples

  @override
  Widget build(BuildContext context) {
    // Essa parte que você fez está EXCELENTE, vamos manter para segurança:
    final settings = ModalRoute.of(context)?.settings;

    if (settings == null || settings.arguments == null || settings.arguments is! PostModel) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(backgroundColor: Colors.black),
        body: const Center(
          child: Text("Post não encontrado", style: TextStyle(color: Colors.white)),
        ),
      );
    }

    final postData = settings.arguments as PostModel;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        // Botão para voltar (Navigator.pop)
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(child: Column(children: [_itemPost(postData)])),
    );
  }

  Widget _itemPost(PostModel post) {
    final String imagemValida = post.imageUrl ?? "https://picsum.photos/500/500?random=${post.id}";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Cabeçalho (Foto de perfil e Nome)
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage("URL_DA_FOTO_DE_PERFIL"),
              ),
              const SizedBox(width: 10),
              Text(
                "Nome do Usuário", // Ou post.userName se você tiver no modelo
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),

        // 2. A Imagem Principal (Com o Hero para a animação)
        Hero(
          tag: post.id.toString(),
          child: Image.network(
            imagemValida,
            width: double.infinity,
            fit: BoxFit.contain, // Contain para mostrar a foto inteira sem cortar
          ),
        ),

        // 3. Barra de Ações (Curtir, Comentar, Enviar)
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Icon(Icons.favorite_border, color: Colors.white),
              SizedBox(width: 15),
              Icon(Icons.chat_bubble_outline, color: Colors.white),
              SizedBox(width: 15),
              Icon(Icons.send_outlined, color: Colors.white),
            ],
          ),
        ),

        // 4. Legenda
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(post.username ?? "Sem legenda", style: const TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
