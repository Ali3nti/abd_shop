import 'package:flutter/material.dart';

class TakhfifPage extends StatefulWidget {
  const TakhfifPage({super.key});

  @override
  State<TakhfifPage> createState() => _TakhfifPageState();
}

class _TakhfifPageState extends State<TakhfifPage> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _agecontroller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: _fullnameController,
              decoration: InputDecoration(hintText: "fullname"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: _agecontroller,
              decoration: InputDecoration(hintText: "Age"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: _cityController,
              decoration: InputDecoration(hintText: "City"),
            ),
          ),
          TextButton(
            onPressed: _saveData,
            child: Text("Save Data"),
          ),
          TextButton(
            onPressed: _loadData,
            child: Text("Load from cache"),
          ),
        ],
      ),
    );
  }

  void _saveData() {
    print("Saving data");
  }
  void _loadData() {
    print("Loading data");
  }
}
