import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          "Verifique seu E-mail",
          style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF3D3C3C),
        elevation: 0, // Remove aquela sombra feia embaixo da barra
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    // Titulo Principal
                    Text(
                      "Insira o Código", //
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ), //
                    ),

                    const SizedBox(height: 10),
                    Text(
                      "Enviamos um código de 6 digitos para Digite-o abaixo.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16.4),
                    ),

                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(6, (index) {
                        return SizedBox(
                          width: 45,
                          height: 55,
                          child: TextField(
                            autofocus: index == 0 ? true : false,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              counterText: "",
                              filled: true,
                              fillColor: const Color(0xFF1E1E1E),
                              contentPadding: EdgeInsets.zero,

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFF3D3C3C), width: 1),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xff0095f6), width: 2),
                              ),
                            ),
                            onChanged: (value) {
                              if (value.length == 1 && index < 5) {
                                FocusScope.of(context).nextFocus();
                              } else if (value.isEmpty && index > 0) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                          ),
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        children: [
                          Text(
                            "Não recebeu o código? ",
                            style: TextStyle(color: Colors.white, fontSize: 15.4, wordSpacing: 1.3),
                          ),
                          Text(
                            "Reenviar código",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.8,
                              wordSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/newPassword');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 28, 135, 223),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 130),
                        elevation: 5,
                        minimumSize: Size(200, 42),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12),
                        ),
                      ),
                      child: Text("Confirmar", style: TextStyle(fontSize: 17)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Column(
                  children: [
                    Text(
                      "Precisa de ajuda com o código?",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 158, 158, 158),
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 5),
                    InkWell(
                      onTap: () async {
                        final Uri url = Uri.parse('https://help.instagram.com/');

                        await launchUrl(url, mode: LaunchMode.externalApplication);
                      },
                      child: Text(
                        "Entrar em contato com o suporte",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 190, 190, 190),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
