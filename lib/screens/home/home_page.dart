import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/screens/home/components/home_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      // appBar: const MyAppBar(),
      body: HomeBody(product: Product(),),
    );
  }
}
