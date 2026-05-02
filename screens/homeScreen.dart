import 'package:flutter/material.dart';
import 'package:instagram_app/models/modelProvider.dart';
import 'package:instagram_app/themeColors/appColors.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    // Coloque isso antes do build
    final List<Widget> _screens = [
      const Center(
        child: Text("Feed Principal", style: TextStyle(color: Colors.white)),
      ),
      const Center(
        child: Text("Tela de Pesquisa", style: TextStyle(color: Colors.white)),
      ),
      const Center(
        child: Text("Tela de Postagem", style: TextStyle(color: Colors.white)),
      ),
      const Center(
        child: Text("Tela de Reels", style: TextStyle(color: Colors.white)),
      ),
      const Center(
        child: Text("Seu Perfil", style: TextStyle(color: Colors.white)),
      ),
    ];

    final navigationProvider = context.watch<NavigatorProvider>();

    return Scaffold(
      backgroundColor: AppcolorsHomeScreen.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppcolorsHomeScreen.backgroundColor,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.add, size: 30, color: AppcolorsHomeScreen.colorsIcons),
        ),
        title: Text("Instagram", style: TextStyle(color: AppcolorsHomeScreen.plainText)),
        actions: [Icon(Icons.favorite_outline, size: 29, color: AppcolorsHomeScreen.colorsIcons)],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<NavigatorProvider>().currentIndex,
        onTap: (index) => context.read<NavigatorProvider>().updateIndex(index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppcolorsHomeScreen.backgroundColor,
        unselectedItemColor: Colors.red,
        showSelectedLabels: false,

        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Pesquisa'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: 'Postar'),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_outlined),
            label: 'Reels',
          ), // Ícone estilo Reels
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: 'Perfil'),
        ],
      ),
    );
  }
}
