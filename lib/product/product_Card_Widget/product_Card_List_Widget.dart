import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/models/response_model.dart';
import 'package:abd_shop/services/api_helper.dart';
import 'package:abd_shop/product/product_Card_Widget/product_card_widget.dart';
import 'package:flutter/material.dart';

class ProductCardListWidget extends StatefulWidget {
  const ProductCardListWidget({super.key});

  @override
  State<ProductCardListWidget> createState() => _ProductCardListWidgetState();
}

class _ProductCardListWidgetState extends State<ProductCardListWidget> {
  List<ProductCard> productWidgetList = [];

  initMarkets() async {
    await getProducts().then((value) {
      DataResponse dataResponse = value;
      if (dataResponse.status == 1) {
        for (var item in dataResponse.data) {
          Product productModel = Product.fromJson(item);
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
    return SingleChildScrollView(scrollDirection: Axis.horizontal,
      child: Row(
        children: productWidgetList,
      ),
    );
  }
}
