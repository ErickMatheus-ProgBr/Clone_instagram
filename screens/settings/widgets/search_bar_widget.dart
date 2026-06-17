import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 11, vertical: 10),
      child: TextField(
        style: TextStyle(fontSize: 18.4, letterSpacing: 0.3, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          hintText: "Pesquisar",
          hintStyle: TextStyle(color: const Color(0xFF6B6767)),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10, right: 5, bottom: 1),
            child: Icon(Icons.search_outlined, color: Color(0xFF6B6767)),
          ),
          prefixIconConstraints: BoxConstraints(minHeight: 2, maxWidth: 40),
          filled: true,
          fillColor: const Color.fromARGB(255, 39, 37, 37),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
