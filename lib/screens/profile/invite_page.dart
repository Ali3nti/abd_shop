import 'package:flutter/material.dart';
import '../../constants.dart';

class InvitePage extends StatefulWidget {
  const InvitePage({Key? key}) : super(key: key);

  @override
  State<InvitePage> createState() => _InvitePageState();
}

class _InvitePageState extends State<InvitePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 35),
            Text(
              "کد تخفیف رایگان",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.asset(
              "assets/images/P31.png",
              height: 150,
              width: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "با دعوت ۱۰ نفر از دوستان‌تون می‌تونید بهشون کد تخفیف 25,000 تومانی هدیه بدید و بعدش به ازای هر دعوت موفق که سفارش ثبت کنند، خودتون هم یک کد تخفیف 25,000 تومانی از ما هدیه بگیرید که در صفحه‌ی “کدهای تخفیف” قابل نمایش خواهد بود.",
                style: TextStyle(fontSize: 18, height: 1.5),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            _buildDiscountCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildDiscountCard() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            "تخفیف برای دوستان شما",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "25,000 تومان",
            style: TextStyle(fontSize: 24, color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Implement share functionality
            },
            icon: const Icon(Icons.share, color: Colors.white),
            label: const Text(
              "اشتراک گذاری با دوستان",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}






// import 'package:flutter/material.dart';
//
// import '../../constants.dart';
//
// class InvitePage extends StatefulWidget {
//   const InvitePage({super.key});
//
//   @override
//   State<InvitePage> createState() => _InvitePageState();
// }
//
// class _InvitePageState extends State<InvitePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(top: 35, left: 200),
//             child: Text(
//               "کد تخفیف رایگان",
//               style: TextStyle(fontSize: 30),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Image.asset(
//             "assets/images/P31.png",
//             height: 150,
//             width: 300,
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: EdgeInsets.all(12),
//             child: Text(
//               "با دعوت ۱۰ نفر از دوستان‌تون می‌تونید بهشون کد تخفیف 25,000 تومانی هدیه بدید و بعدش به ازای هر دعوت موفق که سفارش ثبت کنند، خودتون هم یک کد تخفیف 25,000 تومانی از ما هدیه بگیرید که در صفحه‌ی “کدهای تخفیف” قابل نمایش خواهد بود.",
//               style: TextStyle(fontSize: 18),
//             ),
//           ),
//           Container(
//             width: 350,
//             height: 200,
//             decoration: BoxDecoration(
//                 color: Colors.grey.shade300,
//                 borderRadius: BorderRadius.circular(15)),
//             child: Column(
//               children: [
//                 Row(mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: 110,
//                     ),
//                     Text(
//                       "تخفیف برای دوستان شما",
//                       style: TextStyle(fontSize: 18),
//                     ),
//                     SizedBox(
//                       width: 100,
//                     ),
//                     Text(
//                       "25000",
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   height: 60,
//                   width: 300,
//                   decoration: BoxDecoration(
//                       color: kPrimaryColor,
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.share,
//                         color: Colors.white,
//                       ),
//                       TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           "اشتراک گذاری با دوستان",
//                           style: TextStyle(color: Colors.white, fontSize: 20),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
