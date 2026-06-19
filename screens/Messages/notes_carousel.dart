import 'package:flutter/material.dart';
import 'package:instagram_app/providers/post_provider.dart';
import 'package:provider/provider.dart';

class NotesCarousel extends StatelessWidget {
  const NotesCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final postProviderNotes = Provider.of<PostProvider>(context);

    if (postProviderNotes.posts.isEmpty && !postProviderNotes.loading) {
      Future.microtask(() => postProviderNotes.fetchPost());
    }

    return SizedBox(
      height: 30,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // Meu bilhete
            _buildNoteItem("Seu bilhete", "Deixar nota", Colors.grey, true),
            _buildNoteItem("Gabi_silva", "Que dia corrido! 😅", Colors.purple, false),
            _buildNoteItem("Marcos.dev", "Café + Código ☕", Colors.green, false),
            _buildNoteItem("Ana_clara", "Viajando... ✈️", Colors.orange, false),
            _buildNoteItem("Lucas_dev", "Música boa 🎧", Colors.red, false),

            // Bilhete dos meus seguidores
          ],
        ),
      ),
    );
  }

  Widget _buildNoteItem(String nome, String notas, Color corAvatar, bool isMe) {
    return Column();
  }
}
