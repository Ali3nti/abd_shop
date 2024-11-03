import 'package:abd_shop/models/category_model.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    super.key,
    required this.category,
    required this.products,
  });

  final CategoryModel category;
  final List<Product> products;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: widget.products
              .map((e) => Row(
                    children: [
                      Text(e.name),
                      Spacer(),
                      Text(e.description),
                      Spacer(),
                      Text(e.color),
                      Spacer(),
                      Text(e.brand),
                      Spacer(),
                      Text(e.image),
                      Spacer(),
                      Text(e.isActive.toString()),
                      Spacer(),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
