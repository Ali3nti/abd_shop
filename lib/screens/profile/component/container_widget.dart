import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key, required this.iconData, required this.text});
   final IconData iconData;
   final Text text;
  @override
  Widget build(BuildContext context) {
    return Container(
    width: 380,
    height: 60,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.deepOrange, width: 3),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(color: Colors.deepOrange,
            onPressed: () {},
            icon:Icon(iconData)

        ),
        TextButton(
            onPressed: () {},
            child:text
        ),
      ],
    ),
    );
  }
}
