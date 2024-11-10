import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/models/response_model.dart';
import 'package:abd_shop/services/api_helper.dart';
import 'package:abd_shop/product/product_Card_Widget/product_card_widget.dart';
import 'package:flutter/material.dart';

class ProductCardListWidget extends StatefulWidget {
  const ProductCardListWidget({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  final int categoryId;
  final String categoryName;

  @override
  State<ProductCardListWidget> createState() => _ProductCardListWidgetState();
}

class _ProductCardListWidgetState extends State<ProductCardListWidget> {
  List<ProductCard> productWidgetList = [];

  initMarkets() async {
    try {
      DataResponse dataResponse = await getProductsOfCategory(widget.categoryId);
      if (dataResponse.status == 1) {
        setState(() {
          productWidgetList = dataResponse.data.map<ProductCard>((item) {
            Product productModel = Product.fromJson(item);
            return ProductCard(productModel: productModel);
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(height: 60,width: 69,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepOrange, Colors.orange], // Gradient background
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(4, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(10.0),
          child: Text(
            widget.categoryName,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 5.0,
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productWidgetList,
          ),
        ),
      ],
    );
  }
}
