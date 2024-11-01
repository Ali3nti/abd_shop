import 'package:abd_shop/intro.dart';
import 'package:abd_shop/sign_in.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void NextPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Intro(),
      ),
    );
  }

  void signIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignIn()),
    );
  }

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false; // وضعیت نمایش پسورد

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  height: 349,
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                labelText: 'نام کاربری',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintStyle: TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 10.0),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            TextField(
                              controller: passwordController,
                              obscureText:
                                  !_isPasswordVisible, // نمایش ستاره یا متن
                              decoration: InputDecoration(
                                labelText: 'رمز عبور',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintStyle: TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 10.0),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible =
                                          !_isPasswordVisible; // تغییر وضعیت نمایش پسورد
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 36),
                            Container(
                              width: double.infinity, // عرض کامل
                              height: 45, // ارتفاع دکمه
                              decoration: BoxDecoration(
                                color: Colors.black12, // رنگ پس‌زمینه
                                borderRadius:
                                    BorderRadius.circular(10.0), // گوشه‌های گرد
                              ),
                              child: TextButton(
                                onPressed: () {
                                  NextPage(context);
                                  // Logic for login
                                  String username = usernameController.text;
                                  String password = passwordController.text;
                                  // Add your login logic here
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white, // رنگ متن
                                    fontSize: 16, // اندازه متن
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "حساب کاربری ندارید؟",
                                  style: TextStyle(color: Colors.white),
                                ),
                                InkWell(
                                    onTap: () {
                                      signIn(context);
                                    },
                                    child: Text("ثبت نام")),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  height: 357,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(40),
              child: Image.asset("assets/images/login3.png"),
            ),
          ],
        ),
      ),
    );
  }
}
