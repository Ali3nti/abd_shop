import 'package:abd_shop/screens/orders/store_page.dart';
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
        title: const Text(
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
            //color: Colors.red,
            margin: const EdgeInsets.only(left: 60,top: 30),
            height: 300,
            width: 300,
            child: Image.asset("assets/images/P31.png"),
          ),
          Container(
              margin: const EdgeInsets.only(left: 70, top: 2),
              child: const Text(
                "اینجا سفارش ندارید!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Container(
              margin: const EdgeInsets.only(left: 70, top: 10),
              child: const Text(
                "چندین فروشگاه دیگر نزدیک شما هستند.",
                style: TextStyle(
                  fontSize: 14,
                ),
              )),
          InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => const StorePage(),
                  ),
              );
            },
            child: Container(
                margin: const EdgeInsets.only(left: 70, top: 30),
                width: 210,
                height: 50,
              decoration: BoxDecoration(
                color: Colors.orange.shade900,
                borderRadius: BorderRadius.circular(10),),
              child:  const Center(
                  child: Text("مشاهده فروشگاه های نزدیک",style: TextStyle(
                      color: Colors.white,
                      fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                ),
                ),
          ),
        ],
      ),
    );
  }
}


