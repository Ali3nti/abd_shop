import 'package:abd_shop/constants.dart';

import 'package:abd_shop/widget/amazing_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllPage extends StatefulWidget {
  const AllPage({super.key});

  @override
  State<AllPage> createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: Center(
     child: Text("All Page"),
   ),
    );
  }
}
