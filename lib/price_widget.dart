import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Size { small, medium, large }

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    required this.price,
    this.size = Size.large,
  });

  final int price;
  final Size size;

  currencyConvertor(int number) {
    var persianCurrencyFormat =
    NumberFormat.currency(symbol: '', decimalDigits: 0);
    return persianCurrencyFormat.format(number);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          currencyConvertor(price),
          style: TextStyle(
            fontSize: (size == Size.small)
                ? 10
                : (size == Size.medium)
                ? 15
                : (size == Size.large)
                ? 20
                : 0,
            // fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 6),
        Image.asset(
          'assets/images/toman.png',
          scale: 5.0,
        ),
      ],
    );
  }
}
