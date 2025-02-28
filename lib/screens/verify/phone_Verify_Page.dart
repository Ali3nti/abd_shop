import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:lottie/lottie.dart';

class PhoneVerificationPage extends StatefulWidget {
  const PhoneVerificationPage({super.key});

  @override
  State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  String? _verificationCode;
  bool _isCodeSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            child:
            Lottie.asset('assets/images/Animation - 1735297671111.json',width: 200,height: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(70),
              ),
            ),
            width: double.infinity,
            height: 400,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                TextField(
                  controller: _isCodeSent ? _codeController : _phoneController,
                  decoration: InputDecoration(
                    prefixIcon: _isCodeSent
                        ? Icon(CupertinoIcons.phone)
                        : Icon(CupertinoIcons.number_circle_fill),
                    labelText: _isCodeSent
                        ? 'کد تأیید را وارد کنید'
                        : 'شماره تلفن خود را وارد کنید',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType:
                      _isCodeSent ? TextInputType.number : TextInputType.phone,
                ),
                SizedBox(height: 20),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 6, left: 6, top: 6),
                      child: Container(
                        height: 52,
                        decoration: BoxDecoration(
                          color: _isCodeSent
                              ? Colors.green.shade900
                              : Colors.deepOrange,
                          borderRadius: BorderRadiusDirectional.circular(10),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 7, left: 7, top: 7),
                      child: InkWell(
                        onTap: () {
                          if (_isCodeSent) {
                            if (_codeController.text == _verificationCode) {
                              final snackBar = SnackBar(
                                content: Text('با موفقیت انجام شد!'),
                                backgroundColor: Colors.green,
                                duration: Duration(seconds: 3),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              final snackBar = SnackBar(
                                content: Text('عملیات با مشکل مواجه شد!'),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 3),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          } else {
                            _verificationCode =
                                (Random().nextInt(900000) + 100000).toString();
                            print(
                                'Sending code $_verificationCode to ${_phoneController.text}');
                            setState(() {
                              _isCodeSent = true;
                            });
                            final snackBar = SnackBar(
                              content: Text(
                                  'کد تایید ارسال شد به ${_phoneController.text}'),
                              duration: Duration(seconds: 3),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            borderRadius: BorderRadiusDirectional.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _isCodeSent ? "تایید کد" : "ارسال کد",
                                style: TextStyle(
                                  color: _isCodeSent
                                      ? Colors.green.shade900
                                      : Colors.deepOrange,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
