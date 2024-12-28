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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
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
    );
  }
}



