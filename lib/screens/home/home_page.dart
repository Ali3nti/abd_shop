import 'package:abd_shop/screens/home/components/home_body.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import '../search/search_page.dart';
import 'components/my_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller =
      PageController(initialPage: 0, viewportFraction: 0.9);

  List<Widget> ItemsWrap = [];

  int currentIndex = 0;

  search(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchPage(),
      ),
    );
  }

  // int index = 0;     // old navigationbar
  //
  // List<BottomNavigationBarItem> items = const [
  //   BottomNavigationBarItem(
  //     icon: Icon(Icons.shopping_basket_outlined),
  //     label: "سبد خرید",
  //   ),
  //   BottomNavigationBarItem(
  //     icon: Icon(Icons.home_filled),
  //     label: "صفحه اصلی",
  //   ),
  //   BottomNavigationBarItem(
  //     icon: Icon(Icons.person_outline),
  //     label: "حساب",
  //   ),
  //   BottomNavigationBarItem(
  //     icon: Icon(Icons.menu),
  //     label: "منو",
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: HomeBody(),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavyBarItem(
              icon: Icon(Icons.home_filled),
              title: Text("خانه"),
              activeColor: Colors.deepOrangeAccent),
          BottomNavyBarItem(
              icon: Icon(Icons.add_card),
              title: Text("سفارشات"),
              activeColor: Colors.blue),
          BottomNavyBarItem(
              icon: Icon(Icons.shopping_basket_outlined),
              title: Text("سبد خرید"),
              activeColor: Colors.purple),
          BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text("پروفایل"),
              activeColor: Colors.green),
        ],
      ),
      // bottomNavigationBar: Container(
      //   color: Colors.green.shade500,
      //   height: 50,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       Circle(iconData: Icons.home_filled, text: "صفحه اصلی"),
      //       Circle(
      //           iconData: Icons.shopping_basket_outlined, text: "سبد خرید"),
      //       Circle(iconData: Icons.person_outline, text: "حساب"),
      //       Circle(iconData: Icons.menu, text: "منو"),
      //     ],
      //   ),
      // ),
    );
  }
}
