import 'package:flutter/material.dart';
import 'package:instagram_app/services/auth_services.dart';
import 'package:instagram_app/themeColors/appColors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_app/core/utils/mediaQuery.dart';
import 'package:firebase_auth/firebase_auth.dart'; // 🌟 Importante para ler o Firebase
import 'package:instagram_app/services/auth_services.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  // 1. Controladores para capturar o texto dos inputs
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // 1. Primeiro, instancie o seu serviço no topo do estado da sua tela de login:
  final AuthService _authService = AuthService();

  // 3. Variável para controlar o desenho do carregamento na tela
  bool _isLoading = false;

  // Função reestruturada
  Future<void> _login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showAlert("Please fill in all fields!");
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      String result = await _authService.loginEmailPassword(email, password);

      if (result == "Success") {
        // Se deu sucesso, navega para a Home eliminando o login da memória;
        if (mounted) {
          Navigator.pushReplacementNamed(context, "/homeScreen");
        }
      } else {
        // Se retornou qualquer outra String, significa que é uma mensagem de erro  mapeada
        _showAlert(result);
      }
    } catch (e) {
      _showAlert("Unexpected error processing login.");
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showAlert(String message) {
    showDialog(
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
              onPressed: () => Navigator.pop(context),
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
    // Inicializa as dimensões baseadas no contexto atual da tela
    ScreenSizeLogin().init(context);
    // Definindo uma largura padrão para botões e inputs (90% da tela)
    double defaultWidth = ScreenSizeLogin.screenWidth * 0.92;

    return Scaffold(
      backgroundColor: const Color(0xFF2E2E2E),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: ScreenSizeLogin.screenHeight),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: ScreenSizeLogin.screenHeight * 0.2),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 75),
                      child: ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color(0xFFFFDC80), // Amarelo (Canto inferior esquerdo)
                              Color(0xFFF77737), // Laranja
                              Color(0xFFFD1D1D), // Vermelho
                              Color(0xFFC13584), // Rosa choque
                              Color(0xFF833AB4), // Roxo
                              Color(0xFF405DE6), // Azul (Canto superior direito)
                            ],
                          ).createShader(bounds);
                        },
                        child: Text(
                          "Instagram",
                          style: TextStyle(fontSize: 47, color: AppColorsLogin.nameInstagramLogin),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenSizeLogin.screenWidth * 0.02),
                  child: TextField(
                    controller: _emailController,
                    style: TextStyle(color: AppColorsLogin.genericWhite),
                    maxLength: 30, // Limita a 30 caracteres
                    maxLines: 1, // Garante que o nome de usuário não pule linha
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: ScreenSizeLogin.screenHeight * 0.024,
                        horizontal: ScreenSizeLogin.screenWidth * 0.03,
                      ),
                      hintText: "Nome de usúario, email ou celular",
                      counterText: "",
                      hintStyle: TextStyle(
                        color: AppColorsLogin.genericWhite,
                        fontSize: 15,
                        wordSpacing: 1,
                        letterSpacing: 1.5,
                      ),
                      filled: true,
                      fillColor: AppColorsLogin.loginBackground,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: AppColorsLogin.borderTextField),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: AppColorsLogin.borderTextfield),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 17),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenSizeLogin.screenWidth * 0.02),
                  child: TextField(
                    controller: _passwordController,
                    style: TextStyle(color: AppColorsLogin.genericWhite),
                    obscureText: true,
                    maxLength: 30, // Limita a 30 caracteres
                    maxLines: 1, // Garante que o nome de usuário não pule linha
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: ScreenSizeLogin.screenHeight * 0.024,
                        horizontal: ScreenSizeLogin.screenWidth * 0.03,
                      ),
                      hintText: "Senha",
                      counterText: "",
                      hintStyle: TextStyle(
                        color: AppColorsLogin.genericWhite,
                        fontSize: 15,
                        letterSpacing: 2,
                      ),
                      filled: true,
                      fillColor: AppColorsLogin.loginBackground,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: AppColorsLogin.borderTextField),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: AppColorsLogin.borderTextfield, width: 1.5),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 17),

                ElevatedButton(
                  // Se _isLoading for verdadeiro, passamos 'null' para desativar o botão visualmente.
                  // Se for falso, passamos a nossa função _login.
                  onPressed: _isLoading
                      ? null
                      : () {
                          _login();
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColorsLogin.btnEnter,
                    minimumSize: Size(defaultWidth * 1.03, 48),
                    // Altera a cor de fundo do botão automaticamente quando ele estiver desativado/carregando
                    disabledBackgroundColor: AppColorsLogin.btnEnter.withOpacity(0.5),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.5, // Deixa a rodinha mais fina e elegante
                          ),
                        )
                      : const Text(
                          "Entrar",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                ),

                const SizedBox(height: 7),

                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/resetPassword");
                  },
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: AppColorsLogin.genericWhite,
                      fontSize: 16,
                      letterSpacing: 0.7,
                    ),
                  ),
                ),

                const Spacer(),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: ScreenSizeLogin.screenHeight * 0.1),

                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColorsLogin.loginBackground,
                            minimumSize: Size(defaultWidth * 1.03, 48),
                            side: const BorderSide(color: AppColorsLogin.btnEnter),
                          ),
                          child: Text(
                            "Criar nova conta",
                            style: TextStyle(
                              color: AppColorsLogin.btnEnter,
                              fontSize: 16.6,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.7,
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.meta, // O 's' no final de Icons é fundamental
                              color: AppColorsLogin.genericWhite,
                              size: 17,
                            ),
                            const SizedBox(width: 7),
                            Text(
                              "Meta",
                              style: TextStyle(
                                color: AppColorsLogin.genericWhite,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
