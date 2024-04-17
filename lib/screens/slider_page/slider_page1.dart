import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../home/components/home_body.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();


}

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(padding: EdgeInsets.only(left: 350,top: 30),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_outlined,size: 32,),
          ),
        ),
        SizedBox(height: 5,),
        Padding(padding: EdgeInsets.only(right: 15,left: 15),
          child: InkWell(onTap: (){},
            child: Material(
              child: Container(
                height: 50,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, size: 30, color: Colors.grey.shade600),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          const Text(
                            "جستجو در",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            'assets/images/logo.png',
                            color: Colors.deepOrange,
                            width: 90,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
