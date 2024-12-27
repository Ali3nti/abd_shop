import 'package:abd_shop/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DeliveryDriverPage extends StatefulWidget {
  @override
  State<DeliveryDriverPage> createState() => _DeliveryDriverPageState();
}

class _DeliveryDriverPageState extends State<DeliveryDriverPage> {
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
                child: Lottie.asset('assets/images/gif2.json',height: 200,width: 500),
              ),
        Padding(
        padding: const EdgeInsets.only(left: 280),
        child: Text(
          "اطلاعات سفارش",
          style: kHeaderTextStyle,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "شناسه پیگیری",
              style: TextStyle(
                  fontWeight: FontWeight.w900, color: Colors.grey),
            ),
            Text(
              "190-118687-386",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Row(
        children: [
          SizedBox(
            width: 9,
          ),
          Image.asset(
            "assets/images/map.png",
            color: Colors.red,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "میدان آزادی،سوپرمارکت رضایی",
            style: kHeaderTextStyle,
          )
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        children: [
          SizedBox(
            width: 5,
          ),
          Image.asset(
            "assets/images/location.png",
            color: Colors.green,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "خیابان ولیعصر،کوچه هفتم",
            style: kHeaderTextStyle,
          )
        ],
      ),
      SizedBox(
        height: 15,
      ),
      Row(
        children: [
          SizedBox(
            width: 5,
          ),
          Image.asset(
            "assets/images/card-pos.png",
            color: Colors.purpleAccent,
          ),
          SizedBox(
            width: 5,
          ),
          Row(
            children: [
              Text(
                "هزینه : 20,000",
                style: kHeaderTextStyle,
              ),
              Image.asset(
                "assets/images/toman.png",
                height: 20,
              ),
            ],
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 280, top: 20),
        child: Text(
          "اطلاعات مشتری",
          style: kHeaderTextStyle,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
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
                  "مهدی دهقانی",
                  style: TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 18),
                ),
                Text(
                  "09164438875",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              width: 170,
            ),
            InkWell(
              onTap: () {},
              child: Image.asset("assets/images/Phone.png"),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 300),
        child: Text(
          "سبد خرید",
          style: kHeaderTextStyle,
        ),
      ),


      ],
    ),)
    ,
    );
  }
}
