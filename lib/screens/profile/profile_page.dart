import 'package:abd_shop/screens/profile/invite_page.dart';
import 'package:abd_shop/screens/profile/sellers_page.dart';
import 'package:flutter/material.dart';

import 'address_page.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

invite(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const InvitePage(),
    ),
  );
}
address(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const AddressPage(),
    ),
  );
}

sellers(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const SellersPage(),
    ),
  );
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 240),
              child: Text(
                "حساب کاربری",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  Text(
                    "محمدمهدی دهقانی",
                    style: TextStyle(fontSize: 28),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit, color: Colors.blue, size: 30),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_rounded,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.output_outlined, size: 30),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 288),
              child: Text(
                "09164438875",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 100,),
            Container(
              width: 380,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.deepOrange, width: 3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.headset_mic_rounded,
                      color: Colors.deepOrange,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "نیاز به پشتیبانی دارم",
                      style: TextStyle(color: Colors.deepOrange, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25,),
            ListTile(
              title: Text("دعوت از دوستان"),
              subtitle: Text("با دعوت از دوستاتون کد تخفیف رایگان بگیرید"),
              leading: IconButton(
                onPressed: () {invite(context);},
                icon: Icon(Icons.people_outline),
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text("آدرس ها"),
              leading: IconButton(
                onPressed: () {address(context);},
                icon: Icon(Icons.map_outlined),
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text("کارت های هدیه"),
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.card_giftcard),
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text("کدهای تخفیف"),
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.discount_outlined),
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text("پیوستن به فروشگاه"),
              leading: IconButton(
                onPressed: () {sellers(context);},
                icon: Icon(Icons.shop_2_sharp),
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text("پرسش های متداول"),
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.question_answer_outlined),
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.2,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
