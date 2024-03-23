import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
   ProductWidget(
      {super.key, required this.productimg, required this.productprice});

  String productimg;
  Text productprice;
  //  importent: this Widget has a problem When running on the home page!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(productimg),
              FloatingActionButton.extended(
                onPressed: () {},
                backgroundColor: Colors.orange.shade900,
                foregroundColor: Colors.white,
                isExtended: true,
                shape: const CircleBorder(
                  eccentricity: 0,
                ),
                label: const Row(
                  children: [
                    Icon(Icons.add),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              productprice,
              Image.asset("assets/images/toman.png"),
            ],
          ),
        ],
      ),
    );
  }
}
