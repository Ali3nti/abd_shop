import 'package:abd_shop/constants.dart';
import 'package:abd_shop/screens/profile/address_page.dart';
import 'package:flutter/material.dart';

class CurrentUserAddress extends StatelessWidget {
  const CurrentUserAddress({super.key});

  location(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddressPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.location_on_outlined,
            color: kPrimaryColor,
            size: 35,
          ),
          const SizedBox(width: 15),
          // Spacing between icon and text
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "آدرس انتخابی",
                  style: kHeaderTextStyle,
                ),
                SizedBox(height: 5),
                Text(
                  "آباده، میدان آزادی، کوچه هفتم",
                  style: kHeaderTextStyle2,
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
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
