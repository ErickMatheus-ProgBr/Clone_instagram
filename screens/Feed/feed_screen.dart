import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app/providers/post_provider.dart';
import 'package:instagram_app/models/post_model.dart';
import 'package:instagram_app/screens/Camera/camera_screen.dart';
import 'package:instagram_app/themeColors/appColors.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key, required this.camera});

  final CameraDescription camera;

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  // Uso para utilizarmos a opção da camera
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.medium);

    _initializeControllerFuture = _controller.initialize();
  }

  // Adicionado const e corrigido construtor
  @override
  Widget build(BuildContext context) {
    // A tela principal deve rolar para BAIXO (Vertical)

    final postProvider = Provider.of<PostProvider>(context);

    if (postProvider.posts.isEmpty && !postProvider.loading) {
      Future.microtask(() => postProvider.fetchPost());
    }

    return Scaffold(
      backgroundColor: AppcolorsHomeScreen.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppcolorsHomeScreen.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CameraScreen(camera: widget.camera)),
            );
          },
          icon: Icon(Icons.add, size: 30, color: AppcolorsHomeScreen.colorsIcons),
        ),
        title: Text(
          "Instagram",
          textAlign: TextAlign.center,
          style: TextStyle(color: AppcolorsHomeScreen.plainText),
        ),
        actions: [Icon(Icons.favorite_outline, size: 29, color: AppcolorsHomeScreen.colorsIcons)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. ÁREA DE STORIES (Rola para o lado)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _builderMyStorys(),

                  ...postProvider.posts.map((post) {
                    return Column(
                      children: [
                        _itemStory(post),
                        SizedBox(
                          width: 72,
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
                ],
              ),
            ),

            // 2. ÁREA DE POSTS
            Column(
              // AQUI ESTÁ O AJUSTE: O map já entrega a lista pronta para o children
              children: postProvider.posts.map((post) => _itemPost(post)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _builderMyStorys() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const CircleAvatar(
                    radius: 35.5,
                    backgroundImage: AssetImage("assets/images/erick.png"),
                  ),

                  Positioned(
                    bottom: -2,
                    right: -2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white10, width: 0.5),
                      ),
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text("My Story", style: TextStyle(color: AppcolorsHomeScreen.plainText, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _itemStory(PostModel post) {
    // Alterado para receber o PostModel completo
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        padding: const EdgeInsets.all(2.5), // Espessura da borda colorida
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFFFFDC80), // Amarelo
              Color(0xFFF77737), // Laranja
              Color(0xFFFD1D1D), // Vermelho
              Color(0xFFC13584), // Rosa choque
              Color(0xFF833AB4), // Roxo
              Color(0xFF405DE6), // Azul
            ],
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(3.0), // Anel preto de respiro
          decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
          child: CircleAvatar(
            radius: 35, // Tamanho ajustado para o feed
            backgroundColor: Colors.grey[900],
            // A MÁGICA: Usamos o ID do post para o Pravatar não repetir a foto
            backgroundImage: NetworkImage("https://i.pravatar.cc/300?u=${post.id}"),
          ),
        ),
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 6.0),
        leading: CircleAvatar(
          radius: 16,
          backgroundImage: NetworkImage("https://picsum.photos/200/200?random=${post.userId}"),
        ),
        title: Text(
          post.username ?? "Usuário",
          style: TextStyle(color: AppcolorsHomeScreen.plainText, fontWeight: FontWeight.bold),
        ),
        trailing: IconButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          icon: Icon(Icons.more_horiz_outlined, color: AppcolorsHomeScreen.textInstagram),
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
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.favorite_border_rounded, color: AppcolorsHomeScreen.plainText, size: 28),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Text(
                  "12.334",
                  style: TextStyle(
                    color: AppcolorsHomeScreen.textInstagram,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 15),
              Icon(Icons.mode_comment_outlined, color: AppcolorsHomeScreen.plainText, size: 28),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Text(
                  "4.367",
                  style: TextStyle(
                    color: AppcolorsHomeScreen.textInstagram,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.repeat, color: AppcolorsHomeScreen.plainText, size: 28),
              SizedBox(width: 15),
              Icon(Icons.send_rounded, color: AppcolorsHomeScreen.plainText, size: 28),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Text(
                  "12.334",
                  style: TextStyle(
                    color: AppcolorsHomeScreen.textInstagram,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark_border, color: Colors.white, size: 30),
          ),
        ],
      ),

      // 4. Legenda
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SizedBox(
          width: double.infinity, // força o texto a ocupar a largura toda
          child: RichText(
            softWrap: true,
            text: TextSpan(
              style: TextStyle(color: AppcolorsHomeScreen.textStorys, fontSize: 14),
              children: [
                TextSpan(
                  text: "${post.username} ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: post.body?.replaceAll('\n', ' ')), // Remove quebras de linha da API
              ],
            ),
          ),
        ),
      ),
      const SizedBox(height: 12), // Espaço entre um post e outro
    ],
  );
}
