import 'package:abd_shop/constants.dart';
import 'package:abd_shop/global.dart';
import 'package:abd_shop/screens/base/base_page.dart';
import 'package:abd_shop/screens/cart/continue_cart_page.dart';
import 'package:abd_shop/widget/provider/cart_updater_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

final formatter = NumberFormat('#,###');

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartUpdater = Provider.of<CartUpdater>(context, listen: false);

    double totalPrice = cartList.values.fold(0, (sum, cartItem) {
      return sum + (cartItem.product.price.toDouble() * cartItem.count);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'سبد خرید',
          style: TextStyle(
            color: kWhiteColor,
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: cartList.isEmpty
          ? Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Lottie.asset(
              'assets/images/Animation - 1735324794589.json',
              height: 250,
              width: 500,
              repeat: false,
            ),
          ),
          const Text('سبد خرید خالی است!'),
          const SizedBox(height: 70),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const BasePage(),
                ),
              );
            },
            child: Stack(
              children: [
                Image.asset("assets/images/55.png"),
                const Padding(
                  padding: EdgeInsets.only(right: 110, top: 19),
                  child: Text(
                    "می خواهم خرید کنم",
                    style: kHeaderTextStyle,
                  ),
                )
              ],
            ),
          )
        ],
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (context, index) {
                final cartItem = cartList.values.elementAt(index);
                double itemTotalPrice =
                    cartItem.product.price.toDouble() * cartItem.count;

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 6,
                  margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        cartItem.product.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 6),
                          Text(
                            'تعداد: ${cartItem.count}',
                            style: TextStyle(
                              color: Colors.deepOrange.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${formatter.format(itemTotalPrice)} تومان',
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_forever, color: Colors.redAccent, size: 28),
                        tooltip: "حذف محصول",
                        onPressed: () {
                          setState(() {
                            cartList.remove(cartItem.product.id);
                            cartUpdater.setCounter(cartList.length);
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            height: 55,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: kPrimaryColor.withOpacity(0.5),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContinueCartPage(),
                  ),
                );
              },
              child: const Center(
                child: Text(
                  "پرداخت نهایی",
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
