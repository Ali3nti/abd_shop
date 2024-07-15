import 'package:flutter/material.dart';

class Discount_Code_widget extends StatefulWidget {
  const Discount_Code_widget({super.key});

  @override
  State<Discount_Code_widget> createState() => _Discount_Code_widgetState();
}

class _Discount_Code_widgetState extends State<Discount_Code_widget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(top: 5),
          color: Colors.white,
          height: 80,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5, right: 20),
                //color: Colors.purpleAccent,
                child: const Text(
                  "کد تخفیف دارید ؟",
                  style:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, right: 150),
                height: 40,
                width: 110,
                decoration: BoxDecoration(
                  color: Colors.orange.shade900,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    Text(
                      "افزودن کد",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
