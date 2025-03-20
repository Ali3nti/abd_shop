import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _DynamicContainersPageState createState() => _DynamicContainersPageState();
}

class _DynamicContainersPageState extends State<NotificationPage> {
  String _content = '';
  int _selectedIndex = -1;

  void _changeContent(String newContent, int index) {
    setState(() {
      _content = newContent;
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        title: Text('پیام ها'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(4, (index) {
                String title;
                switch (index) {
                  case 0:
                    title = 'همه پیام ها';
                    break;
                  case 1:
                    title = 'فعالیت ها';
                    break;
                  case 2:
                    title = 'سفارش ها';
                    break;
                  case 3:
                    title = 'تخفیف ها';
                    break;
                  default:
                    title = '';
                }
                return GestureDetector(
                  onTap: () => _changeContent(title, index),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color:
                          _selectedIndex == index ? Colors.black : Colors.white,
                    ),
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: _selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 20),
          Text(
            _content,
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
