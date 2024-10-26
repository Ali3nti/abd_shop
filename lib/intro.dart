import 'package:abd_shop/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Map<String, String>> slides = [
    {
      "title": "Welcome to My App",
      "description": "This is the first slide description.",
      "image": "assets/images/intro1.png",
    },
    {
      "title": "Discover Features",
      "description": "Explore the amazing features of our app.",
      "image": "assets/images/login.png",
    },
    {
      "title": "Get Started",
      "description": "Let's get started with the app!",
      "image": "assets/images/vector2.png",
    },
  ];

  @override
  void initState() {
    super.initState();
    _checkIfIntroShown();
  }

  Future<void> _checkIfIntroShown() async {
    await Hive.initFlutter();
    var box = await Hive.openBox('settings');
    bool isIntroShown = box.get('isIntroShown', defaultValue: false);

    if (isIntroShown) {
      // Navigate to HomeScreen if intro has already been shown
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  Future<void> _setIntroShown() async {
    var box = await Hive.openBox('settings');
    box.put('isIntroShown', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemCount: slides.length,
        itemBuilder: (context, index) {
          return _buildSlide(slides[index]);
        },
      ),
      bottomSheet: _buildBottomSheet(),
    );
  }

  Widget _buildSlide(Map<String, String> slide) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            slide["image"]!,
            height: 300,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Text(
            slide["title"]!,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              slide["description"]!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheet() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(slides.length, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: _currentPage == index ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (_currentPage == slides.length - 1) // Show Skip only on the last page
                TextButton(
                  onPressed: () {
                    _setIntroShown();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text("Skip"),
                ),
              if (_currentPage < slides.length - 1) // Show Next button only on the first two pages
                TextButton(
                  onPressed: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Text("Next"),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
