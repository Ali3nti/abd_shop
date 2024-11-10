import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    super.key,
    required this.imageUrl,
    required this.onTap,
  });

  final void Function()? onTap;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        color: CupertinoColors.white,
        child: Container(
          margin: const EdgeInsets.all(15),
          child: ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(20),
            child: Image.network(
              imageUrl,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
