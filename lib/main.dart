import 'package:abd_shop/screens/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      // TODO: Add Splash screen in the main on below
      // replace HomePage() with SplashPage()
      // in lib directory, create a splash directory and then create
      // splash_page.dart in its own directory
      home: const HomePage(),
    );
  }
}
