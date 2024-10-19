import 'package:abd_shop/cart_updater_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderWidget extends StatefulWidget {
  const ProviderWidget({Key? key}) : super(key: key);

  @override
  State<ProviderWidget> createState() => _ProviderWidgetState();
}

class _ProviderWidgetState extends State<ProviderWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isExpanded
          ? Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.orange.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                context.read<CartUpdater>().incrementNumber();
                setState(() {});
              },
              child: Icon(Icons.add, color: Colors.orange.shade900),
            ),
            const SizedBox(width: 5),
            Text(
              context.watch<CartUpdater>().counterValue.toString(),
              style: TextStyle(
                  color: Colors.orange.shade900, fontSize: 20),
            ),
            const SizedBox(width: 5),
            InkWell(
              onTap: () {
                if (context.read<CartUpdater>().counterValue > 0) {
                  context.read<CartUpdater>().decrementNumber();
                }
                if (context.read<CartUpdater>().counterValue == 0) {
                  setState(() {
                    _isExpanded = false;
                  });
                }
                setState(() {});
              },
              child: Icon(Icons.delete, color: Colors.orange.shade900),
            ),
          ],
        ),
      )
          : GestureDetector(
        onTap: () {
          setState(() {
            _isExpanded = true;
          });
        },
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              setState(() {
                _isExpanded = true;
              });
            },
            child: Text(
              '+',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
