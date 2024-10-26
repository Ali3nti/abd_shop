import 'package:abd_shop/screens/profile/wallet/action_button.dart';
import 'package:abd_shop/screens/profile/wallet/card_wallet.dart';
import 'package:abd_shop/screens/profile/wallet/trans_action_List.dart';
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
            CardWallet(),
            const SizedBox(height: 20),
            const Text(
              "تاریخچه تراکنش‌ها",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: transActionList(),
            ),
            ActionButton(),
          ],
        ),
      ),
    );
  }

}

