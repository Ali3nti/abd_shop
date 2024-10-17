import 'package:abd_shop/intro.dart';
import 'package:abd_shop/screens/home/home_page.dart';
import 'package:abd_shop/sign_in.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 55, top: 25),
              child: Image.asset(
                "assets/images/login.png",
                width: 300,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    size: 33,
                    Icons.person_2_outlined,
                    color: Colors.deepOrange,
                  ),
                  hintText: "نام کاربری",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 15),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    size: 33,
                    color: Colors.deepOrange,
                  ),
                  hintText: "رمز عبور",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                NextPage(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(15),
                  color: Colors.deepOrange,
                ),
                width: 400,
                height: 40,
                alignment: FractionalOffset.center,
                child: Text(
                  "ورود",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "رمز عبور خود را فراموش کرده اید؟",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "حساب کاربری ندارید؟",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  InkWell(onTap: (){signIn(context);},
                    child: Text(
                      "ثبت نام",
                      style: TextStyle(fontSize: 15, color: Colors.deepOrange),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

NextPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const Intro(),
    ),
  );
}

void logIn(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => LogIn()));
}
void signIn(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => SignIn()));
}
