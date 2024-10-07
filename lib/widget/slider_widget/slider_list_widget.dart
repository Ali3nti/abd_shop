import 'package:abd_shop/models/amazing_model.dart';
import 'package:abd_shop/models/category_model.dart';
import 'package:abd_shop/models/discount_model.dart';
import 'package:abd_shop/models/response_model.dart';
import 'package:abd_shop/models/slider_model.dart';
import 'package:abd_shop/screens/home/components/category_itemt_widget.dart';
import 'package:abd_shop/services/api_helper.dart';
import 'package:abd_shop/widget/discount_widget/discount_item_widget.dart';
import 'package:flutter/material.dart';

import 'slider_item_widget.dart';

class SliderListWidget extends StatefulWidget {
  const SliderListWidget({super.key});

  @override
  State<SliderListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<SliderListWidget> {
  List<SliderItemWidget> sliderWidgetList = [];

  // List<Market> marketList = [];
  initMarkets() async {
    await getDataFromServer(apiName: "getproduct").then((value) {
      DataResponse dataResponse = value;

      if (dataResponse.status == 1) {
        for (var item in dataResponse.data) {
          SliderModel sliderModel = SliderModel.fromJSON(item);
          // marketList.add(market);
          sliderWidgetList.add(
            SliderItemWidget(
              sliderModel: sliderModel,
            ) ,
          );
        }
      } else {
        print('run another status');
      }
    }).catchError((onError) {
      throw Exception(
          'Exception error: markets_list_widget.dart in getDataFromServer: $onError');
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initMarkets();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: sliderWidgetList,
    );
  }
}
