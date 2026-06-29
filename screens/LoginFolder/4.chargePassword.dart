import 'package:flutter/material.dart';
import 'package:instagram_app/core/utils/media_query.dart';

class Chargepassword extends StatefulWidget {
  const Chargepassword({super.key});

  @override
  State<Chargepassword> createState() => _ChargepasswordState();
}

class _ChargepasswordState extends State<Chargepassword> {
  @override
  Widget build(BuildContext context) {
    // Inicializa as dimensões baseadas no contexto atual da tela
    ScreenSizeLogin().init(context);
    // Definindo uma largura padrão para botões e inputs (90% da tela)
    double defaultWidth = ScreenSizeLogin.screenWidth * 0.92;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(
          "Redefinir sua Senha",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        leading: BackButton(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.centerLeft,
            colors: [
              Color.fromARGB(255, 121, 76, 151),
              Color.fromARGB(255, 161, 76, 76),
              Color.fromARGB(255, 29, 29, 28),
            ],
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 14),
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.purple, Colors.pink, Colors.orange],
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 136, 97, 97),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 41,
                    backgroundImage: AssetImage("assets/images/erick.png"),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Crie uma nova senha para sua conta erick@gmail.com",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 214, 214, 214),
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),

                  const SizedBox(height: 13),

                  TextField(
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                    maxLength: 30,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Nova senha",
                      counterText: "",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        wordSpacing: 1,
                        letterSpacing: 1.5,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(65),
                        borderSide: BorderSide(color: const Color(0xFF919191), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(70),
                        borderSide: BorderSide(color: const Color(0xFF8B8B8B), width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 13),
                  TextField(
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                    maxLength: 30,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Confirmar nova senha",
                      counterText: "",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        wordSpacing: 1,
                        letterSpacing: 1.5,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(65),
                        borderSide: BorderSide(color: const Color(0xFF919191), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(70),
                        borderSide: BorderSide(color: const Color(0xFF8B8B8B), width: 2),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(defaultWidth * 1.03, 48),
                      backgroundColor: const Color.fromARGB(255, 26, 116, 189),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Redefinir Senha",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
