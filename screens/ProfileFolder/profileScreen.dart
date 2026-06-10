import 'package:flutter/material.dart';
import 'package:instagram_app/models/video_model/videoModel.dart';
import 'package:instagram_app/providers/post_provider.dart';
import 'package:instagram_app/screens/settings/settings_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    // Dispara a busca na API logo após o primeiro frame da tela ser desenhado
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<PostProviderVideo>().loadingVideoService();
      }
    });
  }

  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final navigationProviderProfile = context.watch<PostProvider>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "erick_matheus_16",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Colors.black,
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: Icon(Icons.menu, color: Colors.white, size: 32),
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.add, color: Colors.white, size: 34),
        ),
      ),
      endDrawer: DrawerCustom(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 42,
                        backgroundImage: AssetImage("assets/images/erick.png"),
                      ),
                      Positioned(
                        bottom: 3,
                        right: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 0.2),
                          ),
                          child: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 28),
                          child: Text(
                            "Erick Matheus",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 7),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildStatItem("5", "posts"),
                            _buildStatItem("315", "seguidores"),
                            _buildStatItem("1.319", "seguindo"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),

                  Text(
                    "💻 | Engenheiro da Computação\n🗣️ | TikToker nas horas vagas\n📍 | Curitiba - PR",
                    style: TextStyle(
                      fontSize: 15.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  _buildBtnProfile("Editar"),
                  const SizedBox(width: 7),
                  _buildBtnProfile("Compartilhar perfil"),
                ],
              ),
              const SizedBox(height: 12),

              _buildProfileTabs(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildStatItem(String count, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        count,
        style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 1, width: 95),
      Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 15.7, fontWeight: FontWeight.w500),
      ),
    ],
  );
}

Widget _buildBtnProfile(String label) {
  return Expanded(
    child: FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: Size(0, 33),
        backgroundColor: const Color(0xFF424242),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(9)),
      ),
      onPressed: () {
        print("Clique no botão 'Editar'");
      },
      child: Text(label, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
    ),
  );
}

Widget _buildProfileTabs(BuildContext context) {
  return DefaultTabController(
    length: 4,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TabBar(
          indicatorPadding: EdgeInsetsGeometry.symmetric(horizontal: -20),
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Color(0xFFACACAC),
          tabs: [
            Tab(icon: Icon(Icons.grid_on, color: const Color(0xFFACACAC), size: 27)),
            Tab(
              icon: Icon(Icons.movie_creation_outlined, color: const Color(0xFFACACAC), size: 27),
            ),
            Tab(icon: Icon(Icons.repeat, color: const Color(0xFFACACAC), size: 27)),
            Tab(icon: Icon(Icons.person_pin_outlined, color: const Color(0xFFACACAC), size: 27)),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 3.1,
          child: TabBarView(
            children: [
              _PostsGrid(context),
              _PostsGrid(context),
              _PostsGrid(context),
              _PostsGrid(context),

              // _ReelsGrid(),
              // _RepostsGrid(),
              // _TaggedGrid(),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _PostsGrid(BuildContext context) {
  // Lendo o provedor usando o context que passamos por parâmetro
  final provider = Provider.of<PostProviderVideo>(context);

  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: provider.videoProfile.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      childAspectRatio: 1.0, // Quadrado perfeito igual ao Insta real
    ),
    itemBuilder: (context, index) {
      final Video video = provider.videoProfile[index];

      return GestureDetector(
        onTap: () {
          print("Clicou no post: ${video.title} ;- Curtidas: ${video.likes}");
        },
        child: Image.network(
          video.thumbnailUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(color: Colors.grey[900]);
          },
        ),
      );
    },
  );
}

// Widget _ReelsGrid() {
//   return GridView.builder(
//     shrinkWrap: true,
//     physics: const NeverScrollableScrollPhysics(),
//     itemCount: 6,
//     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2,
//       crossAxisSpacing: 1.5,
//       mainAxisSpacing: 1,
//       childAspectRatio: 0.63,
//     ),
//     itemBuilder: (context, index) {
//       return Image.network("https://picsum.photos/100?random=$index", fit: BoxFit.cover);
//     },
//   );
// }
