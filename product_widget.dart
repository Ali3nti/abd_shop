import 'package:flutter/material.dart';

class ProductWidjet extends StatefulWidget {
  const ProductWidjet({super.key});

  @override
  State<ProductWidjet> createState() => _ProductWidjetState();
}

class _ProductWidjetState extends State<ProductWidjet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        actions: [
          //Icon(Icons.close),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Icon(Icons.shopping_basket),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            alignment: Alignment.topRight,
            child: Text(
              "تخفیف کهکشانی", style: TextStyle(
                color: Colors.orange,
                fontSize: 18,
                fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 200,
            height: 235,
            //color: Colors.yellow,
            child: Image.asset("assets/images/egg.webp", fit: BoxFit.contain),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  //color: Colors.red,
                    borderRadius: BorderRadius.circular(100)),
                child: Image.asset(
                  "assets/images/egg.webp",
                  width: 30,
                  //fit: BoxFit.contain
                ),
              ),
              SizedBox(width: 10),
              Text(
                "اسم فروشگاه / آدرس",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            //color: Colors.green,
            margin: EdgeInsets.only(left: 170),
            child: Text(
              "اسنک طلایی چی توز - 190 گرم ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 13),
          Container(
            width: double.infinity,
            height: 70,
            color: Colors.grey.shade100,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/egg.webp",
                        width: 40,
                        height: 30,
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    children: [
                      Text(
                        "پفک و اسنک",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 3),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.only(right: 20),
            //color: Colors.green,
            child:Column(
              children: [
                Text("توضیحات",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text("190 گرم"),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            color: Colors.grey.shade100,
            height: 75,
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    alignment: Alignment.center,
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.orange.shade900,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("اضافه به سبد", style:
                    TextStyle(color: Colors.white,
                        fontSize: 14 , fontWeight: FontWeight.bold),)
                ),
                SizedBox(width: 70),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 35,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "30 %",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text("35.350 تومان",
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 88),
                        //color: Colors.white,
                        child: Text(
                          "50.500",
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12,
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
