import 'package:abd_shop/constants.dart';
import 'package:abd_shop/screens/cart/cart_page.dart';
import 'package:abd_shop/screens/home/home_page.dart';
import 'package:abd_shop/screens/orders/orders_page.dart';
import 'package:abd_shop/screens/profile/profile_page.dart';
import 'package:abd_shop/screens/search/search_page.dart';
import 'package:abd_shop/widget/provider/cart_updater_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  PageController controller =
      PageController(initialPage: 0, viewportFraction: 0.9);

  List<Widget> itemsWrap = [];

  int currentIndex = 0;
  final List<Widget> screens = [
    const HomePage(),
    const OrdersPage(),
    const CartPage(),
    const ProfilePage()
  ];

  search(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (currentIndex == 0) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: const Text("آیا میخواهید از برنامه خارج شوید؟"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: const Text("بله"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("خیر"),
                ),
              ],
            ),
          );
        } else {
          currentIndex = 0;
          setState(() {});
        }
      },
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          enableFeedback: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.deepOrange,
          // تغییر رنگ به نارنجی
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          // نوع fixed
          currentIndex: currentIndex,
          onTap: (index) {
            setState(
              () {
                currentIndex = index; // تغییر ایندکس فعلی
              },
            );
          },
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_rounded, size: 30), // آیکون جدید
              label: "خانه",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.assignment, size: 30), // آیکون جدید
              label: "سفارشات",
            ),
            BottomNavigationBarItem(
              icon: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: (Provider.of<CartUpdater>(context).counterValue > 0)
                          ? 10
                          : 0,
                    ),
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      size: 30,
                    ),
                  ),
                  if (Provider.of<CartUpdater>(context).counterValue > 0)
                    Container(
                      padding: const EdgeInsets.all(2),
                      margin: const EdgeInsets.only(),
                      decoration: const BoxDecoration(
                        color: kBackgroundColor,
                       shape: BoxShape.circle,
                      ),
                      child: Container(
                        width: 25,
                        height: 20,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          Provider.of<CartUpdater>(context)
                              .counterValue
                              .toString(),
                          style: const TextStyle(fontSize: 12,
                          color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              // آیکون جدید
              label: "سبد خرید",
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_sharp,
                size: 30,
              ), // آیکون جدید
              label: "پروفایل",
            ),
          ],
        ),
      ),
    );
  }
}
