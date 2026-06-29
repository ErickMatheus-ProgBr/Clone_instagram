import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // 🌟 Importa o núcleo do Firebase
import 'package:instagram_app/screens/LoginFolder/4.chargePassword.dart';
import 'package:instagram_app/screens/LoginFolder/2.resetPassword.dart';
import 'package:instagram_app/screens/LoginFolder/3.verifyEmail.dart';
import 'package:instagram_app/screens/LoginFolder/auth_check.dart';
import 'firebase_options.dart'; // 🌟 O arquivo secreto que o CLI gerou para você!
import 'package:instagram_app/providers/model_provider.dart';
import 'package:instagram_app/providers/post_provider.dart';
import 'package:instagram_app/screens/Home/homeScreen.dart';
import 'package:instagram_app/screens/Feed/postDetailScreen.dart';
import 'package:provider/provider.dart';
import 'package:camera/camera.dart';

late CameraDescription firstCamera;

void main() async {
  // 🧠 CONCEITO APRENDIZADO: WidgetsFlutterBinding
  // Esse comando avisa a engine do Flutter (C++) para preparar os canais de comunicação
  // com o sistema operacional (Android/iOS) antes de rodar qualquer código assíncrono.
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();

  firstCamera = cameras.first;

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
        // 🟢 1. Passamos a câmera global para o verificador de autenticação (sem const)
        "/": (context) => AuthCheck(camera: firstCamera),

        // 🟢 2. Corrigido de 'firstca' para 'firstCamera' e removido o 'const'
        "/homeScreen": (context) => Homescreen(camera: firstCamera),

        // As outras rotas não usam a câmera, então podem continuar com const!
        "/resetPassword": (context) => const ResetPassword(),
        "/postDetail": (context) => const Postdetailscreen(),
        "/verifyEmail": (context) => const VerifyEmail(),
        "/newPassword": (context) => const Chargepassword(),
      },
    );
  }
}
