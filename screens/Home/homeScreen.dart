import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app/providers/model_provider.dart';
import 'package:instagram_app/screens/Messages/messages_screen.dart';
import 'package:instagram_app/screens/ProfileFolder/profileScreen.dart';
import 'package:instagram_app/screens/Rells/rells_screens.dart';
import 'package:instagram_app/screens/Search/searchScreen.dart';
import 'package:instagram_app/themeColors/appColors.dart';
import 'package:provider/provider.dart';
import 'package:instagram_app/screens/Feed/feed_screen.dart';

class Homescreen extends StatefulWidget {
  final CameraDescription camera;
  const Homescreen({super.key, required this.camera});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Widget> get _navigatorBar => [
    FeedScreen(camera: widget.camera), // Index 0
    RellsScreens(), // Index 1
    MessagesScreen(), // Index 2
    Searchscreen(), // Index 3
    ProfileScreen(), // Index 4
    const Center(
      child: Text("Feed Main", style: TextStyle(color: AppcolorsHomeScreen.colorsIcons)),
    ),
    const Center(
      child: Text("Search Page", style: TextStyle(color: Colors.white)),
    ),
    const Center(
      child: Text("New Publication", style: TextStyle(color: Colors.white)),
    ),
    const Center(
      child: Text("Reels Videos", style: TextStyle(color: Colors.white)),
    ),
    const Center(
      child: Text("My Profile", style: TextStyle(color: Colors.white)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final navigationProvider = context.watch<NavigatorProvider>();

    return Scaffold(
      backgroundColor: AppcolorsHomeScreen.backgroundColor,

      body: _navigatorBar[navigationProvider.currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<NavigatorProvider>().currentIndex,
        onTap: (index) => context.read<NavigatorProvider>().updateIndex(index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppcolorsHomeScreen.backgroundColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,

        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.movie_outlined), label: 'Reels'),
          BottomNavigationBarItem(icon: Icon(Icons.ios_share_sharp), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
        ],
      ),
    );
  }
}
