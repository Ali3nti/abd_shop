import 'package:abd_shop/models/amazing_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class AmazingItemWidget extends StatefulWidget {
  AmazingItemWidget({super.key, this.onPressed, required this.amazingModel});

  AmazingModel amazingModel;
  void Function()? onPressed;

  @override
  State<AmazingItemWidget> createState() => _AmazingItemWidgetState();
}

class _AmazingItemWidgetState extends State<AmazingItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: InkWell(
        onTap: widget.onPressed,
        child: Container(margin: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          // padding: const EdgeInsets.all(8),
          height: 350,
          width: 250,
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 110,
                      child: Image.network(
                        baseUrl + widget.amazingModel.img,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: FloatingActionButton.extended(
                        heroTag: "button",
                        onPressed: () {},
                        //TODO: Create "Add to cart" function
                        backgroundColor: Colors.orange.shade900,
                        foregroundColor: Colors.white,
                        isExtended: true,
                        shape: const CircleBorder(
                          eccentricity: 0,
                        ),
                        label: const Row(
                          children: [
                            Icon(Icons.add),
                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //   //margin: EdgeInsets.only(top: 50),
                    //   width: 50,
                    //   height: 50,
                    //   decoration: BoxDecoration(
                    //     color: Colors.orange.shade900,
                    //     borderRadius: BorderRadius.circular(100),
                    //   ),
                    //   child: Icon(Icons.add, color: Colors.white, size: 30),
                    // ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child:  Text(widget.amazingModel.name,
                          style: kHeaderTextStyle),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child:  Padding(padding:EdgeInsets.only(right: 10) ,
                        child: Text(
                          widget.amazingModel.info,
                          style: TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: SizedBox(
                        child: Wrap(
                          children: [
                            Row(
                              children: [
                                 Text( widget.amazingModel.cast, style: kHeaderTextStyle2),
                                const SizedBox(width: 6),
                                Image.asset(
                                  'assets/images/toman.png',
                                  scale: 5.0,
                                ),
                              ],
                            ),
                            const SizedBox(width: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 8,
                              ),
                              // alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "25 %",
                                style: kHeaderTextStyle3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child:  Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          widget.amazingModel.discount,
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
