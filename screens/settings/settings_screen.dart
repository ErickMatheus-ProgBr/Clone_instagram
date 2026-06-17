import 'package:flutter/material.dart';
import 'package:instagram_app/screens/settings/widgets/privacySection.dart';
import 'package:instagram_app/screens/settings/widgets/search_bar_widget.dart';
import 'package:instagram_app/screens/settings/widgets/accountSection.dart';
import 'package:instagram_app/screens/settings/widgets/usageSection.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
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
          ],
        ),
      ),
    );
  }
}
