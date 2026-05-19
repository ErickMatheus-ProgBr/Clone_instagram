import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
      endDrawer: Drawer(
        // Tirar o padding padrão para o conteúdo colar nas bordas
        child: SizedBox(
          width: screenWidth, // <--- Aqui ele ganha 100% da largura da tela!
          child: Column(
            children: [
              // _BuilderDrawerAppBar(context),
              Expanded(
                child: ListView(
                  children: [
                    // _builderDrawerItem(Icon(Icons.settings, "Configurações e privacidades")),
                    // _builderDrawerItem(Icon(Icons.save_alt_sharp, "Salvos")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
        backgroundColor: const Color.fromARGB(255, 66, 66, 66),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
      ),
      onPressed: () {
        print("Clique no botão 'Editar'");
      },
      child: Text(label, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
    ),
  );
}
