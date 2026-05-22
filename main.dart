import 'package:flutter/material.dart';
import 'package:instagram_app/providers/model_provider.dart';
import 'package:instagram_app/providers/post_provider.dart';
import 'package:instagram_app/screens/homeScreen.dart';
import 'package:instagram_app/screens/loginScreen.dart';
import 'package:instagram_app/screens/postDetailScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigatorProvider()),
        ChangeNotifierProvider(create: (_) => PostProvider()),
        ChangeNotifierProvider(create: (_) => PostProviderVideo()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        "/": (context) => const Loginscreen(),
        "/homeScreen": (context) => const Homescreen(),
        "/postDetail": (context) => const Postdetailscreen(),
      },
    );
  }
}
