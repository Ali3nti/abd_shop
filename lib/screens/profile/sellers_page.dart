import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SellersPage extends StatefulWidget {
  const SellersPage({super.key});

  @override
  State<SellersPage> createState() => _SellersPageState();
}

class _SellersPageState extends State<SellersPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 35, left: 200),
            child: Text(
              "ثبت نام فروشنده",
              style: TextStyle(fontSize: 30),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 290),
            child: Text(
              "نام و نام خانوادگی",
              style: TextStyle(fontSize: 15),
            ),
          ),
          TextField(
            showCursor: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: CupertinoColors.lightBackgroundGray,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding
            (
            padding: EdgeInsets.only(left: 290),
            child: Text(
              "شماره تماس",
              style: TextStyle(fontSize: 15),
            ),
          ),
          TextField(
            showCursor: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: CupertinoColors.lightBackgroundGray,
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
