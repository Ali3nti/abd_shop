import 'package:abd_shop/cart_updater_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:abd_shop/screens/splash/splash_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static Locale locale = const Locale('fa', 'IR');

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(
        create: (context) => CartUpdater(),
    ),
    ],
      child : MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: locale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      title: 'ABD SHOP',
      supportedLocales: const [
        Locale("fa", "IR"),
        Locale("en", "US"),
      ],
      theme: ThemeData(fontFamily: "Yekan", useMaterial3: true),
      home: const SplashPage(),
      ),
    );
  }
}
