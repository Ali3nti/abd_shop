import 'dart:math';
import 'package:flutter/material.dart';

class WheelOfFortune extends StatefulWidget {
  @override
  _WheelOfFortuneState createState() => _WheelOfFortuneState();
}

class _WheelOfFortuneState extends State<WheelOfFortune>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _rotation = 0;

  final List<String> prizes = [
    'جایزه 1',
    'جایزه 2',
    'جایزه 3',
    'جایزه 4',
    'جایزه 5',
    'جایزه 6',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
  }

  void spinWheel() {
    final random = Random();
    final spins = random.nextInt(360) + 720; // 2 دور + یک دور تصادفی
    _controller.forward(from: 0);
    _controller.addListener(() {
      setState(() {
        _rotation = _controller.value * spins;
      });
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        int selectedPrizeIndex = ((spins % 360) / (360 / prizes.length)).floor();
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('شما برنده شدید!'),
            content: Text(prizes[selectedPrizeIndex]),
            actions: [
              TextButton(
                child: Text('باشه'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.rotate(
            angle: _rotation * (pi / 180),
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.red,
                    Colors.blue,
                    Colors.green,
                    Colors.yellow,
                    Colors.orange,
                    Colors.purple,
                  ],
                ),
              ),
              child: CustomPaint(
                painter: WheelPainter(prizes),
              ),
            ),
          ),
          Positioned(
            top: 10,
            child: Container(
              width: 0,
              height: 0,
              child: CustomPaint(
                painter: ArrowPainter(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: spinWheel,
            child: Text('چرخش گردونه'),
          ),
        ],
      ),
    );
  }
}

class WheelPainter extends CustomPainter {
  final List<String> prizes;

  WheelPainter(this.prizes);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..style = PaintingStyle.fill;
    final double radius = size.width / 2;

    for (int i = 0; i < prizes.length; i++) {
      final double startAngle = (i * 2 * pi) / prizes.length;
      final double sweepAngle = (2 * pi) / prizes.length;

      paint.color = Colors.primaries[i % Colors.primaries.length];
      canvas.drawArc(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );

      TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: prizes[i],
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();
      double x = radius + (radius / 2) * cos(startAngle + sweepAngle / 2) - textPainter.width / 2;
      double y = radius + (radius / 2) * sin(startAngle + sweepAngle / 2) - textPainter.height / 2;

      textPainter.paint(canvas, Offset(x, y));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.black;

    Path path = Path();
    path.moveTo(-10, 0);
    path.lineTo(10, 0);
    path.lineTo(0, -20);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
