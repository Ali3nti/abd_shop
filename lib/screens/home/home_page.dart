import 'package:abd_shop/screens/home/search_page.dart';
import 'package:flutter/material.dart';

import 'location_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  search(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchPage(),
      ),
    );
  }
  location(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LocationPage(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          title: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    search(context);
                  },
                  icon:
                      Icon(Icons.search, size: 30, color: Colors.grey.shade600),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {search(context);},
                    child: Row(
                      children: [
                        const Text("جستجو در"),
                        const SizedBox(
                          width: 4,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          'assets/images/logo.png',
                          color: Colors.green.shade500,
                          width: 90,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.green.shade500,
                      size: 35,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 80),
                          child: Text(
                            "آدرس انتخابی",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "آباده،میدان آزادی،کوچه هفتم",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(width: 60),
                    TextButton(
                      onPressed: () {location(context);},
                      child: Text(
                        "تغییر آدرس",
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
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
