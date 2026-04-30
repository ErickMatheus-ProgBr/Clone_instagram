import 'package:flutter/material.dart';
import 'package:instagram_app/themeColors/appColors.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: TextField(
              maxLength: 30, // Limita a 30 caracteres
              maxLines: 1, // Garante que o nome de usuário não pule linha
              decoration: InputDecoration(
                hintText: "Nome de usúario, email ou celular",
                hintStyle: TextStyle(color: AppColorsLogin.genericWhite, fontSize: 14),
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
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: TextField(
              maxLength: 30, // Limita a 30 caracteres
              maxLines: 1, // Garante que o nome de usuário não pule linha
              decoration: InputDecoration(
                hintText: "Senha",
                hintStyle: TextStyle(color: AppColorsLogin.genericWhite, fontSize: 14),
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
              minimumSize: Size(380, 50),
            ),
            child: Text(
              "Entrar",
              style: TextStyle(
                color: AppColorsLogin.genericWhite,
                fontSize: 16.6,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          TextButton(
            onPressed: () {},
            child: Text(
              "Esqueceu a sennha?",
              style: TextStyle(
                color: AppColorsLogin.genericWhite,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColorsLogin.btnEnter,
              minimumSize: Size(380, 50),
            ),
            child: Text(
              "Criar nova conta",
              style: TextStyle(
                color: AppColorsLogin.genericWhite,
                fontSize: 16.6,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
