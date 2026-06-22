import 'package:flutter/material.dart';
import 'package:instagram_app/screens/Messages/message_field.dart';
import 'package:instagram_app/screens/Messages/notes_carousel.dart';
import 'package:instagram_app/models/chat_model.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "erick_matheus_16",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.3),
        ),
      ),

      body: Column(children: [_searchDirect(), NotesCarousel(), MessageField()]),
    );
  }
}

Widget _searchDirect() {
  return Container(
    padding: EdgeInsets.all(10),
    child: TextField(
      maxLength: 30,
      maxLines: 1,
      decoration: InputDecoration(
        counterText: "",
        hintStyle: TextStyle(
          // Estilo do texto "Pesquisar";
          color: Colors.white,
          fontSize: 15.9,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
        filled: true,
        fillColor: const Color(0xFF5A5858),
        hintText: "Pesquisar",
        prefixIcon: Padding(
          padding: EdgeInsetsGeometry.only(right: 3, left: 10),
          child: Icon(Icons.search_sharp, color: Colors.white, size: 22),
        ),
        prefixIconConstraints: BoxConstraints(
          minHeight: 10, // Altura mínima do espaço do ícone.
        ), // Define limites para o espaço ocupado pelo prefixIcon
        contentPadding: EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 2,
        ), // Espaçamento interno do campo
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        border: InputBorder.none, // remove completamente a borda
      ),
    ),
  );
}
