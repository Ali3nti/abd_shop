import 'package:abd_shop/screens/profile/component/box_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductSheet extends StatelessWidget {
  final String imgproduct;
  final Text detailtext;
  final Text pricetext;

  const ProductSheet({
    Key? key,
    required this.detailtext,
    required this.imgproduct,
    required this.pricetext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0), // Padding around the container
      child: ListView(
        children: [
          const SizedBox(height: 1),
          Center(
            child: Image.asset(
              imgproduct,
              width: 200,
              height: 200,
              fit: BoxFit.cover, // Ensures the image fits well
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: detailtext,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                pricetext,
                const SizedBox(width: 8),
                Image.asset("assets/images/toman.png", width: 20),
              ],
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement add to cart functionality
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
              backgroundColor: Colors.deepOrange,
              // Button color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(CupertinoIcons.cart_badge_plus, color: Colors.white),
                const SizedBox(width: 10),
                const Text(
                  "افزودن به سبد خرید",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:abd_shop/screens/profile/component/box_widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class ProductSheet extends StatelessWidget {
//   ProductSheet({
//     super.key,
//     required this.detailtext,
//     required this.imgproduct,
//     required this.pricetext,
//   });
//
//   String imgproduct;
//   Text detailtext;
//   Text pricetext;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(color:Colors.white,
//       child: ListView(scrollDirection: Axis.vertical,
//         children: [
//           SizedBox(height:15 ,),
//           Image.asset(imgproduct,width: 200,height: 150,),
//           SizedBox(height:20),
//           Padding(
//             padding: const EdgeInsets.only(right: 70,top: 20),
//             child: detailtext,
//           ),
//           SizedBox(height:20),
//           Padding(
//             padding: const EdgeInsets.only(right:170),
//             child: Row(
//               children: [
//                 pricetext,
//                 SizedBox(width: 8,),
//                 Image.asset("assets/images/toman.png",width: 20,),
//               ],
//             ),
//           ),
//           SizedBox(height: 30),
//           InkWell(onTap: (){},
//             child: Padding(
//               padding: const EdgeInsets.all(30),
//               child: BoxWidget(
//                 iconData: CupertinoIcons.cart_badge_plus,
//                 text: Text("افزودن به سبد خرید"),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
