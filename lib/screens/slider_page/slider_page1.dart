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
    return Scaffold(backgroundColor: Colors.white,
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                ProductWidgetTwo(
                  onTap: () {},
                  picture: "assets/images/p32.png",
                  priceproduct: "35000",
                  productdetail: "نوشابه انرژی زا گازدار ادج",
                ),
                SizedBox(width:11 ,),
                ProductWidgetTwo(
                  onTap: () {},
                  picture: "assets/images/p32.png",
                  priceproduct: "35000",
                  productdetail: "نوشابه انرژی زا گازدار ادج",
                ),
              ],
            ),
            Row(
              children: [
                ProductWidgetTwo(
                  onTap: () {},
                  picture: "assets/images/p32.png",
                  priceproduct: "35000",
                  productdetail: "نوشابه انرژی زا گازدار ادج",
                ),
                SizedBox(width:11 ,),
                ProductWidgetTwo(
                  onTap: () {},
                  picture: "assets/images/p32.png",
                  priceproduct: "35000",
                  productdetail: "نوشابه انرژی زا گازدار ادج",
                ),
              ],
            ),
            Row(
              children: [
                ProductWidgetTwo(
                  onTap: () {},
                  picture: "assets/images/p32.png",
                  priceproduct: "35000",
                  productdetail: "نوشابه انرژی زا گازدار ادج",
                ),
                SizedBox(width:11 ,),
                ProductWidgetTwo(
                  onTap: () {},
                  picture: "assets/images/p32.png",
                  priceproduct: "35000",
                  productdetail: "نوشابه انرژی زا گازدار ادج",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
