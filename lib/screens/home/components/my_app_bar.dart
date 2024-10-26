import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../search/search_page.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  void search(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2, // Adds a subtle shadow
      title: GestureDetector(
        onTap: () {
          search(context);
        },
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16), // Horizontal padding
          decoration: BoxDecoration(
            color: Colors.grey.shade200, // Lighter background
            borderRadius: BorderRadius.circular(30), // More rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(Icons.search, size: 28, color: Colors.grey.shade600),
              const SizedBox(width: 10),
              Expanded(
                child: Row(
                  children: [
                    const Text(
                      "جستجو در",
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/images/logo.png',
                      color: kPrimaryColor,
                      width: 90,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






//
// import 'package:flutter/material.dart';
//
// import '../../../constants.dart';
// import '../../search/search_page.dart';
//
// class MyAppBar extends StatelessWidget  implements PreferredSizeWidget {
//   const MyAppBar({super.key});
//
//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);
//
//   search(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const SearchPage(),
//       ),
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.white10,
//       scrolledUnderElevation: 0,
//       title: GestureDetector(
//         onTap: () {
//           search(context);
//         },
//         child: Container(
//           height: 50,
//           padding: EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             color: Colors.grey.shade300,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Row(
//             children: [
//               Icon(Icons.search, size: 30, color: Colors.grey.shade600),
//               SizedBox(
//                 width: 5,
//               ),
//               Expanded(
//                 child: Row(
//                   children: [
//                     const Text(
//                       "جستجو در",
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     const SizedBox(
//                       width: 4,
//                     ),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     Image.asset(
//                       'assets/images/logo.png',
//                       color:kPrimaryColor,
//                       width: 90,
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// }
