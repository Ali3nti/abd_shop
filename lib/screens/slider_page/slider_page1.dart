import 'package:abd_shop/screens/home/components/my_app_bar.dart';
import 'package:abd_shop/widget/product_widget_two.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                ProductWidgetTwo(
                  percent: Text(
                    "10%",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                  picture: "assets/images/p32.png",
                  priceproduct: "35,000",
                  productdetail: "نوشابه انرژی زا گازدار ادج",
                ),
                SizedBox(
                  width: 11,
                ),
                ProductWidgetTwo(
                  percent: Text(
                    "10%",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                  picture: "assets/images/p33.png",
                  priceproduct: "20,000",
                  productdetail: "نوشیدنی آّب آلبالو",
                ),
              ],
            ),
            Container(
              height: 2,
              width:double.infinity,
              color: Colors.grey.shade300,
            ),
            Row(
              children: [
                ProductWidgetTwo(
                  percent: Text(
                    "10%",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                  picture: "assets/images/p34.png",
                  priceproduct: "32,310",
                  productdetail: "اسنک سرکه نمکی یامی",
                ),
                SizedBox(
                  width: 11,
                ),
                ProductWidgetTwo(
                  percent: Text(
                    "10%",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                  picture: "assets/images/p35.png",
                  priceproduct: "35,000",
                  productdetail: "نوشابه انرژی‌زا گاز دار هایپ",
                ),
              ],
            ),
            Container(
              height: 2,
              width:double.infinity,
              color: Colors.grey.shade300,
            ),
            Row(
              children: [
                ProductWidgetTwo(
                  percent: Text(
                    "10%",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                  picture: "assets/images/p36.png",
                  priceproduct: "85,000",
                  productdetail: "انرژی زا بلک ولف یک لیتری",
                ),
                SizedBox(
                  width: 11,
                ),
                ProductWidgetTwo(
                  percent: Text(
                    "10%",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                  picture: "assets/images/p37.png",
                  priceproduct: "14,000",
                  productdetail: "ماست موسیر چکیده میهن",
                ),
              ],
            ),
            Container(
              height: 2,
              width:double.infinity,
              color: Colors.grey.shade300,
            ),
            Row(
              children: [
                ProductWidgetTwo(
                  percent: Text(
                    "10%",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                  picture: "assets/images/p38.png",
                  priceproduct: "20,000",
                  productdetail: "استیک سیب زمینی کچاپ چی‌توز",
                ),
                SizedBox(
                  width: 11,
                ),
                ProductWidgetTwo(
                  percent: Text(
                    "10%",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                  picture: "assets/images/p39.png",
                  priceproduct: "78,000",
                  productdetail: "آب انار و بلوبری سان‌استار",
                ),
              ],
            ),
            Container(
              height: 2,
              width:double.infinity,
              color: Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }
}
