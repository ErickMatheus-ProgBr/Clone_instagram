import 'package:flutter/material.dart';
import 'package:instagram_app/providers/post_provider.dart';
import 'package:instagram_app/models/post_model.dart';

class FeedScreen extends StatelessWidget {
  FeedScreen({super.key}); // Adicionado const e corrigido construtor

  final List<PostModel> listPost = [
    PostModel(
      userId: "Joao_Dev",
      id: "https://i.pravatar.cc/150?u=1",
      postImage: "https://picsum.photos/500/500?random=1",
      caption: "Codando meu clone do Instagram! 🚀",
    ),
    PostModel(
      userId: "Maria_Flutter",
      id: "https://i.pravatar.cc/150?u=2",
      postImage: "https://picsum.photos/500/500?random=2",
      caption: "O Provider é muito legal!",
    ),
    PostModel(
      userId: "Maria_Flutter",
      id: "https://i.pravatar.cc/150?u=2",
      postImage: "https://picsum.photos/500/500?random=2",
      caption: "O Provider é muito legal!",
    ),
    PostModel(
      userId: "Maria_Flutter",
      id: "https://i.pravatar.cc/150?u=2",
      postImage: "https://picsum.photos/500/500?random=2",
      caption: "O Provider é muito legal!",
    ),
    PostModel(
      userId: "Maria_Flutter",
      id: "https://i.pravatar.cc/150?u=2",
      postImage: "https://picsum.photos/500/500?random=2",
      caption: "O Provider é muito legal!",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // A tela principal deve rolar para BAIXO (Vertical)
    return SingleChildScrollView(
      child: Column(
        children: [
          // 1. ÁREA DE STORIES (Rola para o lado)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Só os stories rolam horizontalmente
            child: Row(
              children: [
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
            children: listPost.map((item) => _itemPost(item)).toList(),
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
    crossAxisAlignment: CrossAxisAlignment.start, // alinha o texto a esquerda
    children: [
      ListTile(
        horizontalTitleGap: 10,
        leading: CircleAvatar(radius: 14, backgroundImage: NetworkImage(post.postImage)),
        title: Text(
          post.userId,
          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      Image.network(post.postImage, height: 350, width: double.infinity, fit: BoxFit.cover),

      Row(
        children: [
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border, size: 27)),
              Text("168 mil", style: TextStyle(color: Colors.white)),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20),
              Icon(Icons.chat_bubble_outline, color: Colors.white),
              const SizedBox(width: 6),
              Text("6.201", style: TextStyle(color: Colors.white)),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20),
              Icon(Icons.send, color: Colors.white),
              const SizedBox(width: 2),
              Text("1.231", style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
      Text(post.caption, style: TextStyle(color: Colors.white)),
    ],
  );
}
