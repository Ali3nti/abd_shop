import 'package:abd_shop/constants.dart';
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
  void initState() {
    super.initState();
    _isExpanded = cartList.containsKey(widget.product.id);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isExpanded
          ? Container(
        width: 70,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.red.shade50,
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
                context.read<CartUpdater>().incrementNumber(); // notify
                setState(() {});
              },
              child: Icon(
                Icons.add,
                color: kPrimaryColor,
                size: 20,
              ),
            ),
            Text(
              cartList[widget.product.id]!.count.toString(),
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 20,
              ),
            ),
            InkWell(
              onTap: () {
                Cart cart = cartList[widget.product.id]!;
                if (cart.count > 1) {
                  cart.count--;
                  cartList.update(widget.product.id, (value) => cart);
                } else {
                  cartList.remove(widget.product.id);
                  _isExpanded = false;
                }
                context.read<CartUpdater>().decrementNumber();
                setState(() {});
              },
              child: Icon(
                Icons.remove,
                color: kPrimaryColor,
                size: 20,
              ),
            ),
          ],
        ),
      )
          : GestureDetector(
        onTap: () {
          Cart newCart = Cart(
            id: widget.product.id,
            product: widget.product,
            count: 1,
          );
          cartList[widget.product.id] = newCart;
          context.read<CartUpdater>().incrementNumber();
          setState(() {
            _isExpanded = true;
          });
        },
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
          child: Text(
            '+',
            style: TextStyle(
              fontSize: 20,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
