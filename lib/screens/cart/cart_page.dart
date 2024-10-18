import 'package:abd_shop/global.dart';
import 'package:abd_shop/screens/cart/continue_cart_page.dart';
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
            return SizedBox(
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                height: 200,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin:  EdgeInsets.only(top: 10, right: 10),
                          width: 60,
                          height: 60,
                          child: Image.asset("assets/images/p8.png"),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "جت مارت",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "|ونک",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 190),
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Icon(Icons.navigate_next),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 160),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.bike_scooter_sharp,
                                    size: 15,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "6,500 تومان",
                                    style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "45 دقیقه",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 50,
                            height: 50,
                            color: Colors.grey.shade50,
                            child: Image.asset("assets/images/p16.png"),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 1),
                            width: 50,
                            height: 50,
                            color: Colors.grey.shade50,
                            child: Image.asset("assets/images/p12.png"),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 1, left: 10),
                            width: 50,
                            height: 50,
                            color: Colors.grey.shade50,
                            child: Image.asset("assets/images/p7.png"),
                          ),
                          Column(
                            children: [
                              const Icon(Icons.delete),
                              Text(
                                "حذف سبد خرید",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ContinueCartPage(),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 20),
                            width: 170,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.orange.shade900,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                "ادامه خرید",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        Column(
                          children: [
                            Text(
                              "جمع سبد خرید (3 مورد)",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: const Text(
                                "155.300 تومان",
                                style:
                                TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
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
                              "قیمت: ${item.cast}",
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
