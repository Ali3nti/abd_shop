import 'dart:io';

import 'package:abd_shop/screens/home/home_page.dart';
import 'package:abd_shop/widget/my_snack_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  goNextPage(BuildContext context) {
    Future.delayed(const Duration(seconds: 0)).then(
      (value) async {
        try {
          bool isConnect = false;
          // async function for checking connectivity
          var connectivity = await (Connectivity().checkConnectivity());
          if (connectivity == ConnectivityResult.mobile) {
            //check mobile data for connectivity
            isConnect = true;
          } else if (connectivity == ConnectivityResult.wifi) {
            //check wifi for connectivity
            isConnect = true;
          } else {
            //No connectivity
            isConnect = false;
          }
          if (isConnect) {
            try {
              // Lookup URL for check connectivity
              final result =
                  await InternetAddress.lookup('www.alinematollahi.ir');
              if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                //Go to the next page (HomePage)
                return Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              } else {
                //TODO: Define way to show refresh button
                MySnackBar(
                    label: "تلاش مجدد",
                    onPress: () {},
                    context: context,
                    message: 'ارتباط با سرور برقرار نشد!',
                    isWarning: true);
              }
            } on SocketException catch (e) {
              throw Exception(
                  'SocketException - splash_page.dart - checkConnectivity(): $e');
            }
          } else {
            //Show Snackbar and show refresh button
            print("no internet");
            //TODO: Define way to show refresh button
            MySnackBar(
                label: "تلاش مجدد",
                onPress: () {},
                context: context,
                message: 'اتصال به اینترنت را بررسی کنید',
                isWarning: true);
          }
        } catch (e) {
          throw Exception(
              'Exception - splash_page.dart - checkConnectivity(): $e');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    goNextPage(context);
    return Scaffold(
      //backgroundColor: Colors.orange,

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.yellowAccent, Colors.orange],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0.05, 0.7],
            tileMode: TileMode.repeated,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 200,
              width: 300,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 36),
                child: Text(
                  "پرتاب از فروشگاه نزدیک شما",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            // SpinKitThreeBounce(
            //   color: Colors.white,
            //   size: 14,
            // ),
            SpinKitThreeBounce(
              size: 20,
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: index.isEven ? Colors.white : Colors.yellow,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
