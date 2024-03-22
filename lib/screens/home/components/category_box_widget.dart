import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  CategoryBox(
      {super.key, required this.img, required this.categorytext,ontap});

  String img;
  Text categorytext;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Column(
        children: [
          Image.asset(
            img,
            width: 70,
          ),
          categorytext,
        ],
      ),
    );
  }
  void ontap() {
  }
}
