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
    String url = '${baseUrl}api/sign_in';

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VerificationPage(phoneNumber: phoneNumber)),
        );
      } else {
        // خطا در ارسال
        print('خطا در ارسال شماره تلفن: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('خطا در ارسال شماره تلفن.')),
        );
      }
    } catch (e) {
      // مدیریت خطا
      print('خطا: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خطا: $e')),
      );
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

class VerificationPage extends StatelessWidget {
  final String phoneNumber;
  final TextEditingController _codeController = TextEditingController();

  VerificationPage({required this.phoneNumber});

  Future<void> _verifyCode(BuildContext context) async {
    String code = _codeController.text;

    // آدرس مدنظر خود را اینجا وارد کنید
    String url = '${baseUrl}api/verify_code';

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> dataBody = {
      'phone': phoneNumber,
      'code': code,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(dataBody),
      );

      if (response.statusCode == 200) {
        // موفقیت در تایید کد
        print('کد با موفقیت تایید شد!');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('کد با موفقیت تایید شد!')),
        );
        // می‌توانید کاربر را به صفحه اصلی هدایت کنید
      } else {
        // خطا در تایید کد
        print('خطا در تایید کد: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('خطا در تایید کد.')),
        );
      }
    } catch (e) {
      // مدیریت خطا
      print('خطا: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خطا: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ورود کد تایید'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('کد تایید برای شماره: $phoneNumber را وارد کنید'),
            TextField(
              controller: _codeController,
              decoration: InputDecoration(labelText: 'کد تایید'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _verifyCode(context),
              child: Text('تایید کد'),
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
