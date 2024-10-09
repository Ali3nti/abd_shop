import 'package:abd_shop/models/amazing_model.dart';
import 'package:abd_shop/models/category_model.dart';
import 'package:abd_shop/models/discount_model.dart';
import 'package:abd_shop/models/response_model.dart';
import 'package:abd_shop/screens/home/components/category_item_widget.dart';
import 'package:abd_shop/services/api_helper.dart';
import 'package:abd_shop/widget/discount_widget/discount_item_widget.dart';
import 'package:flutter/material.dart';

class DiscountListWidget extends StatefulWidget {
  const DiscountListWidget({super.key});

  @override
  State<DiscountListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<DiscountListWidget> {
  List<DiscountItemWidget> discountWidgetList = [];

  // List<Market> marketList = [];
  initMarkets() async {
    await getDataFromServer(apiName: "getdiscounted").then((value) {
      DataResponse dataResponse = value;

      if (dataResponse.status == 1) {
        for (var item in dataResponse.data) {
          DiscountModel discountModel = DiscountModel.fromJSON(item);
          // marketList.add(market);
          discountWidgetList.add(
            DiscountItemWidget(
              discountModel: discountModel,
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
      children: discountWidgetList,
    );
  }
}
