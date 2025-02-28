import 'package:abd_shop/widget/provider/cart_updater_model.dart';
import 'package:abd_shop/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderWidget2 extends StatefulWidget {
  const ProviderWidget2({Key? key}) : super(key: key);

  @override
  State<ProviderWidget2> createState() => _ProviderWidgetState();
}

class _ProviderWidgetState extends State<ProviderWidget2> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isExpanded
          ? Container(
              width: 85,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 3),
                  InkWell(
                    onTap: () {
                      context.read<CartUpdater>().incrementNumber();
                      setState(() {});
                    },
                    child: Icon(Icons.add, color: Colors.orange.shade900),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    context.watch<CartUpdater>().counterValue.toString(),
                    style:
                        TextStyle(color: Colors.orange.shade900, fontSize: 20),
                  ),
                  const SizedBox(width: 3),
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
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isExpanded = true;
                    });
                  },
                  child: const Center(
                    child: Text(
                      'اضافه به سبد محصول',
                      style: TextStyle(
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
