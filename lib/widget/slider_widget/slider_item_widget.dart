import 'package:abd_shop/models/slider_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class SliderItemWidget extends StatefulWidget {
  SliderItemWidget({super.key,required this.sliderModel});

  SliderModel sliderModel;

  @override
  State<SliderItemWidget> createState() => _SliderItemWidgetState();
}

class _SliderItemWidgetState extends State<SliderItemWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Image.network(
            widget.sliderModel.image,
            width: 100,
            height: 100,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text(
              widget.sliderModel.name,
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.only(right: 65),
            child: Row(
              children: [
                Text(
                  widget.sliderModel.price,
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 6,
                ),
                Image.asset(
                  "assets/images/toman.png",
                  width: 20,
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
