import 'package:abd_shop/screens/profile/rate_page/rate_page.dart';
import 'package:flutter/material.dart';

class ratingInfoPage extends StatelessWidget {
  const ratingInfoPage({super.key, required this.context});

  final BuildContext context;

  void ratePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RatePage(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){ratePage(context);},
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // گوشه‌های گرد کارت
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10), // گوشه‌های گرد تصویر
                child: Image.asset("assets/images/comment.png",
                    width: 50, height: 50),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("امتیاز و دیدگاه",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("50 دیدگاه", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
//
// class ratingInfoPage extends StatelessWidget {
//   const ratingInfoPage({super.key, required this.context});
//   final BuildContext context;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         showModalBottomSheet(
//           context: context,
//           builder: (context) {
//             return Container(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Image.asset("assets/images/comments_man.png",
//                       width: double.infinity, height: 200),
//                   const SizedBox(height: 10),
//                   const Text("هنوز امتیاز و دیدگاهی ثبت نکرده اید!",
//                       style: TextStyle(fontSize: 19)),
//                   const SizedBox(height: 10),
//                   const Text(
//                     "با ثبت امتیاز و دیدگاه می توانید رضایت یا ناراضایتی خود را به فروشگاه اعلام، و خریداران را راهنمایی کنید",
//                     style: TextStyle(fontSize: 15, color: Colors.grey),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//       child: Card(
//         elevation: 5,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             children: [
//               Image.asset("assets/images/comment.png", width: 50, height: 50),
//               const SizedBox(width: 10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text("امتیاز و دیدگاه", style: TextStyle(fontSize: 18)),
//                   Text("50 دیدگاه", style: TextStyle(color: Colors.grey)),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }