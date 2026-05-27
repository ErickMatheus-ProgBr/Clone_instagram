import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        //(Para a tela rolar se o teclado subir)
        child: Column(
          children: [
            Icon(
              Icons.lock_clock_outlined, //
              color: Colors.white, //
              size: 55,
            ),

            SizedBox(height: 10),

            Text("Esqueceu a senha?"),
            Text(
              "Digite seu e-mail, nome de usuário ou celular e enviaremos um link para você recuperar o acesso á sua conta.",
            ),

            TextField(
              decoration: InputDecoration(
                hintText: "E-mail, nome de usuário ou celular",
                hintStyle: TextStyle(color: const Color(0xFFACACAC), fontSize: 14.4), //
                prefixIcon: Icon(
                  Icons.person_search_rounded, //
                  color: Colors.white,
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ), //
            ),
          ],
        ), //
      ),
    );
  }
}
