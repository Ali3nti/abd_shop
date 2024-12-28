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
    return WillPopScope(
      onWillPop: () async {
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
          return false;
        } else {
          setState(() {
            currentIndex = 0;
          });
          return false;
        }
      },
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.deepOrange,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  currentIndex == 0 ? Colors.deepOrange : Colors.grey,
                  BlendMode.srcIn,
                ),
                child: Image.asset("assets/images/home.png", width: 35),
              ),
              label: "خانه",
            ),
            BottomNavigationBarItem(
              icon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  currentIndex == 1 ? Colors.deepOrange : Colors.grey,
                  BlendMode.srcIn,
                ),
                child: Image.asset("assets/images/order1.png", width: 35),
              ),
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
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        currentIndex == 2 ? Colors.deepOrange : Colors.grey,
                        BlendMode.srcIn,
                      ),
                      child: Image.asset("assets/images/cart2.png", width: 35),
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
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              label: "سبد خرید",
            ),
            BottomNavigationBarItem(
              icon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  currentIndex == 3 ? Colors.deepOrange : Colors.grey,
                  BlendMode.srcIn,
                ),
                child: Image.asset("assets/images/user5.png", width: 35),
              ),
              label: "پروفایل",
            ),
          ],
        ),
      ),
    );
  }
}
