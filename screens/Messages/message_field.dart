import 'package:flutter/material.dart';
import 'package:instagram_app/data/chat_data.dart';

class MessageField extends StatelessWidget {
  const MessageField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      child: Column(
        children: [
          Text(
            "Mensagens",
            style: TextStyle(
              color: Colors.white, //
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ), //
          ),
          ListView.builder(
            itemCount: ChatData.getConversas().length, //
            itemBuilder: (context, index) {
              final item = ChatData.getConversas()[index];
              //
              return CircleAvatar(
                radius: 43,
                backgroundColor: Colors.white,
                child: Text(item.nome),
              );
            },
          ),
        ],
      ),
    );
  }
}
