import 'package:abd_shop/constants.dart';
import 'package:abd_shop/screens/profile/profile_page.dart';
import 'package:flutter/material.dart';

class supportButton extends StatelessWidget {
  const supportButton({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {
        supportPage(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.headset_mic_rounded, color: Colors.white),
          SizedBox(width: 10),
          Text("نیاز به پشتیبانی دارم",
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ],
      ),
    );
  }
}