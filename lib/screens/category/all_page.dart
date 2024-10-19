import 'package:abd_shop/screens/home/components/my_app_bar.dart';
import 'package:abd_shop/widget/provider_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AllPage extends StatefulWidget {
  const AllPage({super.key});

  @override
  State<AllPage> createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              height: 50,
              // color: Colors.red,
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Icon(
                    Icons.line_weight,
                    color: Colors.black,
                    size: 18,
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: Text("همه محصولات"),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10,right: 20),
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              height: 50,
              //color: Colors.blue,
              child: Text("12 محصول",style: TextStyle(
                  color: Colors.grey
              ),),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 3),
                  width: 203,
                  height: 300,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(top: 50),
                          // color: Colors.orange,
                          child: Image.asset(
                            width: 20,
                            'assets/images/p11.png',
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(left: 120),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.orange.shade100,
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.orange.shade900,
                          size: 18,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("15/000 تومان",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      SizedBox(height: 20),
                      Text("روغن زیتون درجه یک _ 100 گرم",
                        style: TextStyle(
                            color: Colors.grey),),
                    ],
                  ),
                ),
                SizedBox(width: 2,),
                Container(
                  margin: EdgeInsets.only(right: 3, bottom: 3),
                  width: 203,
                  height: 300,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(top: 50),
                          //  color: Colors.orange,
                          child: Image.asset(
                            width: 20,
                            'assets/images/p11.png',
                          ),
                        ),
                      ),
                      // SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: ProviderWidget(),
                      ),
                      Text("15/000 تومان",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      SizedBox(height: 20),
                      Text("روغن زیتون درجه یک _ 100 گرم",
                        style: TextStyle(
                            color: Colors.grey),),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 3),
                  width: 203,
                  height: 300,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(top: 50),
                          // color: Colors.orange,
                          child: Image.asset(
                            width: 20,
                            'assets/images/p11.png',
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(left: 120),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.orange.shade100,
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.orange.shade900,
                          size: 18,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("15/000 تومان",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      SizedBox(height: 20),
                      Text("روغن زیتون درجه یک _ 100 گرم",
                        style: TextStyle(
                            color: Colors.grey),),
                    ],
                  ),
                ),
                SizedBox(width: 2,),
                Container(
                  margin: EdgeInsets.only(right: 3, bottom: 3),
                  width: 203,
                  height: 300,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(top: 50),
                          //  color: Colors.orange,
                          child: Image.asset(
                            width: 20,
                            'assets/images/p11.png',
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(left: 120),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.orange.shade100,
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.orange.shade900,
                          size: 18,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("15/000 تومان",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      SizedBox(height: 20),
                      Text("روغن زیتون درجه یک _ 100 گرم",
                        style: TextStyle(
                            color: Colors.grey),),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 3),
                  width: 203,
                  height: 300,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(top: 50),
                          // color: Colors.orange,
                          child: Image.asset(
                            width: 20,
                            'assets/images/p11.png',
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(left: 120),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.orange.shade100,
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.orange.shade900,
                          size: 18,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("15/000 تومان",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      SizedBox(height: 20),
                      Text("روغن زیتون درجه یک _ 100 گرم",
                        style: TextStyle(
                            color: Colors.grey),),
                    ],
                  ),
                ),
                SizedBox(width: 2,),
                Container(
                  margin: EdgeInsets.only(right: 3, bottom: 3),
                  width: 203,
                  height: 300,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(top: 50),
                          //  color: Colors.orange,
                          child: Image.asset(
                            width: 20,
                            'assets/images/p11.png',
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(left: 120),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.orange.shade100,
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.orange.shade900,
                          size: 18,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("15/000 تومان",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      SizedBox(height: 20),
                      Text("روغن زیتون درجه یک _ 100 گرم",
                        style: TextStyle(
                            color: Colors.grey),),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


