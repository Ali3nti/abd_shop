import 'package:flutter/material.dart';

import '../../../constants.dart';

class BoxWidget extends StatelessWidget {
  const BoxWidget({super.key, required this.iconData, required this.text});
   final IconData iconData;
   final Text text;
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {
    },
      child: Container(
      width: 380,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color:kPrimaryColor, width: 3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData,color: kPrimaryColor,),
          text,
        ],
      ),
      ),
    );
  }
}
