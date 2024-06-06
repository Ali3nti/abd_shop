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
    return Container(color:Colors.white,
      child: ListView(scrollDirection: Axis.vertical,
        children: [
          SizedBox(height:15 ,),
          Image.asset(imgproduct,width: 200,height: 150,),
          SizedBox(height:20),
          Padding(
            padding: const EdgeInsets.only(right: 70,top: 20),
            child: detailtext,
          ),
          SizedBox(height:20),
          Padding(
            padding: const EdgeInsets.only(right:170),
            child: Row(
              children: [
                pricetext,
                SizedBox(width: 8,),
                Image.asset("assets/images/toman.png",width: 20,),
              ],
            ),
          ),
          SizedBox(height: 30),
          InkWell(onTap: (){},
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: BoxWidget(
                iconData: CupertinoIcons.cart_badge_plus,
                text: Text("افزودن به سبد خرید"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
