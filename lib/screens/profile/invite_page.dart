import 'package:abd_shop/constants.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class InvitePage extends StatefulWidget {
  @override
  _InvitePageState createState() => _InvitePageState();
}

class _InvitePageState extends State<InvitePage> {
  // متن دعوت‌نامه از پیش تعیین شده
  final String _defaultMessage =
      'به اپلیکیشن ما خوش آمدید! لطفاً این لینک را با دوستانتان به اشتراک بگذارید: [لینک شما]';

  void _shareInvitation() {
    // استفاده از متن دعوت‌نامه از پیش تعیین شده
    Share.share(_defaultMessage);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepOrange,
        title: Text('دعوت از دوستان'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Text("شما از طریق دکمه زیر می توانید دوستان خود را به برنامه دعوت کنید و از تخفیف های ما استفاده کنید"),
            SizedBox(height: 100),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: _shareInvitation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.share, color: Colors.white),
                  SizedBox(width: 10),
                  Text("دعوت از دوستان",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
