import 'package:flutter/material.dart';

class OrdersBody extends StatefulWidget {
  const OrdersBody({super.key});

  @override
  State<OrdersBody> createState() => _OrdersBodyState();
}

class _OrdersBodyState extends State<OrdersBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "سفارش ها",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 70, top: 50),
            height: 300,
            child: Image.asset("assets/images/order.png"),
          ),
          Container(
              margin: EdgeInsets.only(left: 70, top: 30),
              child: Text(
                "اینجا سفارش ندارید!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Container(
              margin: EdgeInsets.only(left: 70, top: 10),
              child: Text(
                "چندین فروشگاه دیگر نزدیک شما هستند.",
                style: TextStyle(
                  fontSize: 14,
                ),
              )),
          Container(
              margin: EdgeInsets.only(left: 70, top: 30),
              width: 210,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade900,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "مشاهده فروشگاه های نزدیک",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
