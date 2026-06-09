import 'package:flutter/material.dart';
import 'package:instagram_app/services/auth_services.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  // 1. Instancia o nosso gerenciador do Firebase
  final AuthService _authService = AuthService();

  // 2. Cria o controlador para ler o e-mail digitado
  final TextEditingController _emailController = TextEditingController();

  // Variável para mostrar uma rodinha de carregamento no botão
  bool _isLoading = false;

  // Limpa o controlador de memória quando a tela fecha (boa prática)
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // Função de alerta simplificada (já usa o context da árvore de widgets)
  Future<void> _showAlert(String message) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E1E1E),
          title: const Text(
            "System Notification",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: Text(message, style: const TextStyle(color: Colors.grey)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Fecha o Alerta
              child: const Text(
                "OK",
                style: TextStyle(color: Color(0xFF0095F6), fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Column(
            children: [
              // ICONE
              const Icon(Icons.lock_clock_outlined, color: Colors.white, size: 55),

              const SizedBox(height: 25),

              const Column(
                children: [
                  Text("Esqueceu a senha?", style: TextStyle(color: Colors.white, fontSize: 27.5)),
                  SizedBox(height: 7),
                  Text(
                    textAlign: TextAlign.center,
                    "Digite seu e-mail, nome de usuário ou celular e enviaremos um link para você recuperar o acesso á sua conta.",
                    style: TextStyle(color: Colors.white, fontSize: 14.4),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              TextField(
                controller: _emailController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "E-mail, nome de usuário ou celular",
                  hintStyle: const TextStyle(color: Color(0xFFACACAC), fontSize: 14.4),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(color: Colors.white, width: 1.5),
                  ),
                  prefixIcon: const Icon(Icons.person_search_rounded, color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // BOTÃO CONTINUE
              ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () async {
                        String email = _emailController.text.trim();

                        if (email.isEmpty) {
                          await _showAlert("Por favor, insira seu endereço de e-mail!");
                          return;
                        }

                        setState(() {
                          _isLoading = true; // Ativa o carregamento
                        });

                        try {
                          // 🚀 CHAMA O MÉTODO QUE VALIDA E ENVIA O LINK:
                          String resultado = await _authService.enviarEmailDeRecuperacao(email);

                          print("RESULTADO: $resultado");

                          if (resultado == "sucesso") {
                            if (mounted) {
                              // 🔥 Agora sim! Se for sucesso pula direto sem pop-up chato nesta tela
                              Navigator.pushNamed(this.context, "/verifyEmail");
                            }
                          } else {
                            // 🛑 Se o e-mail não existir na base, cai aqui, mostra o erro e BARRA o avanço!
                            if (mounted) await _showAlert(resultado);
                          }
                        } catch (e) {
                          if (mounted) await _showAlert("Ocorreu um erro inesperado.");
                        } finally {
                          if (mounted) {
                            setState(() {
                              _isLoading = false; // Desliga o carregamento
                            });
                          }
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 28, 135, 223),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  elevation: 5,
                  minimumSize: const Size(200, 42),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                      )
                    : const Text("Continue", style: TextStyle(fontSize: 21, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
