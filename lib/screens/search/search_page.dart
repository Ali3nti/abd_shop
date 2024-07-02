import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String text = "Search...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            MyTextFiled(
              title: 'جست و جو',
              onChanged: (value) {
                text = value;
                setState(() {});
              },
            ),
            MyTextFiled(
              title: 'شهر',
              onChanged: (value) {
                text = value;
                setState(() {});
              },
            ),
            SizedBox(height: 150),
            Text(text),
          ],
        ),
      ),
    );
  }
}

class MyTextFiled extends StatefulWidget {
  const MyTextFiled({super.key, required this.title, required this.onChanged});
  final String title;
  //for use call back function in class and send changed to parent or other class
  final Function(String) onChanged;
  // final Function(String)? onChanged; //-> when use ? you can remove required in constructor

  @override
  State<MyTextFiled> createState() => _MyTextFiledState();
}

class _MyTextFiledState extends State<MyTextFiled> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          label: Text(widget.title),
          hintText: "عبارت مورد نظر را جست و جو",
          border: OutlineInputBorder(),
        ),
        showCursor: false,
        onChanged: widget.onChanged,
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String text = "helloooo ...";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.greenAccent,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
