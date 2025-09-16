import 'package:abd_shop/constants.dart';
import 'package:abd_shop/global.dart';
import 'package:abd_shop/models/response_model.dart';
import 'package:abd_shop/models/user_model.dart';
import 'package:abd_shop/services/api_helper.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  bool _isCodeInputVisible = false;

  Future<void> _sendPhoneNumber() async {
    try {
      DataResponse dataResponse = await signIn(
       phone:_phoneController.text,
      );

      if (dataResponse.status == 0) {
        print('خطا: کاربر وجود ندارد یا خطای دیگری پیش آمده است.');
      } else if (dataResponse.status == 1 || dataResponse.status == 2) {
        user = User.fromJson(dataResponse.data);
        setState(() {
          _isCodeInputVisible = true;
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void _verifyCode() {
    if (_codeController.text == "12345") { //// میدونم درست نیست، ولی میخاستم user رو ایمپورت کنم نمیشد
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
