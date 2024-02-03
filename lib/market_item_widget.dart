
import 'package:flutter/material.dart';

class MarketItemWidget extends StatefulWidget {
  const MarketItemWidget({super.key});

  @override
  State<MarketItemWidget> createState() => _MarketItemWidgetState();
}

class _MarketItemWidgetState extends State<MarketItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            width: double.infinity,
            height: 150,
            //color: Colors.grey,
            child: Row(
              children: [
                CircleAvatar(
                  //backgroundColor: Colors.green.shade300,
                  radius: 40,
                  child: Image.asset("assets/images/flutter.png"),
                ),
                Column(children: [
                  Row(
                    children: [
                      Text(
                        "tittle",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5),
                      Container(
                        //margin: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        width: 60,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          "50%",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "description",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade500),
                  ),
                  Row(children: [
                    Icon(Icons.star, color: Colors.yellow),
                    SizedBox(width: 7),
                    Text("4.1",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(width: 7),
                    Icon(Icons.directions_bike_rounded),
                    SizedBox(width: 7),
                    Text("8.500  تومان",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ]),
                  Text("ارسال رایگان برای خرید بالای 20 تومان",
                    style: TextStyle(color: Colors.orangeAccent,
                        fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                ]),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "45",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "دقیقه",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      
    );
  }
}
