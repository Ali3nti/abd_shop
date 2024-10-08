import 'package:flutter/material.dart';

class ItemCategoryPage extends StatefulWidget {
  const ItemCategoryPage({super.key});

  @override
  State<ItemCategoryPage> createState() => _ItemCategoryPageState();
}

class _ItemCategoryPageState extends State<ItemCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("item category page"),
      ),
    );
  }
}
