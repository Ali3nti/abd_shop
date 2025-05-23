import 'package:abd_shop/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();

  Future<void> _sendPhoneNumber() async {
    String phoneNumber = _phoneController.text;

    // آدرس مدنظر خود را اینجا وارد کنید
    String url = '${baseUrl}api/sign_in"';

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> dataBody = {
      'phone': phoneNumber,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(dataBody),
      );

      if (response.statusCode == 200) {
        // موفقیت در ارسال
        print('شماره تلفن با موفقیت ارسال شد!');
        // می‌توانید پیام موفقیت را به کاربر نشان دهید
      } else {
        // خطا در ارسال
        print('خطا در ارسال شماره تلفن: ${response.statusCode}');
      }
    } catch (e) {
      // مدیریت خطا
      print('خطا: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ورود'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'شماره تلفن'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendPhoneNumber,
              child: Text('تایید شماره'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}
