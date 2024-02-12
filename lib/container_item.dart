import 'package:flutter/material.dart';

class ContainerItem extends StatefulWidget {
  const ContainerItem({super.key});

  @override
  State<ContainerItem> createState() => _ContainerItemState();
}

class _ContainerItemState extends State<ContainerItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: 30),
            height: 300,
            width: 200,
            color: Colors.white,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      child: Image.asset("assets/images/p1.png",
                          width: 100),
                    ),
                    Container(
                      //margin: EdgeInsets.only(top: 50),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade900,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(Icons.add, color: Colors.white,
                          size: 30),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text( "پنیر لبنه می ماس",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text(
                        "300 گرم",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Row(children: [
                        Text("37.500 تومان",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: 10),
                        Container(
                          alignment: Alignment.center,
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "25 %",
                            style: TextStyle(fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text(
                        "50.000",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
