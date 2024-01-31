import 'package:abd_shop/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  goNextPage(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    goNextPage(context);
    return Scaffold(
      backgroundColor: Colors.green.shade500,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 36),
                child: Image.asset("assets/images/logo.png"),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 36),
                child: Text(
                  "خریدی سریع و آسان در شهر",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
          // SpinKitThreeBounce(
          //   color: Colors.white,
          //   size: 14,
          // ),
          SpinKitThreeBounce(
            size: 14,
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: index.isEven ? Colors.white : Colors.green.shade300,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
