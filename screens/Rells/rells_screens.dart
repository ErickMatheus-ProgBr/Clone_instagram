import 'package:flutter/material.dart';
import 'package:instagram_app/models/video_model/videoModel.dart'; // Modelo de video
import 'package:instagram_app/providers/post_provider.dart'; // Ou seu VideoProvider depois
import 'package:provider/provider.dart';

class RellsScreens extends StatefulWidget {
  const RellsScreens({super.key});

  @override
  State<RellsScreens> createState() => _RellsScreensState();
}

class _RellsScreensState extends State<RellsScreens> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);

    final List<Video> mockVideos = List.generate(5, (index) {
      return Video(
        id: index.toString(),
        url: "",
        title: "Meu vídeo incrível de Flutter $index",
        likes: 1200 + index,
        comments: 340 + index,
        thumbnailUrl: "https://picsum.photos/1080/1920?random=$index", // Proporção de tela cheia
        description: "Programando a tela de Reels do Insta! #flutter #dart #dev",
        tags: ["flutter", "dart"],
        uploadDate: "Agora",
        location: "Brasil",
        views: 5000,
        author: Author(
          id: "auth_$index",
          name: "dev_erick",
          avatarUrl: "https://i.pravatar.cc/150?u=$index",
          isVerified: true,
        ),
      );
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: mockVideos.length,
        pageSnapping: true,
        itemBuilder: (context, index) {
          final video = mockVideos[index];
          return _buildReellsItem(video);
        },
      ),
    );
  }
}

Widget _buildReellsItem(Video video) {
  return Stack(
    children: [
      // 1. O VÍDEO DE FUNDO (Por enquanto, a imagem que ocupa a tela toda)
      Positioned.fill(child: Image.network(video.thumbnailUrl, fit: BoxFit.cover)),

      // Gradiente escuro no fundo para ajudar a ler os textos brancos
      Positioned.fill(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.1),
                Colors.transparent,
                Colors.black.withOpacity(0.4),
              ],
            ),
          ),
        ),
      ),

      // 2. AS INFORMAÇÕES DO AUTOR (Canto inferior esquerdo)
      Positioned(
        left: 10,
        bottom: 20,
        right: 80, // Dá espaço para os botões  da direita não atropelarem o texto
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 19, backgroundImage: NetworkImage(video.author.avatarUrl)),
                const SizedBox(width: 11),
                Text(
                  video.author.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                if (video.author.isVerified)
                  const Icon(Icons.verified, color: Colors.white, size: 15),
                SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white, width: 1),
                    minimumSize: const Size(40, 26),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: Text(
                    "Seguir",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              video.description,
              style: TextStyle(color: Colors.white, fontSize: 14.4),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),

      Positioned(
        right: 16,
        bottom: 20,
        child: Column(
          children: [
            _builderActionButton(Icons.favorite_border, video.likes.toString()),
            _builderActionButton(Icons.mode_comment_outlined, video.comments.toString()),
            _builderActionButton(Icons.repeat, video.comments.toString()),
            _builderActionButton(Icons.send_outlined, video.comments.toString()),
            _builderActionButton(Icons.more_vert, ""),
            const SizedBox(height: 10),

            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white, width: 2),
                image: DecorationImage(
                  image: NetworkImage(video.author.avatarUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _builderActionButton(IconData icon, String label) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon, color: Colors.white, size: 28),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        if (label.isNotEmpty) ...[
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 15)),
        ],
      ],
    ),
  );
}
