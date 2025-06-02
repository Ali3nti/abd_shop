
import 'package:abd_shop/models/response_model.dart';
import 'package:abd_shop/models/user_model.dart';
import 'package:abd_shop/services/api_helper.dart';
import 'package:flutter/material.dart';

import '/global.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  String? _verificationCode;
  bool _isCodeInputVisible = false;

  Future<void> _sendPhoneNumber() async {

    final String phoneNumber = _phoneController.text;

    DataResponse response = await login(phoneNumber: phoneNumber);
    print("response status code is: ${response.status}");

    if(response.status == 1){
      //user exist
      print("response message is: ${response.message}");
      setState(() {
        _isCodeInputVisible = true;
      });
      print("response data is: ${response.data}");
      user = User.fromJson(response.data);

    }else if(response.status == 2){
      //create new user
      print("response message is: ${response.message}");
    }else{
      //error
      print("response message is: ${response.message}");
    }
  }

  void _verifyCode() {
    print(_codeController.text);
    print(user.otp);
    if (_codeController.text == user.otp.toString()) {
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
              onPressed:_sendPhoneNumber,
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
