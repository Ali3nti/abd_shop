import 'package:abd_shop/constants.dart';
import 'package:abd_shop/screens/add_Product/add_product_page.dart';
import 'package:abd_shop/screens/delivery/driver_info_page.dart';
import 'package:abd_shop/screens/profile/invite_page.dart';
import 'package:abd_shop/screens/profile/notif_page/notif_page.dart';
import 'package:abd_shop/screens/profile/rating_Info_page.dart';
import 'package:abd_shop/screens/profile/sellers_page.dart';
import 'package:abd_shop/screens/profile/support_Button.dart';
import 'package:abd_shop/screens/profile/support_page.dart';
import 'package:abd_shop/screens/profile/userInfo/user_info.dart';
import 'package:abd_shop/screens/profile/wallet/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'address_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

void invite(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => InvitePage(),
    ),
  );
}

void address(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => AddressPage(),
    ),
  );
}

void delivery(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DriverInfoPage(),
    ),
  );
}

void addProduct(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => AddProductPage(),
    ),
  );
}

void sellers(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const SellersPage(),
    ),
  );
}

void userinfo(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => UserInfo(),
    ),
  );
}

void notifiPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => NotificationPage(),
    ),
  );
}

void supportPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SupportPage(),
    ),
  );
}

void walletPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => WalletPage(),
    ),
  );
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:  kPrimaryColor,
        title: const Text(
          "حساب کاربری",
          style: TextStyle(
            color: kWhiteColor,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              notifiPage(context);
            },
            child: Image.asset(
              "assets/images/bing.png",
              color: kWhiteColor,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: () {
              SystemNavigator.pop();
            },
            child: Image.asset(
              "assets/images/logout.png",
              color: kWhiteColor,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("محمدمهدی دهقانی",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const Text("09164438875",
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
              InkWell(
                onTap: () {
                  userinfo(context);
                },
                child: Image.asset("assets/images/user-edit.png"),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(
                  onTap: () {
                    walletPage(context);
                  },
                  child: Row(
                    children: [
                      Image.asset("assets/images/wallet.png",
                          width: 50, height: 50),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "کیف پول",
                            style: TextStyle(fontSize: 18),
                          ),
                          Row(
                            children: [
                              const Text(
                                "10000",
                                style: TextStyle(fontSize: 16),
                              ),
                              Image.asset("assets/images/toman.png",
                                  height: 15),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              ratingInfoPage(context: context),
            ],
          ),
          const SizedBox(height: 20),
          supportButton(context: context),
          const SizedBox(height: 20),
          // ListTile(
          //   title: const Text("دعوت از دوستان"),
          //   subtitle: const Text("با دعوت از دوستاتون کد تخفیف رایگان بگیرید"),
          //   leading: Image.asset("assets/images/send-2.png"),
          //   onTap: () => invite(context),
          // ),
          ListTile(
            title: const Text("آدرس ها"),
            leading: Image.asset("assets/images/location.png"),
            onTap: () => address(context),
          ),
          const Divider(),
          ListTile(
            title: const Text("فروشندگان"),
            leading: Image.asset("assets/images/shop.png"),
            onTap: () => addProduct(context),
          ),
          const Divider(),
          ListTile(
            title: const Text("رانندگان"),
            leading: Image.asset("assets/images/truck-fast.png"),
            onTap: () => delivery(context),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
