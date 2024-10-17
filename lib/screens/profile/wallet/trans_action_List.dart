import 'package:flutter/material.dart';

class transActionList extends StatelessWidget {
  const transActionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // اینجا می‌توانید لیستی از تراکنش‌ها را نمایش دهید
    final transactions = [
      {"date": "1403/07/01", "amount": "-200,000 تومان", "description": "خرید از فروشگاه"},
      {"date": "1403/06/28", "amount": "+500,000 تومان", "description": "شارژ کیف پول"},
      {"date": "1403/06/15", "amount": "-150,000 تومان", "description": "خرید از فروشگاه"},
    ];

    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
            title: Text(transaction["description"]!),
            subtitle: Text(transaction["date"]!),
            trailing: Text(
              transaction["amount"]!,
              style: TextStyle(
                color: transaction["amount"]!.startsWith("+") ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
