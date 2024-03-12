import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget(
      {super.key,
      required this.iconData1,
      required this.text1,
      required this.iconData2});
  final IconData iconData1;
  final IconData iconData2;
  final Text text1;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 70,
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Icon(iconData1),
            SizedBox(
              width: 15,
            ),
            text1,
            SizedBox(
              width: 80,
            ),
            Icon(iconData2),
          ],
        ),
      ),
    );
  }
}
