import 'package:abd_shop/screens/profile/notif_page/notif_card.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("اعلان‌ها"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            NotificationCard(
              title: "تخفیف ویژه!",
              message: "از 20% تخفیف برای خریدهای بالای 200,000 تومان بهره‌مند شوید.",
              date: "1403/07/15",
            ),
            NotificationCard(
              title: "محصول جدید",
              message: "محصول جدید ما به فروشگاه اضافه شد! حتماً ببینید.",
              date: "1403/07/10",
            ),
            NotificationCard(
              title: "تغییرات در ساعات کاری",
              message: "ساعات کاری ما در روزهای جمعه تغییر کرده است.",
              date: "1403/07/05",
            ),
            // می‌توانید اعلان‌های بیشتری اضافه کنید
          ],
        ),
      ),
    );
  }
}


