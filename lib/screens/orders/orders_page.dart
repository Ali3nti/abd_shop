import 'package:abd_shop/screens/Base/base_page.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
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
        title: const Text(
          "سفارش های من",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        // margin: EdgeInsets.all(10),
        color: Colors.grey.shade100,
        child: orders.isNotEmpty
            ? ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
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
                                    child: Image.asset("assets/images/p8.png"),
                                  ),
                                  const Text(
                                    "جت مارکت",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    "|ونک",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const Row(
                                children: [
                                  Text(
                                    "جزییات سفارش",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.navigate_next,
                                    color: Colors.blue,
                                    size: 15,
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
                              Text("جمعه ، 18 آبان 1403 _ 19:42"),
                              Row(
                                children: [
                                  Text("102.304"),
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
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                width: 50,
                                height: 50,
                                color: Colors.grey.shade50,
                                child: Image.asset("assets/images/p16.png"),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                width: 50,
                                height: 50,
                                color: Colors.grey.shade50,
                                child: Image.asset("assets/images/p16.png"),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                width: 50,
                                height: 50,
                                color: Colors.grey.shade50,
                                child: Image.asset("assets/images/p16.png"),
                              ),
                            ],
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
                    child: Container(
                      margin: const EdgeInsets.only(left: 70, top: 30),
                      width: 210,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade900,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "مشاهده فروشگاه های نزدیک",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
