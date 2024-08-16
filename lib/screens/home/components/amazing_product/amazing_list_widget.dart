import 'package:abd_shop/models/amazing_model.dart';
import 'package:abd_shop/models/category_model.dart';
import 'package:abd_shop/models/response_model.dart';
import 'package:abd_shop/screens/home/components/category_itemt_widget.dart';
import 'package:abd_shop/services/api_helper.dart';
import 'package:abd_shop/widget/amazing_item_widget.dart';
import 'package:flutter/material.dart';

class AmazingListWidget extends StatefulWidget {
  const AmazingListWidget({super.key});

  @override
  State<AmazingListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<AmazingListWidget> {
  List<AmazingItemWidget>  amazingWidgetList = [];

  // List<Market> marketList = [];
  initMarkets() async {
    await getDataFromServer(apiName: "getamazing").then((value) {
      DataResponse dataResponse = value;

      if (dataResponse.status == 1) {
        for (var item in dataResponse.data) {
          AmazingModel amazingModel = AmazingModel.fromJSON(item);
          // marketList.add(market);
          amazingWidgetList.add(
            AmazingItemWidget(
             amazingModel: amazingModel,
            ),
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
      children: amazingWidgetList,
    );
  }
}
