import 'dart:ui';

class ChatModel {
  final String nome;
  final String ultimaMensagem;
  final String fotoUrl;
  final String horario;

  ChatModel({
    required this.nome,
    required this.ultimaMensagem,
    required this.fotoUrl,
    required this.horario,
  });
}
