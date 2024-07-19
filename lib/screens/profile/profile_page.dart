import 'package:abd_shop/screens/profile/invite_page.dart';
import 'package:abd_shop/screens/profile/sellers_page.dart';
import 'package:abd_shop/screens/profile/takhfif.dart';
import 'package:abd_shop/screens/profile/user_info.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
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

userinfo(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => UserInfo(),
    ),
  );
}

takhfifpage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TakhfifPage(),
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
                    onPressed: () {
                      userinfo(context);
                    },
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/wallet.png",
                        width: 50,
                        height: 50,
                      ),
                      Column(
                        children: [
                          Text("کیف پول"),
                          Row(
                            children: [
                              Text("10000"),
                              Image.asset(
                                "assets/images/toman.png",
                                height: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Image.asset(
                                "assets/images/comments_man.png",
                                width: double.infinity,
                                height: 200,
                              ),
                              SizedBox(
                                height: 70,
                              ),
                              Text(
                                "هنوز امتیاز و دیدگاهی ثبت نکرده اید!",
                                style: TextStyle(fontSize: 19),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Text(
                                  "با ثبت امتیاز و دیدگاه می توانید رضایت یا ناراضایتی خود را به فروشگاه اعلام،و خریداران را راهنمایی کنید",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade600),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/comment.png",
                        width: 50,
                        height: 50,
                      ),
                      Column(
                        children: [
                          Text("امتیاز و دیدگاه"),
                          Row(
                            children: [
                              Text("50"),
                              Text("دیدگاه"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 380,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kPrimaryColor, width: 3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.headset_mic_rounded,
                      color:kPrimaryColor,
                    ),
                    Text(
                      "نیاز به پشتیبانی دارم",
                      style: TextStyle(color:kPrimaryColor, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ListTile(
              title: Text("دعوت از دوستان"),
              subtitle: Text("با دعوت از دوستاتون کد تخفیف رایگان بگیرید"),
              leading: Icon(Icons.people_outline),
              onTap: () {
                invite(context);
              },
            ),
            Container(
              width: double.infinity,
              height: 0.2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text("آدرس ها"),
              leading: Icon(Icons.map_outlined),
              onTap: () {
                address(context);
              },
            ),
            Container(
              width: double.infinity,
              height: 0.2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text("کارت های هدیه"),
              leading: Icon(Icons.card_giftcard),
              onTap: () {},
            ),
            Container(
              width: double.infinity,
              height: 0.2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text("کدهای تخفیف"),
              leading: Icon(Icons.discount_outlined),
              onTap: () {
                takhfifpage(context);
              },
            ),
            Container(
              width: double.infinity,
              height: 0.2,
              color: Colors.grey,
            ),
            Container(
              width: double.infinity,
              height: 0.2,
              color: Colors.grey,
            ),
            ListTile(
              title: Text("پرسش های متداول"),
              leading: Icon(Icons.question_answer_outlined),
              onTap: () {},
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
