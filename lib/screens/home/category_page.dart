import 'package:abd_shop/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({super.key, required this.categoryModel});

  CategoryModel categoryModel;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    );
  }
}
