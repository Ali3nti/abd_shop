import 'package:flutter/material.dart';

class NewOrderPage extends StatefulWidget {
  const NewOrderPage({super.key});

  @override
  State<NewOrderPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<NewOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
          "سفارشات جدید",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body:  Container(
        margin: const EdgeInsets.all(2),
        color: Colors.white,
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: const Row(
                  children: [
                   Icon(
                    Icons.arrow_back_ios_new,
                     color:Colors.orangeAccent,
                    size: 20,
                  ),
                    SizedBox(width: 2),
                    Text("آیتم های سفارش",
                    style: TextStyle(
                      color:Colors.orangeAccent,
                    ),
                    ),
                        ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "نام محصول",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "شناسه سفارش",
                  ),
                  Text(
                    "تاریخ سفارش",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}