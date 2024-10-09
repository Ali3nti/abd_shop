import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/category_model.dart';
import 'package:abd_shop/screens/home/category_page.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatefulWidget {
  const CategoryItemWidget({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  State<CategoryItemWidget> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(
              categoryModel: widget.categoryModel,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Image.network(
            baseUrl + widget.categoryModel.img,
            width: 100,
            height: 50,
          ),
          Text(
            widget.categoryModel.name,
            style: kPrimaryTextStyle,
          ),
        ],
      ),
    );
  }
}
