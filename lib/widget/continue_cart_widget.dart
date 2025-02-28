import 'package:abd_shop/screens/profile/address_page.dart';
import 'package:flutter/material.dart';

class ContinueCartWidget extends StatefulWidget {
  const ContinueCartWidget({super.key});

  @override
  State<ContinueCartWidget> createState() => _ContinueCartWidgetState();
}

class _ContinueCartWidgetState extends State<ContinueCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: EdgeInsets.all(5),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding: EdgeInsets.all(10),
                height: 150,
                color: Colors.white,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "ارسال به",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "م . ونک...",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "م. ونک",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {},
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddressPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "تغییر آدرس تحویل",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlue,
                                ),
                              ),
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
          SizedBox(
            width: 110,
            height: 130,
            child: Image.asset(
              "assets/images/jet mart.webp",
            ),
          ),
        ],
      ),
    );
  }
}
