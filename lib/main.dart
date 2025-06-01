import 'package:abd_shop/screens/splash/splash_page.dart';
import 'package:abd_shop/widget/provider/cart_updater_model.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) =>
          MyApp(), // Wrap your app
    ),
  );
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
        ChangeNotifierProvider(create: (context) => CartUpdaterrrrrrr()),
      ],
      child: MaterialApp(
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
