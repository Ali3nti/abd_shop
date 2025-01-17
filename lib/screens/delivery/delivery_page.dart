import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/address_model.dart';
import 'package:abd_shop/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DeliveryDriverPage extends StatefulWidget {
  @override
  State<DeliveryDriverPage> createState() => _DeliveryDriverPageState();
}

class _DeliveryDriverPageState extends State<DeliveryDriverPage> {
  List<Order> orders = List.generate(10, (index) {
    Order order = Order();
    order.trackingId = 'ABD-0000$index';
    order.deliveryCost = 20.000;
    order.deliveryUserName = 'مهدی دهقانی';
    order.deliveryUserPhone = '09164438875';
    Address shippingAddress = Address();
    shippingAddress.address = "میدان آزادی، سوپرمارکت رضایی";
    order.shippingAddresses.add(shippingAddress);
    Address deliveryAddress = Address();
    deliveryAddress.address = "خیابان ولیعصر، کوچه هفتم";
    order.deliveryAddresses.add(deliveryAddress);
    return order;
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(),
              child: Lottie.asset('assets/images/gif2.json',
                  height: 200, width: 500),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "اطلاعات سفارش",
                        style: kHeaderTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "شناسه پیگیری",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        orders[0].trackingId,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                SizedBox(width: 9),
                Image.asset(
                  "assets/images/map.png",
                  color: Colors.red,
                ),
                SizedBox(width: 5),
                Text(
                  orders[0].shippingAddresses.isNotEmpty
                      ? orders[0].shippingAddresses[0].address
                      : "آدرس موجود نیست",
                  style: kHeaderTextStyle,
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 5),
                Image.asset(
                  "assets/images/location.png",
                  color: Colors.green,
                ),
                SizedBox(width: 5),
                Text(
                  orders[0].deliveryAddresses.isNotEmpty
                      ? orders[0].deliveryAddresses[0].address
                      : "آدرس موجود نیست",
                  style: kHeaderTextStyle,
                )
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                SizedBox(width: 5),
                Image.asset(
                  "assets/images/card-pos.png",
                  color: Colors.purpleAccent,
                ),
                SizedBox(width: 5),
                Row(
                  children: [
                    Text(
                      "هزینه : ${orders[0].deliveryCost}",
                      style: kHeaderTextStyle,
                    ),
                    Image.asset(
                      "assets/images/toman.png",
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: Row(
                children: [
                  Text(
                    "اطلاعات مشتری",
                    style: kHeaderTextStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/Number=17.png",
                          width: 62,
                          height: 62,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            orders[0].deliveryUserName,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            orders[0].deliveryUserPhone,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 170),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "assets/images/Phone.png",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 300),
              child: Text(
                "سبد خرید",
                style: kHeaderTextStyle,
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/images/sefaresh.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
