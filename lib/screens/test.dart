import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String data = '';
  getUsers() async {
    //for get ip address in cmd or terminal
    //write "ipconfig"
    Uri url = Uri.parse("http://192.168.1.100/abd_shop/getuser.php");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      print('get users');
      print(response.body);
      data = response.body;
      setState(() {});
    } else {
      print("** ERORR STATUS CODE: ${response.statusCode}");
    }
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(data),
        ),
      ),
    );
  }
}
