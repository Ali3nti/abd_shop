import 'package:abd_shop/models/amazing_model.dart';
import 'package:abd_shop/models/category_model.dart';
import 'package:abd_shop/models/jetmart_amazing_model.dart';
import 'package:abd_shop/models/response_model.dart';
import 'package:abd_shop/screens/home/components/category_item_widget.dart';
import 'package:abd_shop/services/api_helper.dart';
import 'package:abd_shop/widget/amazing_item_widget.dart';
import 'package:abd_shop/widget/jet_mart_store/jetmart_item_widget.dart';
import 'package:flutter/material.dart';

class JetmartListWidget extends StatefulWidget {
  const JetmartListWidget({super.key});

  @override
  State<JetmartListWidget> createState() => _JetmartListWidgetState();
}

class _JetmartListWidgetState extends State<JetmartListWidget> {
  List<JetmartItemWidget>  jetmartWidgetList = [];

  // List<Market> marketList = [];
  initMarkets() async {
    await getDataFromServer(apiName: "getjetmart").then((value) {
      DataResponse dataResponse = value;

      if (dataResponse.status == 1) {
        for (var item in dataResponse.data) {
          JetMartAmazingModel jetmartAmazingModel = JetMartAmazingModel.fromJSON(item);
          // marketList.add(market);
          jetmartWidgetList.add(
            JetmartItemWidget(
              jetmartAmazingModel: jetmartAmazingModel,
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
      children: jetmartWidgetList,
    );
  }
}
