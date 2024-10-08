import 'package:abd_shop/screens/cart/continue_cart_page.dart'; //TODO: What is this?!
import 'package:abd_shop/widget/cart_widget.dart';
import 'package:flutter/cupertino.dart'; //TODO: What is this?!
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart'; //TODO: What is this?!
import 'package:flutter/rendering.dart'; //TODO: What is this?!
import 'package:flutter/widgets.dart'; //TODO: What is this?!

import '../../constants.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text(
          "سبد خرید",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CartWidget(),
            CartWidget(),
            CartWidget(),
            CartWidget(),
            CartWidget(),
            CartWidget(),
          ],
        ),
      ),
    );
  }
}
