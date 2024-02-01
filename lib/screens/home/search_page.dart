import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          TextField(
            decoration: InputDecoration(hintText: "جستجو در",),
          ),
        ],
      ),
    );
  }
}
