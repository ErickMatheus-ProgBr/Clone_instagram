import 'package:flutter/material.dart';
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
    // 🌟 ISSO DAQUI É O QUE ATIVA A CHAMADA DA API ASSIM QUE A TELA ABRE:
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostProvider>().fetchPost();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "erick_matheus_16",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Colors.black,
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              icon: const Icon(Icons.menu, color: Colors.white, size: 32),
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add, color: Colors.white, size: 34),
        ),
      ),
      endDrawer: const DrawerCustom(), // Adicionado const se o Drawer permitir
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
                      const CircleAvatar(
                        radius: 42,
                        backgroundImage: AssetImage("assets/images/erick.png"),
                      ),
                      Positioned(
                        bottom: 3,
                        right: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors
                                .blue, // Ajustado para azul clássico de "Adicionar Story" do Insta
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ), // Borda preta para destacar do avatar
                          ),
                          child: const Icon(Icons.add, color: Colors.white, size: 18),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 28),
                          child: Text(
                            "Erick Matheus",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              const SizedBox(height: 20),
              const Text(
                "💻 | Engenheiro da Computação\n🗣️ | TikToker nas horas vagas\n📍 | Curitiba - PR",
                style: TextStyle(fontSize: 15.5, color: Colors.white, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  _buildBtnProfile("Editar"),
                  const SizedBox(width: 7),
                  _buildBtnProfile("Compartilhar perfil"),
                ],
              ),
              const SizedBox(height: 6),
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
        style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 2),
      Text(
        label,
        style: const TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
      ),
    ],
  );
}

Widget _buildBtnProfile(String label) {
  return Expanded(
    child: FilledButton(
      style: FilledButton.styleFrom(
        minimumSize: const Size(0, 35),
        backgroundColor: const Color(
          0xFF262626,
        ), // Cor cinza oficial do botão do Insta no tema escuro
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8,
          ), // 🟢 CORRIGIDO: Removido o BorderRadiusGeometry incorreto
        ),
      ),
      onPressed: () {
        print("Clique no botão: $label");
      },
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget _buildProfileTabs(BuildContext context) {
  return DefaultTabController(
    length: 4,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const TabBar(
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Color(0xFFACACAC),
          tabs: [
            Tab(icon: Icon(Icons.grid_on, size: 24)), // 1ª Aba: Seus Posts da API
            Tab(icon: Icon(Icons.movie_creation_outlined, size: 24)), // 2ª Aba: Reels (Fica limpa)
            Tab(icon: Icon(Icons.repeat, size: 24)), // 3ª Aba: Republicados (Fica limpa)
            Tab(icon: Icon(Icons.person_pin_outlined, size: 24)), // 4ª Aba: Marcações (Fica limpa)
          ],
        ),
        const SizedBox(height: 0),

        // 🟢 Ajustamos para expandir o conteúdo baseado no grid sem travar o scroll do singlechildscrollview
        SizedBox(
          height: 550, // Altura calculada para exibir as fotos sem sumir da tela
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(), // Evita conflito ao arrastar para o lado
            children: [
              // ⭐ APENAS A PRIMEIRA ABA CHAMA O SEU GRID DINÂMICO
              _postsGrid(context),

              // As outras três abas exibem textos de conteúdo vazio conforme você pediu
              const Center(
                child: Text(
                  "Nenhum vídeo do Reels encontrado",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
              const Center(
                child: Text(
                  "Nenhum post republicado",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
              const Center(
                child: Text(
                  "Nenhuma marcação encontrada",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _postsGrid(BuildContext context) {
  final provider = Provider.of<PostProvider>(context);

  if (provider.loading) {
    return const Center(child: CircularProgressIndicator());
  }

  if (provider.posts.isEmpty) {
    return const Center(child: Text("Nenhum post encontrado"));
  }

  return GridView.builder(
    itemCount: provider.posts.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 1,
      mainAxisSpacing: 2,
    ),
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) {
      final post = provider.posts[index];

      return Image.network(post.imageUrl!, fit: BoxFit.cover);
    },
  );
}
