import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("کیف پول من"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBalanceCard(),
            const SizedBox(height: 20),
            const Text(
              "تاریخچه تراکنش‌ها",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(child: _buildTransactionList()),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "موجودی فعلی",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "۱,۵۰۰,۰۰۰ تومان",
              style: TextStyle(fontSize: 32, color: Colors.teal),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionList() {
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

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            // عملکرد دکمه شارژ کیف پول
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.teal,
          ),
          child: const Text("شارژ کیف پول"),
        ),
        ElevatedButton(
          onPressed: () {
            // عملکرد دکمه برداشت از کیف پول
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.teal,
          ),
          child: const Text("برداشت از کیف پول"),
        ),
      ],
    );
  }
}
