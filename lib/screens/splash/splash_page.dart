import 'dart:io';
import 'package:abd_shop/constant/constants.dart';
import 'package:abd_shop/screens/category/global.dart';
import 'package:abd_shop/models/category_model.dart';
import 'package:abd_shop/screens/home/components/home_body.dart';
import 'package:abd_shop/services/api_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isLoading = true;
  bool hasError = false;

  void goNextPage() async {
    try {
      bool isConnect = false;
      var connectivity = await (Connectivity().checkConnectivity());
      if (connectivity == ConnectivityResult.mobile ||
          connectivity == ConnectivityResult.wifi) {
        isConnect = true;
      }

      if (isConnect) {
        final result = await InternetAddress.lookup('www.mehdidehghani.ir');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          final value = await getAllCategories();
          if (value.status == 1) {
            var data = value.data;
            for (var item in data) {
              allCategoriesList.add(CategoryModel.fromJSON(item));
            }
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeBody(),
              ),
            );
          } else {
            setState(() {
              hasError = true;
              isLoading = false;
            });
          }
        } else {
          setState(() {
            hasError = true;
            isLoading = false;
          });
        }
      } else {
        setState(() {
          hasError = true;
          isLoading = false;
        });
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      goNextPage();
    });
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
            if (isLoading) // اگر در حال بارگذاری است
              const SpinKitFadingCircle(
                color: Colors.white,
                size: 50.0,
              )
            else if (hasError) // اگر خطا وجود دارد
              InkWell(
                onTap: () {
                  setState(() {
                    isLoading = true;
                    hasError = false;
                  });
                  goNextPage();
                },
                child: Container(
                  padding: EdgeInsets.only(top: 7),
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
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Icon(
                        Icons.refresh,
                        color: kPrimaryColor,
                        size: 18,
                      ),
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
