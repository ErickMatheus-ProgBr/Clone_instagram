import 'package:flutter/material.dart';
import 'package:instagram_app/themeColors/appColors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_app/core/utils/mediaQuery.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

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
                    Navigator.pushNamed(context, '/homeScreen');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColorsLogin.btnEnter,
                    minimumSize: Size(defaultWidth * 1.03, 48),
                  ),
                  child: Text(
                    "Entrar",
                    style: TextStyle(color: AppColorsLogin.genericWhite, fontSize: 16.6),
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
