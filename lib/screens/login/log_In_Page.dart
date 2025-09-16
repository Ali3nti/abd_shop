import 'package:abd_shop/models/response_model.dart';
import 'package:abd_shop/models/user_model.dart';
import 'package:abd_shop/screens/base/base_page.dart';
import 'package:abd_shop/services/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/global.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  bool _isCodeInputVisible = false;

  Future<void> _sendPhoneNumber() async {
    final String phoneNumber = _phoneController.text;

    DataResponse response = await login(phoneNumber: phoneNumber);
    if (response.status == 1 || response.status == 2) {
      setState(() {
        _isCodeInputVisible = true;
      });
      user = User.fromJson(response.data);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خطا در ارسال شماره')),
      );
    }
  }

  void _verifyCode() async {
    if (_codeController.text == user.otp.toString()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('phoneNumber', user.phoneNumber);
      prefs.setBool('is_logged_in', true);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('کد تایید صحیح است!')),
      );

      Future.delayed(Duration(milliseconds: 300), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BasePage()),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('کد تایید نادرست است!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Card(
            color: const Color(0xFF1E1E1E),
            elevation: 10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.lock_outline, size: 56, color: Colors.tealAccent),
                  const SizedBox(height: 16),
                  Text('ورود به حساب کاربری', style: TextStyle(fontSize: 22, color: Colors.white)),
                  const SizedBox(height: 28),
                  TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'شماره تلفن',
                      labelStyle: TextStyle(color: Colors.grey[400]),
                      filled: true,
                      fillColor: Colors.grey[900],
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      prefixIcon: Icon(Icons.phone, color: Colors.tealAccent),
                    ),
                  ),
                  const SizedBox(height: 18),
                  ElevatedButton.icon(
                    onPressed: _sendPhoneNumber,
                    icon: Icon(Icons.send, color: Colors.white),
                    label: Text('تایید شماره تلفن', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      minimumSize: Size.fromHeight(48),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 24),
                  if (_isCodeInputVisible)
                    Column(
                      children: [
                        TextField(
                          controller: _codeController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'کد تایید',
                            labelStyle: TextStyle(color: Colors.grey[400]),
                            filled: true,
                            fillColor: Colors.grey[900],
                            prefixIcon: Icon(Icons.verified, color: Colors.tealAccent),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        const SizedBox(height: 18),
                        ElevatedButton.icon(
                          onPressed: _verifyCode,
                          icon: Icon(Icons.check_circle, color: Colors.white),
                          label: Text('تایید کد', style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            minimumSize: Size.fromHeight(48),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
