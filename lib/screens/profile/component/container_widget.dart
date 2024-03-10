import 'package:flutter/material.dart';

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({super.key, required BoxDecoration decoration, required int width, required int height, required Row child});

  @override
  State<ContainerWidget> createState() => _ContainerState();
}

class _ContainerState extends State<ContainerWidget> {
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
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.headset_mic_rounded,
              color: Colors.deepOrange,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "نیاز به پشتیبانی دارم",
              style: TextStyle(color: Colors.deepOrange, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
