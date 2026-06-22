import 'package:flutter/material.dart';
import 'package:instagram_app/screens/Messages/message_field.dart';
import 'package:instagram_app/screens/Messages/notes_carousel.dart';
import 'package:instagram_app/models/chat_model.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Vamos utilizar o GestureDetector para garantirmos que ao sair do textfield(ao clicar em qualquer lugar
    // da tela, o foco do textfield nao apareça para o usúario)
    return GestureDetector(
      // 💡 Essa linha diz: "Preste atenção em qualquer clique, mesmo no fundo preto vazio"
      behavior: HitTestBehavior.opaque,
      // 💥 A MÁGICA: Quando clicar fora, esse comando tira o foco de qualquer TextField na hora!
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
      ),
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
          color: const Color(0xFF9B9898),
          fontSize: 15.9,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
        filled: true,
        fillColor: const Color(0xFF2B2A2A),
        hintText: "Pesquisar",
        prefixIcon: Padding(
          padding: EdgeInsetsGeometry.only(right: 3, left: 10),
          child: Icon(Icons.search_sharp, color: const Color(0xFF9B9898), size: 22),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color.fromARGB(255, 97, 96, 96), width: 1.0),
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
