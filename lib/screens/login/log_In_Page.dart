import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  bool _isCodeSent = false;

  Future<DataResponse> postRequest({
    required String sign_in,
    required Map<String, dynamic> dataBody,
  }) async {
    Uri url = Uri.parse("${baseUrl}api/$sign_in");

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final response = await http.post(
      url,
      body: jsonEncode(dataBody), // تبدیل داده‌ها به فرمت JSON
      headers: headers,
    );

    if (response.statusCode == 200) {
      return DataResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          'Exception error: api_helper.dart - $sign_in: Failed to load post request from $sign_in');
    }
  }

  void _sendCode() async {
    try {
      // ارسال شماره تلفن به بک‌اند
      var response = await postRequest(
        sign_in: 'sign_in', // نام endpoint برای ارسال کد
        dataBody: {'phone': _phoneController.text},
      );

      // در اینجا می‌توانید با پاسخ دریافتی کار کنید
      setState(() {
        _isCodeSent = true; // تغییر وضعیت برای نمایش فیلد کد
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('کد تایید ارسال شد!')),
      );
    } catch (e) {
      // مدیریت خطا
      print('خطا در ارسال کد: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خطا در ارسال کد. لطفا دوباره تلاش کنید.')),
      );
    }
  }

  void _verifyCode() async {
    try {
      // تأیید کد وارد شده
      var response = await postRequest(
        sign_in: 'verify_code', // نام endpoint برای تأیید کد
        dataBody: {
          'phone': _phoneController.text,
          'code': _codeController.text,
        },
      );

      // در اینجا می‌توانید با پاسخ دریافتی کار کنید
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('کد تایید معتبر است!')),
      );
    } catch (e) {
      // مدیریت خطا
      print('خطا در تأیید کد: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('کد تایید نامعتبر است.')),
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
            if (!_isCodeSent) ...[
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'شماره تلفن'),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _sendCode, // فراخوانی تابع _sendCode
                child: Text('ارسال کد تایید'),
              ),
            ] else ...[
              TextField(
                controller: _codeController,
                decoration: InputDecoration(labelText: 'کد تایید'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _verifyCode, // فراخوانی تابع _verifyCode
                child: Text('تایید کد'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
