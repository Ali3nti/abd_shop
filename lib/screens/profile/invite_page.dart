import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class InvitePage extends StatefulWidget {
  @override
  _InvitePageState createState() => _InvitePageState();
}

class _InvitePageState extends State<InvitePage> {
  final TextEditingController _messageController = TextEditingController();

  void _shareInvitation() {
    final message = _messageController.text;

    if (message.isNotEmpty) {
      // اشتراک‌گذاری پیام
      Share.share(message);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('لطفاً یک متن دعوت وارد کنید.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('دعوت از دوستان'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _messageController,
              decoration: InputDecoration(
                labelText: 'متن دعوت',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _shareInvitation,
              child: Text('ارسال دعوت‌نامه'),
            ),
          ],
        ),
      ),
    );
  }
}
