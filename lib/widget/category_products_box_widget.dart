import 'package:abd_shop/constants.dart';
import 'package:abd_shop/screens/category/all_page.dart';
import 'package:abd_shop/screens/home/components/amazing_product/amazing_list_widget.dart';
import 'package:flutter/material.dart';

class CategorProductyBox extends StatefulWidget {
  const CategorProductyBox({super.key});

  @override
  State<CategorProductyBox> createState() => _CategorProductyBoxState();
}

class _CategorProductyBoxState extends State<CategorProductyBox> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.only(top: 30),
        height: 450,
        color: kPrimaryColor,
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  "حراج روز",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 250,
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
                  child: const Text(
                    "همه",
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                ),
                const Icon(Icons.navigate_next, color: Colors.blue),
              ],
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  AmazingListWidget(),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
