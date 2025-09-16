import 'package:abd_shop/constants.dart';
import 'package:abd_shop/global.dart';
import 'package:abd_shop/models/response_model.dart';
import 'package:abd_shop/screens/add_Product/add_product_page.dart';
import 'package:abd_shop/screens/delivery/driver_info_page.dart';
import 'package:abd_shop/screens/profile/address_page.dart';
import 'package:abd_shop/screens/profile/notif_page/notif_page.dart';
import 'package:abd_shop/screens/profile/rating_Info_page.dart';
import 'package:abd_shop/screens/profile/sellers_page.dart';
import 'package:abd_shop/screens/profile/support_Button.dart';
import 'package:abd_shop/screens/profile/support_page.dart';
import 'package:abd_shop/screens/profile/userInfo/user_info.dart';
import 'package:abd_shop/screens/profile/wallet/wallet_page.dart';
import 'package:abd_shop/services/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

// ایمپورت تابع userprofile از فایل جداگانه

import 'package:abd_shop/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// توابع ناوبری ساده
void address(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => AddressPage()));
}

void delivery(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => DriverInfoPage()));
}

void addProduct(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => AddProductPage()));
}

void sellers(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => const SellersPage()));
}

void userinfo(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfo()));
}

void notifiPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage()));
}

void supportPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => SupportPage()));
}

void walletPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => WalletPage()));
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String phoneNumber = prefs.getString('phoneNumber') ?? '';

      if (phoneNumber.isEmpty) {
        setState(() => isLoading = false);
        return;
      }

      DataResponse response = await userprofile(phoneNumber: phoneNumber, firstname: '');

      if (response.status == 1 && response.data != null) {
        setState(() {
          user = User.fromJson(response.data);
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
      }
    } catch (e) {
      print('Error fetching user profile: $e');
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text("حساب کاربری", style: TextStyle(color: Colors.white)),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          "حساب کاربری",
          style: TextStyle(color: kWhiteColor),
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
          const SizedBox(width: 20),
          InkWell(
            onTap: () {
              SystemNavigator.pop();
            },
            child: Image.asset(
              "assets/images/logout.png",
              color: kWhiteColor,
            ),
          ),
          const SizedBox(width: 10),
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
                  Text(
                    (user.firstName != null && user.firstName!.isNotEmpty) ? user.firstName! : 'نام نامشخص',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  Text(
                    user.phoneNumber ?? 'شماره نامشخص',
                    style: const TextStyle(color: Colors.black),
                  ),

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(
                  onTap: () {
                    walletPage(context);
                  },
                  child: Row(
                    children: [
                      Image.asset("assets/images/wallet.png", width: 30, height: 50),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("کیف پول", style: TextStyle(fontSize: 14)),
                          Row(
                            children: [
                              Text(
                                NumberFormat("#,##0").format(10000),
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(width: 5),
                              Image.asset('assets/images/toman.png', width: 20),
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
