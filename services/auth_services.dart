import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Instância nativa do FireBase Auth (o seu ponto de contato com a nuvem)
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // FUNÇÃO DE LOGIN REATORADA (A sua lógica, agora organizada!);
  Future<String> loginEmaiLPassword(String email, String password) async {
    try {
      // O flutter envia os dados e guarda a resposta do Firebase
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        return "Success"; // Se o usúario logou, avisa a tela de login
      }
      return "Unknown error";
    } on FirebaseAuthException catch (e) {
      // 🧠 O seu mapeamento de erros perfeito veio para cá:
      if (e.code == 'invalid-email') {
        return "The email address format you entered is incorrect.";
      } else if (e.code == 'user-not-found') {
        return "Nenhum usuário cadastrado com este e-mail.";
      } else if (e.code == 'wrong-password') {
        return "Senha incorreta. Verifique seus dados.";
      }
      return "Erro ao autenticar: ${e.message}";
    } catch (e) {
      return "Ocorreu um erro inesperado: $e";
    }
  }
}
