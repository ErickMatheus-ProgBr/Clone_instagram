import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_app/screens/settings/widgets/itens_settings/settings_item.dart';
import 'package:instagram_app/screens/settings/widgets/itens_settings/settings_item.dart';
import 'package:instagram_app/screens/settings/widgets/itens_settings/settings_tile_widget.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alinha o bloco na esquerda
        children: [
          // 1. TÍTULO: "Sua conta" e "Meta" na mesma linha
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Sua conta",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6B6767),
                ),
              ),

              Row(
                children: [
                  const FaIcon(FontAwesomeIcons.meta, color: Color(0xFFD3CFCF), size: 13),
                  const SizedBox(width: 3),
                  const Text("Meta", style: TextStyle(color: Color(0xFFD3CFCF))),
                ],
              ),
            ],
          ),

          const SizedBox(height: 5), // Dá um espacinho entre o título e o card
          // 2. CONTEÚDO: O bloco da Central de Contas vai logo abaixo
          _accountCenter(),
          // ...items.map((dynamicItem) => SettingsTile(item: dynamicItem)).toList(),
        ],
      ),
    );
  }
}

Widget _accountCenter() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Alinha o ícone no topo do texto
      children: [
        const Icon(Icons.person_outline, color: Colors.white, size: 28),
        const SizedBox(width: 12), // Espaço entre o ícone e os textos
        // Usamos Flexible para o texto longo quebrar linha sem estourar e sem travar a tela
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Alinha os textos à esquerda
            children: [
              const Text(
                "Central de Contas",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Senha, segurança, dados pessoais, experiências conectadas, preferências de anúncios",
                style: TextStyle(color: Color(0xFFACACAC), fontSize: 14.7),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 20, top: 14),
          child: Icon(
            Icons.keyboard_arrow_right_outlined,
            color: const Color(0xFF686666),
            size: 32,
          ),
        ),
      ],
    ),
  );
}
