import 'package:flutter/material.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 240),
            child: Text(
              "حساب کاربری",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Row(
              children: [
                Text(
                  "محمدمهدی دهقانی",
                  style: TextStyle(fontSize: 28),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit, color: Colors.blue, size: 30),
                ),
                SizedBox(
                  width: 15,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_rounded,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.output_outlined, size: 30),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 288),
            child: Text(
              "09164438875",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Container(
            width: 380,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.deepOrange, width: 3)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.headset_mic_rounded,
                    color: Colors.deepOrange,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "نیاز به پشتیبانی دارم",
                    style: TextStyle(color: Colors.deepOrange, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
