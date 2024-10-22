import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:abd_shop/screens/home/home_page.dart';
import 'package:abd_shop/screens/login/log_in.dart';
import 'package:abd_shop/widget/my_snack_bar.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  void goNextPage(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then(
          (value) async {
        try {
          bool isConnect = false;
          var connectivity = await (Connectivity().checkConnectivity());
          if (connectivity == ConnectivityResult.mobile || connectivity == ConnectivityResult.wifi) {
            isConnect = true;
          }

          if (isConnect) {
            final result = await InternetAddress.lookup('www.digikala.com');
            if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LogIn(),
                ),
              );
            } else {
              MySnackBar(
                label: "تلاش مجدد",
                onPress: () {},
                context: context,
                message: 'ارتباط با سرور برقرار نشد!',
                isWarning: true,
              );
            }
          } else {
            MySnackBar(
              label: "تلاش مجدد",
              onPress: () {},
              context: context,
              message: 'اتصال به اینترنت را بررسی کنید',
              isWarning: true,
            );
          }
        } catch (e) {
          throw Exception('Error checking connectivity: $e');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    goNextPage(context);
    return Scaffold(
      body: Container(
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
              "assets/images/logo.png", // لوگوی دیجیکالا
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
            SpinKitFadingCircle(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}


//
// import 'dart:io';
//
// import 'package:abd_shop/screens/home/home_page.dart';
// import 'package:abd_shop/screens/login/log_in.dart';
// import 'package:abd_shop/widget/my_snack_bar.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
//
// class SplashPage extends StatelessWidget {
//   const SplashPage({super.key});
//
//   goNextPage(BuildContext context) {
//     Future.delayed(const Duration(seconds: 0)).then(
//       (value) async {
//         try {
//           bool isConnect = false;
//           // async function for checking connectivity
//           var connectivity = await (Connectivity().checkConnectivity());
//           if (connectivity == ConnectivityResult.mobile) {
//             //check mobile data for connectivity
//             isConnect = true;
//           } else if (connectivity == ConnectivityResult.wifi) {
//             //check wifi for connectivity
//             isConnect = true;
//           } else {
//             //No connectivity
//             isConnect = false;
//           }
//           if (isConnect) {
//             try {
//               // Lookup URL for check connectivity
//               final result =
//                   await InternetAddress.lookup('www.varzesh3.ir');
//               if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//                 //Go to the next page (HomePage)
//                 return Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => LogIn(),
//                   ),
//                 );
//               } else {
//                 //TODO: Define way to show refresh button
//                 MySnackBar(
//                     label: "تلاش مجدد",
//                     onPress: () {},
//                     context: context,
//                     message: 'ارتباط با سرور برقرار نشد!',
//                     isWarning: true);
//               }
//             } on SocketException catch (e) {
//               throw Exception(
//                   'SocketException - splash_page.dart - checkConnectivity(): $e');
//             }
//           } else {
//             //Show Snackbar and show refresh button
//             print("no internet");
//             //TODO: Define way to show refresh button
//             MySnackBar(
//                 label: "تلاش مجدد",
//                 onPress: () {},
//                 context: context,
//                 message: 'اتصال به اینترنت را بررسی کنید',
//                 isWarning: true);
//           }
//         } catch (e) {
//           throw Exception(
//               'Exception - splash_page.dart - checkConnectivity(): $e');
//         }
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     goNextPage(context);
//     return Scaffold(
//       //backgroundColor: Colors.orange,
//
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.yellowAccent, Colors.orange],
//             begin: Alignment.bottomLeft,
//             end: Alignment.topRight,
//             stops: [0.05, 0.7],
//             tileMode: TileMode.repeated,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Image.asset(
//               "assets/images/logo.png",
//               height: 200,
//               width: 300,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 margin: EdgeInsets.symmetric(horizontal: 36),
//                 child: Text(
//                   "پرتاب از فروشگاه نزدیک شما",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 25,
//                   ),
//                 ),
//               ),
//             ),
//             // SpinKitThreeBounce(
//             //   color: Colors.white,
//             //   size: 14,
//             // ),
//             SpinKitThreeBounce(
//               size: 20,
//               itemBuilder: (BuildContext context, int index) {
//                 return DecoratedBox(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(40),
//                     color: index.isEven ? Colors.white : Colors.yellow,
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
