import 'package:abd_shop/constants.dart';
import 'package:abd_shop/screens/profile/address_page.dart';
import 'package:flutter/material.dart';

class CurrentUserAddress extends StatelessWidget {
  const CurrentUserAddress({super.key});

  location(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddressPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 30, 0, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Image.asset("assets/images/location.png",width: 16,),
          ),
          const Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "ارسال به",
                  style: kHeaderTextStyle2,
                ),
                SizedBox(width: 5),
                Text(
                  "آباده، میدان آزادی، کوچه هفتم",
                  style: kHeaderTextStyle,
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              location(context);
            },
            child: const Text(
              "تغییر آدرس",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
