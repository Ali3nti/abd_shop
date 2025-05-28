import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  final User user;

  LoginPage({required this.user});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  String? _verificationCode;
  bool _isCodeInputVisible = false;

  Future<void> _sendPhoneNumber() async {
    final String phoneNumber = _phoneController.text;

    final response = await http.post(
      Uri.parse("${baseUrl}api/sign_in"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'phone': phoneNumber}),
    );

    if (_phoneController == widget.user.phoneNumber) {
      setState(() {
        _isCodeInputVisible = true;
      });
    } else {
      print('Error: ${response.body}');
    }
  }

  void _verifyCode() {
    if (_codeController.text ==widget.user.otp) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('کد تایید صحیح است!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('کد تایید نادرست است!')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('صفحه ورود')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'شماره تلفن'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _sendPhoneNumber,
              child: Text('تایید شماره تلفن'),
            ),
            if (_isCodeInputVisible) ...[
              SizedBox(height: 16),
              TextField(
                controller: _codeController,
                decoration: InputDecoration(labelText: 'کد تایید'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _verifyCode,
                child: Text('تایید کد'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
