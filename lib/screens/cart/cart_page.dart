import 'package:abd_shop/global.dart';
import 'package:abd_shop/screens/home/home_page.dart';
import 'package:abd_shop/screens/orders/store_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _OrdersBodyState();
}

class _OrdersBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "سبد خرید",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return Padding(
              padding: EdgeInsets.only(left: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/cart.png",
                    width: 300,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'سبد خرید خالی است.',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final item = cart.items[index];
              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "نام محصول: ${item.name}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "مشخصات: ${item.info}",
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                            Text(
                              "تعداد: ${item.cartCount}",
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                            Text(
                              "قیمت:${item.cast}",
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.deepOrange),
                        onPressed: () {
                          // منطق حذف آیتم
                          cart.removeItem(item);
                          setState(() {}); // به‌روزرسانی UI
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
