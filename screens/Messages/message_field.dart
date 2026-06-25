import 'package:flutter/material.dart';
import 'package:instagram_app/data/chat_data.dart';

class MessageField extends StatefulWidget {
  const MessageField({super.key});

  @override
  State<MessageField> createState() => _MessageFieldState();
}

class _MessageFieldState extends State<MessageField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alinha o título "Mensagens" na esquerda
        children: [
          // Título da Seção
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "Mensagens",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),

          // 🎯 CORREÇÃO CRUCIAL: O Expanded limita o ListView para não travar a Column!
          Expanded(
            child: ListView.builder(
              //
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemCount: ChatData.getConversas().length,
              itemBuilder: (context, index) {
                final item = ChatData.getConversas()[index];

                return ListTile(
                  contentPadding: EdgeInsets.all(3),
                  leading: CircleAvatar(
                    radius: 23,
                    backgroundColor: Colors.blue,

                    child: ClipOval(
                      child: Image.asset(
                        width: double.infinity,
                        height: double.infinity,
                        //
                        item.fotoUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    item.nome,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 251, 251),
                      fontSize: 14.4,
                    ),
                  ),
                  subtitle: Text(
                    item.ultimaMensagem,
                    style: TextStyle(color: const Color.fromARGB(255, 156, 156, 156)),
                  ),
                );
              },
            ), //
          ),
        ],
      ),
    );
  }
}
