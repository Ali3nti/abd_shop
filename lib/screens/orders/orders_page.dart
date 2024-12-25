import 'package:abd_shop/models/order_model.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/screens/Base/base_page.dart';
import 'package:abd_shop/screens/orders/order_tracking_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shamsi_date/shamsi_date.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  List<Order> orders = List.generate(10, (index) {
    Order order = Order();
    order.id = index + 1;
    order.userId = 1;
    order.totalPrice = 20000.0;
    order.orderDate = DateTime.now().subtract(Duration(days: index));

    order.products = List.generate(3, (productIndex) {
      Product product = Product();
      product.image = "assets/images/p${productIndex + 1}.png";
      return product;
    });

    order.storeName = "دیلی مارکت آباده";
    return order;
  });

  String formatPersianDate(DateTime date) {
    final gregorianDate = Gregorian(date.year, date.month, date.day);
    final jalaliDate = Jalali.fromGregorian(gregorianDate);

    final formattedDate =
        '${jalaliDate.day} / ${jalaliDate.month} / ${jalaliDate.year}';
    final formattedDay = DateFormat('EEEE', 'fa_IR').format(date);
    final formattedTime = DateFormat('HH:mm').format(date);

    return '$formattedDay $formattedDate _ $formattedTime';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "سفارش های من",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey.shade100,
        child: orders.isNotEmpty
            ? ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Container(
                    margin: const EdgeInsets.all(10),
                    height: 270,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: Image.asset(
                                      "assets/images/p${index + 1}.png",
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    order.storeName,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const OrderTrackingPage(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "جزییات سفارش",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.navigate_next,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                formatPersianDate(
                                  order.orderDate.toLocal(),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    order.totalPrice.toString(),
                                  ),
                                  Image.asset(
                                    width: 15,
                                    'assets/images/toman.png',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: order.products.map((product) {
                              return Container(
                                margin: const EdgeInsets.only(right: 10),
                                width: 50,
                                height: 50,
                                color: Colors.grey.shade100,
                                child: Image.asset(
                                  product.image,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 7, left: 7, top: 15),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.deepOrange,
                                  width: 3,
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.sms_outlined,
                                    color: Colors.deepOrange,
                                    size: 30,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "ثبت امتیاز و بازخورد",
                                    style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            : Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 60, top: 30),
                    height: 300,
                    width: 300,
                    child: Image.asset("assets/images/P31.png"),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 70, top: 2),
                    child: const Text(
                      "اینجا سفارش ندارید!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 70, top: 10),
                    child: const Text(
                      "چندین فروشگاه دیگر نزدیک شما هستند.",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BasePage(),
                        ),
                      );
                    },
                    child: const Text(
                      "مشاهده فروشگاه‌ها",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}


// import 'package:abd_shop/screens/home/base_page.dart';
// import 'package:flutter/material.dart';
//
// class OrdersBody extends StatefulWidget {
//   const OrdersBody({super.key});
//
//   @override
//   State<OrdersBody> createState() => _OrdersBdyState();
// }
//
// class _OrdersBdyState extends State<OrdersBody> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body:
//     Column(
//       children: [
//         Container(
//           //color: Colors.red,
//           margin: const EdgeInsets.only(left: 60,top: 30),
//           height: 300,
//           width: 300,
//           child: Image.asset("assets/images/P31.png"),
//         ),
//         Container(
//             margin: const EdgeInsets.only(left: 70, top: 2),
//             child: const Text(
//               "اینجا سفارش ندارید!",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             )),
//         Container(
//             margin: const EdgeInsets.only(left: 70, top: 10),
//             child: const Text(
//               "چندین فروشگاه دیگر نزدیک شما هستند.",
//               style: TextStyle(
//                 fontSize: 14,
//               ),
//             )),
//         InkWell(
//           onTap: (){
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const HomePage(),
//               ),
//             );
//           },
//           child: Container(
//             margin: const EdgeInsets.only(left: 70, top: 30),
//             width: 210,
//             height: 50,
//             decoration: BoxDecoration(
//               color: Colors.orange.shade900,
//               borderRadius: BorderRadius.circular(10),),
//             child:  const Center(
//               child: Text("مشاهده فروشگاه های نزدیک",style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),);
//   }
// }


