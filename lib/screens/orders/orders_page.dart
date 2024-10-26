import 'package:abd_shop/screens/home/home_page.dart';
import 'package:flutter/material.dart';

class OrdersBody extends StatefulWidget {
  const OrdersBody({Key? key}) : super(key: key);

  @override
  _OrdersBodyState createState() => _OrdersBodyState();
}

class _OrdersBodyState extends State<OrdersBody> {
  // لیست سفارشات
  List<Map<String, String>> orders = List.generate(
    10,
        (index) => {
      'orderNumber': 'سفارش شماره: ${index + 1}',
      'date': 'تاریخ: 2024-10-17',
      'total': 'مجموع: 200,000 تومان',
      'status': 'در حال پردازش',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سفارشات من'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: orders.isNotEmpty ? ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orders[index]['orderNumber']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(orders[index]['date']!),
                    const SizedBox(height: 8),
                    Text(orders[index]['total']!),
                    const SizedBox(height: 8),
                    Text(
                      orders[index]['status']!,
                      style: TextStyle(color: Colors.orange),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // عملکرد برای مشاهده جزئیات سفارش
                          },
                          child: const Text('جزئیات'),
                        ),
                        TextButton(
                          onPressed: () {
                            // لغو سفارش و حذف از لیست
                            setState(() {
                              orders.removeAt(index);
                            });
                          },
                          child: const Text('لغو سفارش', style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ) :Column(
          children: [
            Container(
              //color: Colors.red,
              margin: const EdgeInsets.only(left: 60,top: 30),
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
                )),
            Container(
                margin: const EdgeInsets.only(left: 70, top: 10),
                child: const Text(
                  "چندین فروشگاه دیگر نزدیک شما هستند.",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                )),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 70, top: 30),
                width: 210,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.orange.shade900,
                  borderRadius: BorderRadius.circular(10),),
                child:  const Center(
                  child: Text("مشاهده فروشگاه های نزدیک",style: TextStyle(
                      color: Colors.white,
                      fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),),
      );
  }
}




// import 'package:abd_shop/screens/home/home_page.dart';
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
