import 'package:abd_shop/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final PageController pageController = PageController();
  int _currentPage = 0;
  bool isFirstLaunch = true;

  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  _checkFirstLaunch() async {
    var box = await Hive.openBox('settings');
    bool? isFirstLaunch = box.get('isFirstLaunch',
        defaultValue: true); //TODO: این جا هم اشتباهه احتمالا

    if (isFirstLaunch = false) {
      //TODO: فکر کنم این خط کد رو اشتباه نوشتم
      box.put('isFirstLaunch', false);
      setState(() {
        isFirstLaunch = true;
      });
    } else {
      setState(() {
        isFirstLaunch = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isFirstLaunch
          ? Stack(
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    _buildPage(
                      img: "assets/images/intro1.png",
                      color: Color.fromRGBO(239, 73, 35, 5),
                      title: "به اپلیکیشن دیجی جت خوش آمدید",
                      description: "اولین فروشگاه آنلاین مواد غذایی در آباده",
                    ),
                    _buildPage(
                      img: "assets/images/login.png",
                      color: Color.fromRGBO(254, 102, 2, 5),
                      title: "",
                      description: "همراه با کلی تخفیف",
                    ),
                    _buildPage(
                      img: "assets/images/vector2.png",
                      color: Color.fromRGBO(123, 149, 242, 5),
                      title: "",
                      description: "پس وقت رو از دست نده!",
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 550, right: 160),
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: ScrollingDotsEffect(
                        dotHeight: 15,
                        dotWidth: 15,
                        dotColor: Colors.white,
                        activeDotColor: Colors.black),
                  ),
                ),
              ],
            )
          : HomePage(),
      bottomSheet: _currentPage == 2
          ? TextButton(
              onPressed: () {
                // Navigate to the main screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("شروع",style: TextStyle(fontSize: 20),),
                ],
              ),
            )
          : SizedBox.shrink(),
    );
  }

  Widget _buildPage(
      {required Color color,
      required String title,
      String img = "",
      required String description}) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 250, child: Image.asset(img)),
          Text(
            title,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          SizedBox(height: 20),
          Text(
            description,
            style: TextStyle(fontSize: 16, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
