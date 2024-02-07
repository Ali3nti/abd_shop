import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/market_model.dart';
import 'package:flutter/material.dart';

class MarketItemWidget extends StatefulWidget {
  const MarketItemWidget({super.key, required this.market});
  final Market market;

  @override
  State<MarketItemWidget> createState() => _MarketItemWidgetState();
}

class _MarketItemWidgetState extends State<MarketItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 150,
      //color: Colors.grey,
      child: Row(
        children: [
          CircleAvatar(
            //backgroundColor: Colors.green.shade300,
            radius: 40,
            child: Image.network(baseUrl + widget.market.img),
          ),
          Expanded(
            child: Row(
              children: [
                const SizedBox(width: 6),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.market.name + " | " + widget.market.address,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            //margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            width: 60,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Text(
                              "50%",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        widget.market.category,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          const SizedBox(width: 7),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Text(
                              widget.market.rate.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 7),
                          const Icon(Icons.directions_bike_rounded),
                          const SizedBox(width: 7),
                          const Text(
                            "8.500  تومان",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "ارسال رایگان برای خرید بالای 20 تومان",
                        style: TextStyle(
                          color: Colors.orangeAccent,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // margin: EdgeInsets.only(left: 50),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "45",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "دقیقه",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
