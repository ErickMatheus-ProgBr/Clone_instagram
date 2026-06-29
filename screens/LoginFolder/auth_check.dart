import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_app/screens/Home/homeScreen.dart';
import 'package:instagram_app/screens/LoginFolder/1.homeLogin.dart';

class AuthCheck extends StatelessWidget {
  final CameraDescription camera;
  const AuthCheck({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Homescreen(camera: camera);
        }

        return const Loginscreen();
      },
    );
  }
}
