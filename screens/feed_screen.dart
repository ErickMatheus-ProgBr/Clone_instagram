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
            scrollDirection: Axis.horizontal, // Só os stories rolam horizontalmente
            child: Row(
              children: [
                Column(
                  children: [
                    _itemStory("Erick", Icons.portable_wifi_off_outlined),
                    Text("BLABLABLA", style: TextStyle(color: Colors.white)),
                  ],
                ),
                _itemStory("Erick", Icons.portable_wifi_off_outlined),
                _itemStory("Erick", Icons.portable_wifi_off_outlined),
                _itemStory("Erick", Icons.portable_wifi_off_outlined),
                _itemStory("Erick", Icons.portable_wifi_off_outlined),
                _itemStory("Erick", Icons.portable_wifi_off_outlined),
                _itemStory("Erick", Icons.portable_wifi_off_outlined),
              ],
            ),
          ),

          const Divider(color: Colors.grey),

          // 2. ÁREA DE POSTS
          Column(
            // AQUI ESTÁ O AJUSTE: O map já entrega a lista pronta para o children
            children: postProvider.posts.map((post) => _itemPost(post)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _itemStory(String nome, IconData icone) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.amber,
            child: Icon(icone, color: Colors.red),
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
      ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 9.0),
        leading: CircleAvatar(
          radius: 16,
          backgroundImage: NetworkImage("https://picsum.photos/200/200?random=${post.userId}"),
        ),
        title: Text(
          post.username ?? "Usúario",
          style: TextStyle(color: AppcolorsHomeScreen.plainText, fontWeight: FontWeight.bold),
        ),
      ),
      Image.network(
        post.imageUrl ?? "",
        height: 350,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          height: 350,
          color: AppcolorsHomeScreen.textInstagram,
          child: Icon(Icons.broken_image, size: 200),
        ),
      ),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border_sharp, color: AppcolorsHomeScreen.plainText),
                ),
                Text("45", style: TextStyle(color: Colors.white)),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.mode_comment_outlined, color: AppcolorsHomeScreen.plainText),
                ),
                Text("30", style: TextStyle(color: Colors.white)),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.ios_share_outlined, color: AppcolorsHomeScreen.plainText),
                ),
                Text("5", style: TextStyle(color: Colors.white)),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.bookmark_border, color: Colors.white),
            ),
          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        child: RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.white, fontSize: 14),
            children: [
              TextSpan(
                text: "${post.username} ",
                style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextSpan(text: post.body),
            ],
          ),
        ),
      ),
    ],
  );
}
