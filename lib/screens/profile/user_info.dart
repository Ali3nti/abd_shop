import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class UserInfo extends StatefulWidget {
  UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  String? gender;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("حساب کاربری", style: kHeaderTextStyle),
        centerTitle: true,
        backgroundColor: Colors.deepOrange, // تغییر رنگ پس‌زمینه
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField("نام*", "نام خود را وارد کنید"),
              _buildTextField("نام خانوادگی*", "نام خانوادگی خود را وارد کنید"),
              _buildTextField("کد ملی*", "کد ملی خود را وارد کنید"),
              const SizedBox(height: 30),
              Text("جنسیت*", style: kHeaderTextStyle),
              _buildGenderRadio("مرد"),
              _buildGenderRadio("زن"),
              _buildGenderRadio("اعلام نمی‌کنم"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle form submission
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.teal, // رنگ متن دکمه
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // گوشه‌های گرد
                  ),
                ),
                child: const Text("ارسال", style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.lightBlue[50], // رنگ پس‌زمینه کارت
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.teal), // رنگ حاشیه
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.tealAccent), // رنگ حاشیه هنگام تمرکز
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'لطفاً این فیلد را پر کنید';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildGenderRadio(String value) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: gender,
          onChanged: (val) {
            setState(() {
              gender = val;
            });
          },
          activeColor: Colors.teal, // رنگ رادیو
        ),
        Text(value, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}






//notice: the old code//
//
//   @override
//   State<UserInfo> createState() => _UserInfoState();
// }
//
// class _UserInfoState extends State<UserInfo> {
//   bool value = false;
//   bool value1 = false;
//   bool value2 = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(top: 70, left: 290),
//               child: Text("حساب کاربری", style: kHeaderTextStyle),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 369),
//               child: Text(
//                 "نام*",
//                 style: kHintTextStyle,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 340),
//               child: Text(
//                 "نام خانوادگی*",
//                 style: kHintTextStyle,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 369),
//               child: Text(
//                 "کدملی*",
//                 style: kHintTextStyle,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(top: 30, left: 290),
//               child: Text("جنسیت*", style: kHeaderTextStyle),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 8),
//               child: Row(
//                 children: [
//                   Checkbox(
//                     value: value,
//                     onChanged: (val) {
//                       setState(
//                         () {value=val!;},
//                       );
//                     },
//                   ),
//                   Text("مرد"),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 8),
//               child: Row(
//                 children: [
//                   Checkbox(
//                     value: value1,
//                     onChanged: (val) {
//                       setState(
//                         () {value1=val!;},
//                       );
//                     },
//                   ),
//                   Text("زن"),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 8),
//               child: Row(
//                 children: [
//                   Checkbox(
//                     value: value2,
//                     onChanged: (val) {
//                       setState(
//                         () {value2=val!;},
//                       );
//                     },
//                   ),
//                   Text("اعلام نمی کنم"),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
