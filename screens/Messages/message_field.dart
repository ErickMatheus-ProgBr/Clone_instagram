import 'package:flutter/material.dart';

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
            style: TextStyle(color: Colors.white, fontSize: 1), //
          ),
        ],
      ),
    );
  }
}
