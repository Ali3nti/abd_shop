import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  CategoryBox({
    super.key,
    required this.img,
    required this.CategoryText,
    this.onTap,
  });

  final String img;
  final Text CategoryText;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      // There is a problem here and It does not work properly  //
      child: Column(
        children: [
          Image.asset(
            img,
            width: 70,
          ),
          CategoryText,
        ],
      ),
    );
  }
}
