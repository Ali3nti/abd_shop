import 'package:abd_shop/models/address_model.dart';
import 'package:abd_shop/models/gender_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:abd_shop/models/user_model.dart';

class UserRegistrationPage extends StatefulWidget {

  UserRegistrationPage({super.key});

  @override
  State<UserRegistrationPage> createState() => _UserRegistrationPageState();
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController nationalIdController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController birthDateController = TextEditingController();

  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'فرم ثبت نام کاربر',
          style: TextStyle(
              color: CupertinoColors.white, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'اطلاعات شخصی',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(
                  labelText: 'نام',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'لطفا نام خود را وارد کنید';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(
                  labelText: 'نام خانوادگی',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'لطفا نام خانوادگی خود را وارد کنید';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'شماره تلفن',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'لطفا شماره تلفن خود را وارد کنید';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'آدرس',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'لطفا آدرس خود را وارد کنید';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              // فیلد جنسیت
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'جنسیت',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                items: [
                  DropdownMenuItem(value: 'male', child: Text('مرد')),
                  DropdownMenuItem(value: 'female', child: Text('زن')),
                ],
                onChanged: (value) {
                  gender = value;
                },
                validator: (value) {
                  if (value == null) {
                    return 'لطفا جنسیت خود را انتخاب کنید';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // دکمه ثبت نام
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      User user = User()
                        ..firstName = firstNameController.text
                        ..lastName = lastNameController.text
                        ..phoneNumber = phoneController.text
                        ..addressList
                            .add(Address()..address = addressController.text)
                        ..gender = Gender();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'در حال ثبت نام: ${user.firstName} ${user.lastName}'),
                        ),
                      );
                    }
                  },
                  child: Center(
                    child: Text(
                      "ثبت نام",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
