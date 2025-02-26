import 'package:abd_shop/constants.dart';
import 'package:abd_shop/screens/cart/failed_pay.dart';
import 'package:abd_shop/screens/cart/successful_payment_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InternetPayment extends StatefulWidget {
  const InternetPayment({super.key});

  @override
  State<InternetPayment> createState() => _InternetPaymentState();
}

class _InternetPaymentState extends State<InternetPayment> {
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _showSplash = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'پرداخت اینترنتی',
          style: TextStyle(color: kWhiteColor,
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
        child: _showSplash
            ? Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Lottie.asset(
                    repeat: false,
                    'assets/images/Animation - 1735313693982.json',
                    height: 200,
                    width: 300),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SuccessfulPaymentPage(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green.shade800,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      "پرداخت موفق",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FailedPaymentPage(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red.shade800,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      "پرداخت ناموفق",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
