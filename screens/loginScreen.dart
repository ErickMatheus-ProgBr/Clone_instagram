import 'package:flutter/material.dart';
import 'package:instagram_app/themeColors/appColors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_app/core/utils/mediaQuery.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Inicializa as dimensões baseadas no contexto atual da tela
    ScreenSize().init(context);
    return Scaffold(
      backgroundColor: const Color(0xFF2E2E2E),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 75),
              child: Text(
                "Instagram", //
                style: TextStyle(fontSize: 47, color: AppColorsLogin.nameInstagramLogin),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              maxLength: 30, // Limita a 30 caracteres
              maxLines: 1, // Garante que o nome de usuário não pule linha
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 19),
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
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              maxLength: 30, // Limita a 30 caracteres
              maxLines: 1, // Garante que o nome de usuário não pule linha
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 19),
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
              ),
            ),
          ),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColorsLogin.btnEnter,
              minimumSize: Size(395, 48),
            ),
            child: Text(
              "Entrar",
              style: TextStyle(
                color: AppColorsLogin.genericWhite,
                fontSize: 16.6,
                // fontWeight: FontWeight.bold,
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

          const SizedBox(height: 12),

          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColorsLogin.loginBackground,
                    minimumSize: Size(395, 48),
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
        ],
      ),
    );
  }
}
