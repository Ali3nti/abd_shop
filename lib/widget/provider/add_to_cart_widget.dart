import 'package:abd_shop/global.dart';
import 'package:abd_shop/models/cart_model.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/widget/provider/cart_updater_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCartWidget extends StatefulWidget {
  const AddToCartWidget({super.key, required this.product});

  final Product product;

  @override
  State<AddToCartWidget> createState() => _AddToCartWidgetState();
}

class _AddToCartWidgetState extends State<AddToCartWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isExpanded
          ? Container(
              width: 70,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Cart cart = cartList[widget.product.id]!;
                      cart.count++;
                      cartList.update(widget.product.id, (value) => cart);
                      // context.read<CartUpdater>().incrementNumber();
                      setState(() {});
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.orange.shade900,
                      size: 15,
                    ),
                  ),
                  SizedBox(width: 3),
                  Text(
                    cartList[widget.product.id]!.count.toString(),
                    style: TextStyle(
                      color: Colors.orange.shade900,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(width: 3),
                  InkWell(
                    onTap: () {
                      // if (context.read<CartUpdater>().counterValue > 0) {
                      context.read<CartUpdater>().decrementNumber();
                      // }
                      // if (context.read<CartUpdater>().counterValue == 0) {
                      cartList.remove(widget.product.id);
                      setState(() {
                        _isExpanded = false;
                      });
                      // }
                      setState(() {});
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.orange.shade900,
                      size: 15,
                    ),
                  ),
                ],
              ),
            )
          : GestureDetector(
              onTap: () {
                Cart newCart = Cart(
                  id: cartList.length,
                  product: widget.product,
                  count: 1,
                );
                cartList.addEntries([MapEntry(widget.product.id, newCart)]);
                context.read<CartUpdater>().incrementNumber();
                setState(
                  () {
                    _isExpanded = true;
                  },
                );
              },
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: Text(
                  '+',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.orange.shade900,
                  ),
                ),
              ),
            ),
    );
  }
}
