import 'package:abd_shop/screens/home/components/home_body.dart';
import 'package:abd_shop/widget/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../cart/cart_page.dart';
import '../orders/orders_page.dart';
import '../profile/profile_page.dart';
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
  final List<Widget> screens = [
    HomeBody(),
    OrdersBody(),
    CartBody(),
    ProfileBody()
  ];

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
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text("آیا میخواهید از برنامه خارج شوید؟"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: Text("بله"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("خیر"),
              ),
            ],
          ),
        );
      },
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          enableFeedback: false,
          showUnselectedLabels: true,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey.shade800,
          type: BottomNavigationBarType.shifting,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(
              () {
                currentIndex = index;
              },
            );
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "خانه"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_card_outlined), label: "سفارشات"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket_outlined), label: "سبد خرید"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "پروفایل"),
          ],
        ),
      ),
    );
  }
}
