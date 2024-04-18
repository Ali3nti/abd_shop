import 'package:abd_shop/models/response_model.dart';
import 'package:abd_shop/screens/home/components/market_item_widget.dart';
import 'package:abd_shop/models/market_model.dart';
import 'package:abd_shop/services/api_helper.dart';
import 'package:flutter/material.dart';

class MarketListWidget extends StatefulWidget {
  const MarketListWidget({super.key});

  @override
  State<MarketListWidget> createState() => _MarketListWidgetState();
}

class _MarketListWidgetState extends State<MarketListWidget> {
  List<MarketItemWidget> marketsWidgetList = [];
  initMarkets() async {
    await getMarkets().then((value) {
      DataResponse dataResponse = value;

      if (dataResponse.status == 1) {
        for (var item in dataResponse.data) {
          Market market = Market.fromJSON(item);
          marketsWidgetList.add(
            MarketItemWidget(
              market: market,
            ),
          );
        }
      } else {
        print('run another status');
      }
    }).catchError((onError) {
      print(onError);
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
    return Column(
      children: marketsWidgetList,
    );
  }
}
