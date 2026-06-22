import '../models/chat_model.dart';

class ChatData {
  static List<ChatModel> getConversas() {
    return [
      ChatModel(
        nome: "Gabi_silva",
        ultimaMensagem: "Viu o Reels que te mandei? 😂",
        fotoUrl: "assets/images/image_erick2.jpg",
        horario: "2 min",
      ),
      ChatModel(
        nome: "Marcos.dev",
        ultimaMensagem: "Aquele bug rodou certinho aqui!",
        fotoUrl: "assets/images/image_erick3.jpg",
        horario: "1 h",
      ),
      ChatModel(
        nome: "Ana_clara",
        ultimaMensagem: "Cheguei na praia! 🏖️",
        fotoUrl: "assets/images/image_erick4.jpg",
        horario: "3 h",
      ),
      ChatModel(
        nome: "Lucas_dev",
        ultimaMensagem: "Amanhã a gente fecha o código.",
        fotoUrl: "assets/images/image_erick5.jpg",
        horario: "Ontem",
      ),
    ];
  }
}
