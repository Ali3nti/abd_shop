import 'package:flutter/material.dart';

class DiscountCodePage extends StatefulWidget {
  const DiscountCodePage({Key? key}) : super(key: key);

  @override
  State<DiscountCodePage> createState() => _DiscountCodePageState();
}

class _DiscountCodePageState extends State<DiscountCodePage> {
  final TextEditingController _controller = TextEditingController();
  String _message = '';

  void _applyDiscount() {
    // اینجا می‌توانید منطق بررسی کد تخفیف را پیاده‌سازی کنید
    setState(() {
      if (_controller.text.isNotEmpty) {
        _message = 'کد تخفیف "${_controller.text}" با موفقیت اعمال شد!';
      } else {
        _message = 'لطفاً کد تخفیف را وارد کنید.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('وارد کردن کد تخفیف'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'کد تخفیف خود را وارد کنید',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'کد تخفیف',
                border: OutlineInputBorder(),
                hintText: 'مثلاً: DISCOUNT25',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _applyDiscount,
              child: const Text(
                'اعمال کد تخفیف',
                style: TextStyle(fontSize: 18,color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _message,
              style: TextStyle(fontSize: 18, color: Colors.green),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
