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
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.65)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(radius: 42, backgroundImage: AssetImage("assets/images/erick.png")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
