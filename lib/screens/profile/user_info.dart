import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants.dart';

class UserInfo extends StatefulWidget {
  UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool value = false;
  bool value1 = false;
  bool value2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70, left: 290),
              child: Text("حساب کاربری", style: kHeaderTextStyle),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 369),
              child: Text(
                "نام*",
                style: kHintTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 340),
              child: Text(
                "نام خانوادگی*",
                style: kHintTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 369),
              child: Text(
                "کدملی*",
                style: kHintTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 290),
              child: Text("جنسیت*", style: kHeaderTextStyle),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                children: [
                  Checkbox(
                    value: value,
                    onChanged: (val) {
                      setState(
                        () {value=val!;},
                      );
                    },
                  ),
                  Text("مرد"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                children: [
                  Checkbox(
                    value: value1,
                    onChanged: (val) {
                      setState(
                        () {value1=val!;},
                      );
                    },
                  ),
                  Text("زن"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                children: [
                  Checkbox(
                    value: value2,
                    onChanged: (val) {
                      setState(
                        () {value2=val!;},
                      );
                    },
                  ),
                  Text("اعلام نمی کنم"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
