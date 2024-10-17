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
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      appBar: AppBar(
        title: const Text(
          "سبد خرید",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
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
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'سبد خرید خالی است.',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final item = cart.items[index];
              return InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text("نام محصول: ${item.name}"),
                        SizedBox(
                          width: 40,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 40),
                        //   child: Text('تعداد سفارش: ${item.cartCount}'),
                        // ),
                        // دکمه حذف
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            // منطق حذف آیتم
                            cart.removeItem(item);
                            setState(() {}); // به‌روزرسانی UI
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 260),
                      child: Text(
                        " مشخصات:${item.info}",
                        style: TextStyle(color: Colors.deepOrange),
                      ),
                    ),
                    Container(
                      height: 0.75,
                      width: 500,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}


// ListTile
// (
// title: Text(item.name),
// subtitle: Text(item.info),
// trailing: Text('Count: ${item.cartCount}'),
// onTap: () {
// // منطق برای کلیک روی آیتم
// },
// );

// import 'package:abd_shop/widget/cart_widget.dart';
// import 'package:flutter/material.dart';
//
// class CartBody extends StatefulWidget {
//   const CartBody({super.key});
//
//   @override
//   State<CartBody> createState() => _CartBodyState();
// }
//
// class _CartBodyState extends State<CartBody> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade200,
//       appBar: AppBar(
//         title: const Text(
//           "سبد خرید",
//           style: TextStyle(
//             fontSize: 28,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: const SingleChildScrollView(
//         child: Column(
//           children: [
//             CartWidget(),
//             CartWidget(),
//             CartWidget(),
//             CartWidget(),
//             CartWidget(),
//             CartWidget(),
//           ],
//         ),
//       ),
//     );
//   }
// }
