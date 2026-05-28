import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Verifique seu E-mail", style: TextStyle(color: Colors.white, fontSize: 23)),
        backgroundColor: const Color(0xFF3D3C3C),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Insira o Código", //
                style: TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold), //
              ),
              Text(
                "Enviamos um código de 6 digitos para ..... Digite-o abaixo.",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
