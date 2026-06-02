import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Chargepassword extends StatefulWidget {
  const Chargepassword({super.key});

  @override
  State<Chargepassword> createState() => _ChargepasswordState();
}

class _ChargepasswordState extends State<Chargepassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Redefinir sua Senha"), centerTitle: true, leading: BackButton()),
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
        child: Container(decoration: BoxDecoration(color: Colors.black.withOpacity(0.65))),
      ),
    );
  }
}
