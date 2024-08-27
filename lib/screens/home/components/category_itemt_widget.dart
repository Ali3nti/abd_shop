import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatefulWidget {
  CategoryItemWidget({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  State<CategoryItemWidget> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(baseUrl + widget.categoryModel.img),
        Text(
          "${baseUrl + widget.categoryModel.name}",
          style: kPrimaryTextStyle,
        ),
      ],
    );
  }
}
