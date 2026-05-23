import 'package:flutter/material.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text(
              "Configurações e atividades",
              style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white),
            title: const Text("Configurações da Conta", style: TextStyle(color: Colors.white)),
            // onTap: () {
            //   Navigator.pop(context);
            //   Navigator.push(
            //     context,
            //     // MaterialPageRoute(builder: (context) => const ScreenConfigPage()),
            //   );
            // },
          ),
        ],
      ),
    );
  }
}
