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

  // 🌟 NOVA FUNÇÃO: ADICIONE ESTE BLOCO AQUI ABAIXO (Para a tela ResetPassword)
  Future<String> enviarEmailDeRecuperacao(String email) async {
    try {
      // 🔍 Tentamos simular uma verificação criando um vínculo temporário.
      // Se o e-mail NÃO existir, o Firebase joga direto um erro específico.
      // Mas a forma mais segura e direta de disparar e pegar o erro real é tratando as exceções:

      await _auth.sendPasswordResetEmail(email: email);
      return "sucesso";
    } on FirebaseAuthException catch (e) {
      // O Firebase atualizado joga esses códigos se a proteção estiver desativada no console,
      // ou se o e-mail for totalmente inválido:
      if (e.code == 'invalid-email') {
        return "O formato do e-mail digitado está incorreto.";
      } else if (e.code == 'user-not-found') {
        return "Nenhum usuário cadastrado com este e-mail.";
      }
      return "Erro: ${e.message}";
    } catch (e) {
      return "Erro inesperado: $e";
    }
  }
}
