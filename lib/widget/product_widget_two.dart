import 'package:flutter/material.dart';

class ProductWidgetTwo extends StatelessWidget {
  ProductWidgetTwo(
      {super.key,
      required this.picture,
      required this.productdetail,
      this.onTap,
      required this.priceproduct});

  String picture;
  String productdetail;
  String priceproduct;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      // There is a problem here and It does not work properly  //
      child: SizedBox(
        height: 200,
        width: 200,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Image.asset(
              picture,
              width: 100,
              height: 100,
            ),
            SizedBox(height: 10,),
            Padding(padding: EdgeInsets.only(right: 10),
              child: Text(
                productdetail,
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.only(right: 65),
              child: Row(
                children: [
                  Text(
                    priceproduct,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Image.asset(
                    "assets/images/toman.png",
                    width: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
