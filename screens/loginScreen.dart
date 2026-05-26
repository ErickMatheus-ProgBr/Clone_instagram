import 'package:flutter/material.dart';
import 'package:instagram_app/themeColors/appColors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_app/core/utils/mediaQuery.dart';
import 'package:firebase_auth/firebase_auth.dart'; // 🌟 Importante para ler o Firebase

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  // 1. Controladores para capturar o texto dos inputs
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // 2. Instância do serviço de Autenticação
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // 3. Variável para controlar o desenho do carregamento na tela
  bool _isLoading = false;

  // 4. Função assíncrona que faz o envio dos dados
  Future<void> _login() async {
    // .trim() remove espaços em branco que o usuário pode ter digitado sem querer no fim do email
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _mostrarAlerta("Por favor, preencha todos os campos!");
      return;
    }

    setState(() {
      _isLoading = true; // Ativa a rodinha de carregamento
    });

    try {
      // 🚀 COMANDO DE LOGIN: O Flutter envia os dados e aguarda (await) a resposta da nuvem
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Se a nuvem validou e retornou o usuário com sucesso:
      if (userCredential.user != null) {
        // pushReplacement elimina a tela de login da memória.
        // Se o usuário clicar em "voltar" no Android, ele não consegue voltar pra tela de login.
        Navigator.pushReplacementNamed(context, '/home');
      }
    } on FirebaseAuthException catch (e) {
      // 🧠 APRENDIZADO: O Firebase te devolve erros com códigos textuais fixos (e.code)
      // Mapeamos esses códigos para exibir mensagens amigáveis em português na tela.
      String mensagemAmigavel = "Erro ao autenticar. Tente novamente.";

      if (e.code == 'invalid-email') {
        mensagemAmigavel = "O formato do e-mail digitado está incorreto.";
      } else if (e.code == 'user-not-found') {
        mensagemAmigavel = "Nenhum usuário cadastrado com este e-mail.";
      } else if (e.code == 'wrong-password') {
        mensagemAmigavel = "Senha incorreta. Verifique seus dados.";
      }

      _mostrarAlerta(mensagemAmigavel);
    } catch (e) {
      _mostrarAlerta("Ocorreu um erro inesperado: $e");
    } finally {
      // O bloco 'finally' roda OBRIGATORIAMENTE tanto se der certo quanto se der erro.
      // Excelente local para desligar loaders.
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _mostrarAlerta(String mensagem) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(mensagem), backgroundColor: Colors.redAccent));
  }

  @override
  void dispose() {
    // 🧠 APRENDIZADO: Sempre limpe os controladores quando a tela fechar
    // para evitar vazamento de memória (Memory Leak) no celular!
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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

                ElevatedButton(
                  onPressed: () {
                    _login();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColorsLogin.btnEnter,
                    minimumSize: Size(defaultWidth * 1.03, 48),
                  ),
                  child: GestureDetector(
                    onTap: _isLoading
                        ? null
                        : _login, // Se estiver carregando, o botão fica desativado (null)
                    child: Container(
                      // ... suas configurações de tamanho e cor do botão ...
                      child: Center(
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              ) // 🔄 Mostra a rodinha se estiver logando
                            : const Text(
                                "Entrar",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ), // Mostra o texto normal
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 7),

                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Esqueceu a senha?",
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
