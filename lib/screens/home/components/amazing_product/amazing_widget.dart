import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/models/response_model.dart';
import 'package:abd_shop/screens/category/category_Page.dart';
import 'package:abd_shop/screens/home/components/amazing_product/amazing_list_widget.dart';
import 'package:abd_shop/services/api_helper.dart';
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
    return Material(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 310,
        color: kPrimaryColor,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                width: 180,
                height: 400,
                color: kPrimaryColor,
                child: Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/a1.png",
                        color: CupertinoColors.white,
                        width: 100,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 150,
                        child: Image.asset(
                          "assets/images/amazing.jpg",
                          height: 10,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          List<Product> categoryProductsList = [];
                          getProducts().then((value) {
                            DataResponse response = value;
                            if (response.status == 1) {
                              response.data.forEach((value) {
                                categoryProductsList
                                    .add(Product.fromJson(value));
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CategoryPage(
                                    products: categoryProductsList,
                                  ),
                                ),
                              );
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(right: 72),
                          //height: 30,
                          child: const Row(
                            children: [
                              Text(
                                "همه",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kWhiteColor,
                                ),
                              ),
                              Icon(
                                Icons.navigate_next,
                                color: kWhiteColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AmazingListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
