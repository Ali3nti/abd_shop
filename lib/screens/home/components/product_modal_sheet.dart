import 'package:abd_shop/screens/profile/component/box_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductSheet extends StatelessWidget {
  ProductSheet({
    super.key,
    required this.detailtext,
    required this.imgproduct,
    required this.pricetext,
  });

  String imgproduct;
  Text detailtext;
  Text pricetext;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(imgproduct,width: 200,height: 150,),
          SizedBox(height:20),
          Padding(
            padding: const EdgeInsets.only(left: 100),
            child: detailtext,
          ),
          SizedBox(height:20),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                pricetext,
                SizedBox(width: 8,),
                Image.asset("assets/images/toman.png",width: 30,),
              ],
            ),
          ),
          SizedBox(height: 50),
          InkWell(onTap: (){},
            child: BoxWidget(
              iconData: CupertinoIcons.cart_badge_plus,
              text: Text("افزودن به سبد خرید"),
            ),
          ),
        ],
      ),
    );
  }
}
