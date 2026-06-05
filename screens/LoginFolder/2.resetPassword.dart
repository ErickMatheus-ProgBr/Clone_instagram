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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
          child: Column(
            children: [
              // ICONE
              Icon(
                Icons.lock_clock_outlined, //
                color: Colors.white, //
                size: 55,
              ),

              SizedBox(height: 25),

              Column(
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

              SizedBox(height: 15),

              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "E-mail, nome de usuário ou celular",
                  hintStyle: TextStyle(color: const Color(0xFFACACAC), fontSize: 14.4), //
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: Colors.white, width: 1.5),
                  ),
                  prefixIcon: Icon(
                    Icons.person_search_rounded, //
                    color: Colors.white,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ), //
              ),

              SizedBox(height: 15),

              // BOTÃO
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/verifyEmail");
                }, //
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 28, 135, 223),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 150),
                  elevation: 5,
                  minimumSize: Size(200, 42),

                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
                ),

                child: Text("Continuar", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
