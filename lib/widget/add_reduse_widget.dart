import 'package:abd_shop/cart_updater_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddReducewidget extends StatefulWidget {
  const AddReducewidget({super.key});

  @override
  State<AddReducewidget> createState() => _AddReducewidgetState();
}

class _AddReducewidgetState extends State<AddReducewidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 40,
            width: 90,
            child: Row(
              children: [
                SizedBox(width: 3),
                InkWell(
                  onTap: () {
                    context.read<CartUpdater>().incrementNumber();
                  },
                  child: Icon(Icons.add,color: Colors.orange.shade800),
                ),
                SizedBox(width: 10),
                Text( context.watch<CartUpdater>().counterValue.toString(),
                ),
                SizedBox(width: 10),
                InkWell(
                    onTap: () {
                      context.read<CartUpdater>().decrementNumber();
                    },
                    child: Icon(Icons.delete,color: Colors.orange.shade800))
              ],
            ),
          ),
        ),
    );

  }
}
