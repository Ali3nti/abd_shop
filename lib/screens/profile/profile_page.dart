import 'package:abd_shop/models/user.dart';
import 'package:abd_shop/screens/profile/faq_page.dart';
import 'package:abd_shop/screens/profile/gift_page.dart';
import 'package:abd_shop/screens/profile/invite_page.dart';
import 'package:abd_shop/screens/profile/notif_page/notif_page.dart';
import 'package:abd_shop/screens/profile/rating_Info_page.dart';
import 'package:abd_shop/screens/profile/sellers_page.dart';
import 'package:abd_shop/screens/profile/support_Button.dart';
import 'package:abd_shop/screens/profile/support_page.dart';
import 'package:abd_shop/screens/profile/takhfif.dart';
import 'package:abd_shop/screens/profile/userInfo/user_info.dart';
import 'package:abd_shop/screens/profile/wallet/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'address_page.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key,required this.users});
  final List<User> users;



  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

void invite(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) =>  InvitePage()));
}

void address(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) =>  AddressPage()));
}

void sellers(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const SellersPage()));
}

void userinfo(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfo()));
}

void takhfifPage(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => DiscountCodePage()));
}

void faqPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => FAQPage()));
}

void giftCardPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => WheelOfFortune(),
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


class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("حساب کاربری"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {notifiPage(context);},
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () { SystemNavigator.pop();},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildUserInfo(),
          const SizedBox(height: 20),
          _buildWalletInfo(),
          const SizedBox(height: 20),
          ratingInfoPage(context: context,),
          const SizedBox(height: 20),
          supportButton(context: context),
          const SizedBox(height: 20),
          _buildListTile(
              "دعوت از دوستان",
              "با دعوت از دوستاتون کد تخفیف رایگان بگیرید",
              Icons.people_outline,
              invite),
      Container(
              width: double.infinity,
              height: 0.2,
              color: Colors.grey,
            ),
          _buildListTile("آدرس ها", "", Icons.map_outlined, address),
          Container(
            width: double.infinity,
            height: 0.2,
            color: Colors.grey,
          ),
          _buildListTile(
              "کارت های هدیه", "", Icons.card_giftcard, giftCardPage),
          Container(
            width: double.infinity,
            height: 0.2,
            color: Colors.grey,
          ),
          _buildListTile(
              "کدهای تخفیف", "", Icons.discount_outlined, takhfifPage),
          Container(
            width: double.infinity,
            height: 0.2,
            color: Colors.grey,
          ),
          _buildListTile(
              "پرسش های متداول", "", Icons.question_answer_outlined, faqPage),
        ],
      ),
    );
  }

  Widget _buildUserInfo() {
    return
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("محمدمهدی دهقانی",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text("09164438875", style: TextStyle(color: Colors.grey)),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.edit, color: Colors.blue),
          onPressed: () {
            userinfo(context);
          },
        ),
      ],
    );
  }

  Widget _buildWalletInfo() {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          onTap: () {
            walletPage(context);
          },
          child: Row(
            children: [
              Image.asset("assets/images/wallet.png", width: 50, height: 50),
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
                      Image.asset("assets/images/toman.png", height: 15),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(String title, String subtitle, IconData leadingIcon,
      Function(BuildContext) onTap) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(leadingIcon),
      onTap: () => onTap(context),
    );
  }

}



// import 'package:abd_shop/screens/profile/invite_page.dart';
// import 'package:abd_shop/screens/profile/sellers_page.dart';
// import 'package:abd_shop/screens/profile/takhfif.dart';
// import 'package:abd_shop/screens/profile/user_info.dart';
// import 'package:flutter/material.dart';
//
// import '../../constants.dart';
// import 'address_page.dart';
//
// class ProfileBody extends StatefulWidget {
//   const ProfileBody({super.key});
//
//   @override
//   State<ProfileBody> createState() => _ProfileBodyState();
// }
//
// invite(BuildContext context) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => const InvitePage(),
//     ),
//   );
// }
//
// address(BuildContext context) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => const AddressPage(),
//     ),
//   );
// }
//
// sellers(BuildContext context) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => const SellersPage(),
//     ),
//   );
// }
//
// userinfo(BuildContext context) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => UserInfo(),
//     ),
//   );
// }
//
// takhfifpage(BuildContext context) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => TakhfifPage(),
//     ),
//   );
// }
//
// class _ProfileBodyState extends State<ProfileBody> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white70,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 30,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 240),
//               child: Text(
//                 "حساب کاربری",
//                 style: TextStyle(
//                   fontSize: 30,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(right: 10),
//               child: Row(
//                 children: [
//                   Text(
//                     "محمدمهدی دهقانی",
//                     style: TextStyle(fontSize: 28),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       userinfo(context);
//                     },
//                     icon: Icon(Icons.edit, color: Colors.blue, size: 30),
//                   ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.notifications_rounded,
//                       size: 30,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.output_outlined, size: 30),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 288),
//               child: Text(
//                 "09164438875",
//                 style: TextStyle(color: Colors.grey),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 InkWell(
//                   onTap: () {},
//                   child: Row(
//                     children: [
//                       Image.asset(
//                         "assets/images/wallet.png",
//                         width: 50,
//                         height: 50,
//                       ),
//                       Column(
//                         children: [
//                           Text("کیف پول"),
//                           Row(
//                             children: [
//                               Text("10000"),
//                               Image.asset(
//                                 "assets/images/toman.png",
//                                 height: 15,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     showModalBottomSheet(
//                       context: context,
//                       builder: (context) {
//                         return Container(
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Image.asset(
//                                 "assets/images/comments_man.png",
//                                 width: double.infinity,
//                                 height: 200,
//                               ),
//                               SizedBox(
//                                 height: 70,
//                               ),
//                               Text(
//                                 "هنوز امتیاز و دیدگاهی ثبت نکرده اید!",
//                                 style: TextStyle(fontSize: 19),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 30),
//                                 child: Text(
//                                   "با ثبت امتیاز و دیدگاه می توانید رضایت یا ناراضایتی خود را به فروشگاه اعلام،و خریداران را راهنمایی کنید",
//                                   style: TextStyle(
//                                       fontSize: 15,
//                                       color: Colors.grey.shade600),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   },
//                   child: Row(
//                     children: [
//                       Image.asset(
//                         "assets/images/comment.png",
//                         width: 50,
//                         height: 50,
//                       ),
//                       Column(
//                         children: [
//                           Text("امتیاز و دیدگاه"),
//                           Row(
//                             children: [
//                               Text("50"),
//                               Text("دیدگاه"),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             InkWell(
//               onTap: () {},
//               child: Container(
//                 width: 380,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(color: kPrimaryColor, width: 3),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.headset_mic_rounded,
//                       color:kPrimaryColor,
//                     ),
//                     Text(
//                       "نیاز به پشتیبانی دارم",
//                       style: TextStyle(color:kPrimaryColor, fontSize: 20),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 25,
//             ),
//             ListTile(
//               title: Text("دعوت از دوستان"),
//               subtitle: Text("با دعوت از دوستاتون کد تخفیف رایگان بگیرید"),
//               leading: Icon(Icons.people_outline),
//               onTap: () {
//                 invite(context);
//               },
//             ),
//             Container(
//               width: double.infinity,
//               height: 0.2,
//               color: Colors.grey,
//             ),
//             ListTile(
//               title: Text("آدرس ها"),
//               leading: Icon(Icons.map_outlined),
//               onTap: () {
//                 address(context);
//               },
//             ),
//             Container(
//               width: double.infinity,
//               height: 0.2,
//               color: Colors.grey,
//             ),
//             ListTile(
//               title: Text("کارت های هدیه"),
//               leading: Icon(Icons.card_giftcard),
//               onTap: () {},
//             ),
//             Container(
//               width: double.infinity,
//               height: 0.2,
//               color: Colors.grey,
//             ),
//             ListTile(
//               title: Text("کدهای تخفیف"),
//               leading: Icon(Icons.discount_outlined),
//               onTap: () {
//                 takhfifpage(context);
//               },
//             ),
//             Container(
//               width: double.infinity,
//               height: 0.2,
//               color: Colors.grey,
//             ),
//             Container(
//               width: double.infinity,
//               height: 0.2,
//               color: Colors.grey,
//             ),
//             ListTile(
//               title: Text("پرسش های متداول"),
//               leading: Icon(Icons.question_answer_outlined),
//               onTap: () {},
//             ),
//             Container(
//               width: double.infinity,
//               height: 0.2,
//               color: Colors.grey,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
