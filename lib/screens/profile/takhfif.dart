import 'package:flutter/material.dart';

class DiscountCodePage extends StatefulWidget {
  const DiscountCodePage({Key? key}) : super(key: key);

  @override
  State<DiscountCodePage> createState() => _DiscountCodePageState();
}

class _DiscountCodePageState extends State<DiscountCodePage> {
  final TextEditingController _controller = TextEditingController();
  String _message = '';
  bool _isButtonPressed = false;

  void _applyDiscount() {
    const String validDiscountCode = '1382';

    setState(() {
      _isButtonPressed = true; // دکمه فشرده شده است
      if (_controller.text.isNotEmpty) {
        if (_controller.text == validDiscountCode) {
          _message = 'کد تخفیف "${_controller.text}" با موفقیت اعمال شد!';
        } else {
          _message = 'کد تخفیف نامعتبر است. لطفاً دوباره تلاش کنید.';
        }
      } else {
        _message = 'لطفاً کد تخفیف را وارد کنید.';
      }
    });

    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _isButtonPressed = false;
      });
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
            AnimatedScale(
              scale: _isButtonPressed ? 0.9 : 1.0, // تغییر اندازه دکمه
              duration: Duration(milliseconds: 100),
              curve: Curves.bounceOut,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.bounceOut,
                child: ElevatedButton(
                  onPressed: _applyDiscount,
                  child: const Text(
                    'اعمال کد تخفیف',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isButtonPressed
                        ? Colors.teal
                        : Colors.deepOrange,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _message,
              style: TextStyle(
                  fontSize: 18,
                  color:
                      _message.contains('نامعتبر') ? Colors.red : Colors.green),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
