import 'package:abd_shop/constants.dart';
import 'package:abd_shop/screens/category/all_page.dart';
import 'package:abd_shop/screens/home/components/amazing_product/amazing_list_widget.dart';
import 'package:abd_shop/widget/amazing_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AmazingWidget extends StatefulWidget {
  const AmazingWidget({super.key});

  @override
  State<AmazingWidget> createState() => _AmazingWidgetState();
}

class _AmazingWidgetState extends State<AmazingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 380,
      color: kPrimaryColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              width: 200,
              height: 400,
              color: kPrimaryColor,
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    const Text(
                      "شگفت",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const Text(
                      "انگیزهای",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const Text(
                      "امروز",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      //color: Colors.yellow,
                      child: Image.asset(
                        "assets/images/amazing.jpg",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AllPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.only(right: 60),
                        //height: 30,
                        child: const Row(
                          children: [
                            Text(
                              "همه",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                            Icon(Icons.navigate_next,
                                color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AmazingListWidget(),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 300,
                  width: 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AllPage(),
                            ),
                          );
                        },
                        child: Icon(
                          size: 60,
                          CupertinoIcons.arrow_left_circle_fill,
                          color: Color.fromARGB(500, 255, 98, 0),
                        ),
                      ),
                      Text(
                        "مشاهده همه",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(500, 255, 98, 0)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
