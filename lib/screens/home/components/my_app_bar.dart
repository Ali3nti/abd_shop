
import 'package:flutter/material.dart';

import '../../search/search_page.dart';

class MyAppBar extends StatelessWidget  implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  search(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchPage(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white10,
      scrolledUnderElevation: 0,
      title: GestureDetector(
        onTap: () {
          search(context);
        },
        child: Container(
          height: 50,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(Icons.search, size: 30, color: Colors.grey.shade600),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Row(
                  children: [
                    const Text(
                      "جستجو در",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      'assets/images/logo.png',
                      color: Colors.deepOrange,
                      width: 90,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
