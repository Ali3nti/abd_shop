import 'package:abd_shop/widget/price_widget.dart';
import 'package:flutter/material.dart';

class ProductFruitsCategoryWidget extends StatefulWidget {
  const ProductFruitsCategoryWidget({super.key});

  @override
  State<ProductFruitsCategoryWidget> createState() => _ProductFruitsCategoryWidgetState();
}

class _ProductFruitsCategoryWidgetState extends State<ProductFruitsCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white,
      height: 110,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 15),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: Image.asset("assets/images/hyper fruit.webp"),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "هایپر میوه سایه | ولیعصر",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Text(
                                "18%",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "میوه و سبزیجات",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                              size: 18,
                            ),
                            const SizedBox(width: 7),
                            const Text(
                              "4.3",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 7),
                            const Icon(Icons.delivery_dining),
                            const SizedBox(width: 7),
                            const PriceWidget(
                              price: 7500,
                              size: Size.large,
                            )
                          ],
                        ),
                        const Text(
                          "ارسال رایگان برای خرید بالای 280,000 تومان",
                          style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      //color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "45",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "دقیقه",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
