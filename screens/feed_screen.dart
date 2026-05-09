import 'package:flutter/material.dart';
import 'package:instagram_app/providers/post_provider.dart';
import 'package:instagram_app/models/post_model.dart';
import 'package:instagram_app/themeColors/appColors.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key}); // Adicionado const e corrigido construtor

  @override
  Widget build(BuildContext context) {
    // A tela principal deve rolar para BAIXO (Vertical)

    final postProvider = Provider.of<PostProvider>(context);

    if (postProvider.posts.isEmpty && !postProvider.loading) {
      Future.microtask(() => postProvider.fetchPost());
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          // 1. ÁREA DE STORIES (Rola para o lado)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: postProvider.posts.map((post) {
                return Column(
                  children: [
                    _itemStory(post.username ?? "", post.imageUrl),
                    SizedBox(
                      width: 70,
                      child: Text(
                        post.username ?? "User",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppcolorsHomeScreen.colorsIcons),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                );
              }).toList(), // Transforma o mapeamento de volta em uma lista de widgets
            ),
          ),

          // 2. ÁREA DE POSTS
          Column(
            // AQUI ESTÁ O AJUSTE: O map já entrega a lista pronta para o children
            children: postProvider.posts.map((post) => _itemPost(post)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _itemStory(String nome, String? imageUrl) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.amber,
            backgroundImage: imageUrl != null && imageUrl.isNotEmpty
                ? NetworkImage(imageUrl)
                : const NetworkImage("https://via.placeholder.com/150"),
          ),
        ],
      ),
    );
  }
}

Widget _itemPost(PostModel post) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // 1. Cabeçalho (Avatar + Nome)
      ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        leading: CircleAvatar(
          radius: 16,
          backgroundImage: NetworkImage("https://picsum.photos/200/200?random=${post.userId}"),
        ),
        title: Text(
          post.username ?? "Usuário",
          style: TextStyle(color: AppcolorsHomeScreen.plainText, fontWeight: FontWeight.bold),
        ),
      ),

      // 2. Imagem Principal (Agora com preenchimento total)
      Image.network(
        post.imageUrl ?? "https://via.placeholder.com/350",
        height: 350,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            Container(height: 350, color: AppcolorsHomeScreen.textInstagram),
      ),

      // 3. Barra de Interação (Ícones)
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0), // Alinhado com 12
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.favorite_border, color: Colors.white, size: 28),
                const SizedBox(width: 5),
                const Text("45", style: TextStyle(color: Colors.white)),
                const SizedBox(width: 15),
                Icon(Icons.mode_comment_outlined, color: Colors.white, size: 26),
                const SizedBox(width: 5),
                const Text("30", style: TextStyle(color: Colors.white)),
                const SizedBox(width: 15),
                Icon(Icons.send_outlined, color: Colors.white, size: 26),
              ],
            ),
            const Icon(Icons.bookmark_border, color: Colors.white, size: 28),
          ],
        ),
      ),

      // 4. Legenda
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        child: RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.white, fontSize: 14),
            children: [
              TextSpan(
                text: "${post.username} ",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: post.body),
            ],
          ),
        ),
      ),
      const SizedBox(height: 12), // Espaço entre um post e outro
    ],
  );
}
