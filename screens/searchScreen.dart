import 'package:flutter/material.dart';
import 'package:instagram_app/models/post_model.dart';
import 'package:instagram_app/providers/post_provider.dart';
import 'package:instagram_app/themeColors/appColors.dart';
import 'package:provider/provider.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          _builderSearchBar(),

          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
              ),
              itemCount: postProvider.posts.length,
              itemBuilder: (context, index) {
                final post = postProvider.posts[index];
                return _builderGridItem(post);
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _builderSearchBar() {
  return Padding(
    padding: const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 10),
    child: Container(
      height: 63,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        border: Border.all(width: 10),
        color: const Color.fromARGB(255, 107, 107, 107),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Pesquisar",
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10, right: 5),
            child: const Icon(Icons.search, color: Color(0xFFE0E0E0), size: 20),
          ),
          prefixIconConstraints: BoxConstraints(minHeight: 10, maxWidth: 50),
          hintStyle: TextStyle(
            color: const Color(0xFFE0E0E0),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 9),
        ),
        keyboardType: TextInputType.text,
        cursorColor: AppcolorsHomeScreen.userName,
      ),
    ),
  );
}

Widget _builderGridItem(PostModel post) {
  return Container(
    color: Colors.tealAccent,
    child: Image.network(
      post.imageUrl ?? "https://picsum.photos/500/500",
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Container(color: Colors.black),
    ),
  );
}
