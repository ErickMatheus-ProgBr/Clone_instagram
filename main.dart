import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // 🌟 Importa o núcleo do Firebase
import 'package:instagram_app/screens/LoginFolder/resetPassword.dart';
import 'firebase_options.dart'; // 🌟 O arquivo secreto que o CLI gerou para você!
import 'package:instagram_app/providers/model_provider.dart';
import 'package:instagram_app/providers/post_provider.dart';
import 'package:instagram_app/screens/homeScreen.dart';
import 'package:instagram_app/screens/LoginFolder/homeLogin.dart';
import 'package:instagram_app/screens/postDetailScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  // 🧠 CONCEITO APRENDIZADO: WidgetsFlutterBinding
  // Esse comando avisa a engine do Flutter (C++) para preparar os canais de comunicação
  // com o sistema operacional (Android/iOS) antes de rodar qualquer código assíncrono.
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa o Firebase passando as configurações geradas pelo CLI de forma segura
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        "/resetPassword": (context) => const ResetPassword(),
      },
    );
  }
}
