import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/models/response_model.dart';
import 'package:abd_shop/product/best_product_widget.dart';
import 'package:abd_shop/services/api_helper.dart';
import 'package:flutter/material.dart';

class BestProductListWidget extends StatefulWidget {
  const BestProductListWidget({super.key});

  @override
  State<BestProductListWidget> createState() => _BestProductListWidgetState();
}

class _BestProductListWidgetState extends State<BestProductListWidget> {
  List<BestProducts> bestProductsWidgetList = [];

  Future<void> initMarkets() async {
    try {
      DataResponse dataResponse = await getProducts();
      if (dataResponse.status == 1) {
        setState(() {
          bestProductsWidgetList = dataResponse.data.map<BestProducts>((item) {
            Product products = Product.fromJson(item);
            return BestProducts(product: products);
          }).toList();
        });
      } else {
        print('run another status');
      }
    } catch (onError) {
      throw Exception(
        'Exception error: markets_list_widget.dart in getDataFromServer: $onError',
      );
    }
  }

  @override
  void initState() {
    super.initState();
    initMarkets();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.5,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        itemCount: bestProductsWidgetList.length,
        itemBuilder: (context, index) {
          return bestProductsWidgetList[index];
        },
      ),
    );
  }
}
