import 'package:flutter/material.dart';

class InternetPayment extends StatefulWidget {
  const InternetPayment({super.key});

  @override
  State<InternetPayment> createState() => _InternetPaymentState();
}

class _InternetPaymentState extends State<InternetPayment> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("پرداخت اینترنتی"),
      ),
    );
  }
}
