import 'package:abd_shop/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
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
                child: Text("خریدی سریع و آسان در شهر",style: TextStyle(color: Colors.white,fontSize: 30)
                ),
              ),
            ],
          ),
    SpinKitFadingCircle(
    itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
    decoration: BoxDecoration(
    color: index.isEven ? Colors.white : Colors.grey,
    ),
    );
    },
      ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: const Text('Go Next page',style: TextStyle(color: Colors.white),
            ),
          )
    ]
    ));
  }
}