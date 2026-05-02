import 'package:flutter/material.dart';
import 'package:instagram_app/models/modelProvider.dart';
import 'package:instagram_app/screens/homeScreen.dart';
import 'package:instagram_app/screens/loginScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NavigatorProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //
      home: Loginscreen(),
      initialRoute: '/',
      routes: {"/homeScreen": (context) => const Homescreen()},
    );
  }
}
