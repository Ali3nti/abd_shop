import 'package:abd_shop/constants.dart';
import 'package:flutter/material.dart';

class ProductSupermarketWidget extends StatefulWidget {
  const ProductSupermarketWidget({super.key});

  @override
  State<ProductSupermarketWidget> createState() => _ProductSupermarketState();
}

class _ProductSupermarketState extends State<ProductSupermarketWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      color: Colors.white,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset(
              "assets/images/logo.png",
              color:kPrimaryColor,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Text(
                " جت مارت | ونک ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.navigate_next),
              Container(
                margin: const EdgeInsets.only(right: 5),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Text(
                  " تا50% ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow.shade700,
                size: 18,
              ),
              const Text(
                "4.6   . ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                " + 1000 رای",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                "ارسال در ",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 14,
                ),
              ),
              const Text(
                "45  دقیقه  .  ",
                style: TextStyle(
                  color:kPrimaryTextColor ,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "هزینه ارسال ",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 14,
                ),
              ),
              const Text(
                "6,000 تومان",
                style: TextStyle(

                  color:kPrimaryTextColor ,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
