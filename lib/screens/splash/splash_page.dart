import 'dart:io';
import 'package:abd_shop/constants.dart';
import 'package:abd_shop/screens/base/base_page.dart';
import 'package:abd_shop/global.dart';
import 'package:abd_shop/models/category_model.dart';
import 'package:abd_shop/screens/login/log_In_Page.dart';
import 'package:abd_shop/services/api_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isLoading = true;
  bool hasError = false;

  Future<void> goNextPage() async {
    try {
      // بررسی اتصال اینترنت
      var connectivityResult = await Connectivity().checkConnectivity();
      bool isConnect = connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile);

      if (!isConnect) throw Exception("No internet");

      // بررسی دسترسی به سایت‌ها
      List<String> sitesToCheck = [
        'google.com',
        'torob.com',
        '8.8.8.8',
      ];

      bool isSiteReachable = false;
      if (!kIsWeb) {
        for (String site in sitesToCheck) {
          try {
            final result = await InternetAddress.lookup(site);
            if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
              isSiteReachable = true;
              break;
            }
          } catch (_) {}
        }
      } else {
        isSiteReachable = true;
      }

      if (!isSiteReachable) throw Exception("Site unreachable");

      // دریافت دسته‌بندی‌ها
      final value = await getAllCategories();
      if (value.status != 1) throw Exception("Failed to get categories");

      for (var item in value.data) {
        allCategoriesList.add(CategoryModel.fromJSON(item));
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLoggedIn = prefs.getBool('is_logged_in') ?? false;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => isLoggedIn ? const BasePage() : const LoginPage(),
        ),
      );
    } catch (e) {
      print("Error in goNextPage(): $e");
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), goNextPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepOrange, CupertinoColors.activeOrange],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 300,
              width: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              "خوش آمدید به آباده شاپ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "خریدی آسان و سریع",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 200),
            if (isLoading)
              const SpinKitFadingCircle(color: Colors.white, size: 50.0)
            else if (hasError)
              InkWell(
                onTap: () {
                  setState(() {
                    isLoading = true;
                    hasError = false;
                  });
                  goNextPage();
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 7),
                  width: 70,
                  height: 60,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "تلاش مجدد",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Icon(Icons.refresh, color: kPrimaryColor, size: 18),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
