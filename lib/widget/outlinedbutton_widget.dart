import 'package:abd_shop/screens/category/OutlinedButton_page.dart';
import 'package:flutter/material.dart';

class OutLinedButtonWidget extends StatefulWidget {
  const OutLinedButtonWidget({super.key});

  @override
  State<OutLinedButtonWidget> createState() => _OutLinedButtonWidgetState();
}

class _OutLinedButtonWidgetState extends State<OutLinedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OutLinedButtonPage(),
          ),
        );
      },
      child: const Text(
        "میوه",
      ),);
  }
}
