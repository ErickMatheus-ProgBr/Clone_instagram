import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Instância nativa do FireBase Auth (o seu ponto de contato com a nuvem)
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // FUNÇÃO DE LOGIN REATORADA (A sua lógica, agora organizada!);
  Future<String> loginEmailPassword(String email, String password) async {
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

  Future<String> enviarEmailDeRecuperacao(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);

      return "sucesso";
    } on FirebaseAuthException catch (e) {
      print("CODE: ${e.code}");
      print("MESSAGE: ${e.message}");

      return "Erro: ${e.message}";
    } catch (e) {
      return "Erro inesperado: $e";
    }
  }
}
