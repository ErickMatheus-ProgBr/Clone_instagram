import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("erick_matheus_16", style: TextStyle(color: Colors.white)),
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
      // body: ,
    );
  }
}
