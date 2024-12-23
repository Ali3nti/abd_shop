import 'package:flutter/material.dart';

class DeliveryDriverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'صفحه راننده پیک',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepOrange.shade400, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'اطلاعات بسته',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange),
                  ),
                  SizedBox(height: 20),
                  InfoCard(
                    title: 'آدرس مبدا',
                    content: 'خیابان ۲، پلاک ۵، تهران',
                    icon: Icons.store,
                  ),
                  InfoCard(
                    title: 'آدرس تحویل',
                    content: 'خیابان ۱، پلاک ۲، تهران',
                    icon: Icons.location_on,
                  ),
                  InfoCard(
                    title: 'اطلاعات مشتری',
                    content: 'نام: علی رضایی\nشماره تماس: 09123456789',
                    icon: Icons.person,
                  ),
                  InfoCard(
                    title: 'هزینه تحویل',
                    content: '50,000 تومان',
                    icon: Icons.attach_money,
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        backgroundColor: Colors.deepOrange,
                        textStyle: TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'شروع تحویل',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(),
                  SizedBox(height: 20),
                  Text(
                    'نکات مهم:',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '1. قبل از حرکت، آدرس‌ها را چک کنید.\n'
                    '2. با مشتری تماس بگیرید و زمان تحویل را هماهنگ کنید.\n'
                    '3. در صورت بروز مشکل، با پشتیبانی تماس بگیرید.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;

  InfoCard({required this.title, required this.content, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(shadowColor: Colors.deepOrange,
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.deepOrange),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(content),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
