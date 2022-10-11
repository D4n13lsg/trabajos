import 'package:flutter/material.dart';
import 'package:login/pages/Login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'auth/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(const MyApp());
}

//se crea la clase myapp 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //el debugShowCheckedModeBanner se crea para quitar la marca de agua
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
