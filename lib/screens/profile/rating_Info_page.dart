import 'package:flutter/material.dart';

class ratingInfoPage extends StatelessWidget {
  const ratingInfoPage({super.key, required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.white, // رنگ پس‌زمینه
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.vertical(top: Radius.circular(20)), // گوشه‌های گرد
          ),
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/comments_man.png",
                      width: 200, height: 200, fit: BoxFit.cover),
                  const SizedBox(height: 10),
                  const Text("هنوز امتیاز و دیدگاهی ثبت نکرده‌اید!",
                      style:
                      TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text(
                    "با ثبت امتیاز و دیدگاه می‌توانید رضایت یا ناراضایتی خود را به فروشگاه اعلام، و خریداران را راهنمایی کنید.",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // عملکرد دکمه ثبت نظر
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepOrange,
                      // رنگ متن دکمه
                      padding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // گوشه‌های گرد
                      ),
                    ),
                    child: const Text("ثبت امتیاز و دیدگاه",
                        style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            );
          },
        );
      },
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