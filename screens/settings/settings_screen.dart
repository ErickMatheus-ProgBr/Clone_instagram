import 'package:flutter/material.dart';
import 'package:instagram_app/screens/settings/widgets/drawer/privacySection.dart';
import 'package:instagram_app/screens/settings/widgets/drawer/search_bar_widget.dart';
import 'package:instagram_app/screens/settings/widgets/drawer/accountSection.dart';
import 'package:instagram_app/screens/settings/widgets/drawer/usageSection.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        title: Text(
          "Configurações e atividade",
          style: TextStyle(
            color: Colors.white,
            fontSize: 19.2,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.4,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            MySearchBar(), // Widget do campo de busca
            AccountSection(), // Widget do bloco "Sua Conta"
            Divider(thickness: 2, color: Color(0xFF262626)),
            UsageSection(), // Widget do bloco "Como usar o Instagram"
            Divider(thickness: 2, color: Color(0xFF262626)),
            PrivacySection(), // Widget do bloco "Quem pode ver"
            Divider(thickness: 2, color: Color(0xFF262626)),

            Align(
              alignment: Alignment.centerLeft, // 🟢 Força tudo que está dentro a ir para a esquerda
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets
                      .zero, // Remove os espaçamentos internos padrões do botão para colar bem na esquerda
                ),
                child: const Text(
                  "Sair",
                  style: TextStyle(color: Color(0xFFFFAD4E47), fontSize: 19, letterSpacing: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
