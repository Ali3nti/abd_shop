import 'package:abd_shop/models/amazing_model.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/models/response_model.dart';
import 'package:abd_shop/product/product_information_page.dart';
import 'package:abd_shop/services/api_helper.dart';
import 'package:abd_shop/screens/home/components/amazing_product/amazing_item_widget.dart';
import 'package:flutter/material.dart';

class AmazingListWidget extends StatefulWidget {
  const AmazingListWidget({super.key});

  @override
  State<AmazingListWidget> createState() => _CategoryListWidgetState();
}

productPageDetail(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>ProductInformation(product: Product(),),
    ),
  );
}

class _CategoryListWidgetState extends State<AmazingListWidget> {
  List<AmazingItemWidget> amazingWidgetList = [];

  // List<Market> marketList = [];
  initMarkets() async {
    await getProducts().then((value) {
      DataResponse dataResponse = value;

      if (dataResponse.status == 1) {
        for (var item in dataResponse.data) {
          Product amazingModel = Product.fromJson(item);
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
