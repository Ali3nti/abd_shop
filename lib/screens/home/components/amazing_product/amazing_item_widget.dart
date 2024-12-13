import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/amazing_model.dart';
import 'package:abd_shop/models/discount_model.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/product/product_information_page.dart';
import 'package:abd_shop/screens/home/components/amazing_product/amazing_list_widget.dart';
import 'package:abd_shop/widget/provider/add_to_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AmazingItemWidget extends StatefulWidget {
  AmazingItemWidget({
    super.key,
    required this.product,
  });

  Product product;
  // void Function()? onPressed;

  @override
  State<AmazingItemWidget> createState() => _AmazingItemWidgetState();
}

class _AmazingItemWidgetState extends State<AmazingItemWidget> {
  late DiscountModel discountModel;

  @override
  Widget build(BuildContext context) {
    double discountAmount =
        widget.product.price * (widget.product.discount / 100);
    double finalPrice = widget.product.price - discountAmount;
    final formatter = NumberFormat('#,###');

    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ProductInformation(product: widget.product),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          // padding: const EdgeInsets.all(8),
          height: 350,
          width: 200,
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Image.network(
                        baseUrl + widget.product.image,
                        width: 100,
                        height: 120,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 30,
                      child: AddToCartWidget(product: Product(),),
                    ),
                    // Container(
                    //   //margin: EdgeInsets.only(top: 50),
                    //   width: 50,
                    //   height: 50,
                    //   decoration: BoxDecoration(
                    //     color: Colors.orange.shade900,
                    //     borderRadius: BorderRadius.circular(100),
                    //   ),
                    //   child: Icon(Icons.add, color: Colors.white, size: 30),
                    // ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Text(widget.product.name, style: kHeaderTextStyle),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          widget.product.description,
                          style: const TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: SizedBox(
                        child: Wrap(
                          children: [
                            Row(
                              children: [
                                Text(formatter.format(finalPrice),
                                    style: kHeaderTextStyle),
                                const SizedBox(width: 6),
                                Image.asset(
                                  width: 20,
                                  'assets/images/toman.png',
                                ),
                              ],
                            ),
                            const SizedBox(width: 12),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          formatter.format(widget.product.price),
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 5,
                      ),
                      // alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SizedBox(
                        width: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.product.discount.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              "%",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
