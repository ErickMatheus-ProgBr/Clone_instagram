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
      height: 150,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            // Criação de Componentização por métodos, ou podemos dizer que é a
            // Abordagem por Funções de UI
            children: [
              // Meu bilhete
              _buildNoteItem(
                "Seu bilhete",
                "Pergunte algo aos amigos...",
                Image.asset("assets/images/image_erick1.jpg"),
                true,
              ),
              _buildNoteItem(
                "Gabi_silva",
                "Que dia corrido! 😅",
                Image.asset("assets/images/image_erick2.jpg"),
                false,
              ),
              _buildNoteItem(
                "Marcos.dev",
                "Café + Código ☕",
                Image.asset("assets/images/image_erick3.jpg"),
                false,
              ),
              _buildNoteItem(
                "Ana_clara",
                "Viajando... ✈️",
                Image.asset("assets/images/image_erick4.jpg"),
                false,
              ),
              _buildNoteItem(
                "Lucas_dev",
                "Música boa 🎧",
                Image.asset("assets/images/image_erick5.jpg"),
                false,
              ),
              _buildNoteItem(
                "Thiago_dev",
                "Vamos ser feliz :)",
                Image.asset("assets/images/erick.png"),
                false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNoteItem(String nome, String notas, Image image, bool isMe) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, top: 15),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: image.image,
              ), // Usei a variável 'corAvatar' que você recebe por parâmetro

              Positioned(
                top: -22,
                left: -10,
                right: -10,
                child: Center(
                  child: Container(
                    width: 80,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: Text(notas, style: TextStyle(fontSize: 10), textAlign: TextAlign.center),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),
          SizedBox(
            width: 68,
            child: Text(
              nome,
              maxLines: 1,
              style: TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
