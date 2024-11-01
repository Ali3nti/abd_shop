import 'package:flutter/material.dart';
import 'package:abd_shop/models/category_model.dart';

class CategoryPage extends StatelessWidget {
  final CategoryModel category;

  const CategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: Center(
        child: Text('محصولات کتگوری: ${category.name}'),
      ),
    );
  }
}
