

import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/models/response_model.dart';
import 'package:abd_shop/services/api_helper.dart';
import 'package:abd_shop/widget/product_card_widget.dart';
import 'package:flutter/material.dart';

class productCardListWidget extends StatefulWidget {
  const productCardListWidget({super.key});

  @override
  State<productCardListWidget> createState() => _productCardListWidgetState();
}

// productPageDetail(BuildContext context) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => ProductPageDetail(),
//     ),
//   );
// }

class _productCardListWidgetState extends State<productCardListWidget> {
  List<ProductCard> productWidgetList = [];

  // List<Market> marketList = [];
  initMarkets() async {
    await getRequest(apiName: "cat_products").then((value) {
      DataResponse dataResponse = value;

      if (dataResponse.status == 1) {
        for (var item in dataResponse.data) {
          Product productModel = Product.fromJson(item);
          // marketList.add(market);
          productWidgetList.add(
            ProductCard(
              productModel: productModel,
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
      children: productWidgetList,
    );
  }
}

