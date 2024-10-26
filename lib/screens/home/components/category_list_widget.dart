import 'package:abd_shop/models/category_model.dart';
import 'package:abd_shop/models/response_model.dart';
import 'package:abd_shop/screens/home/components/category_item_widget.dart';
import 'package:abd_shop/services/api_helper.dart';
import 'package:flutter/material.dart';

class CategoryListWidget extends StatefulWidget {
  const CategoryListWidget({super.key});

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  List<CategoryItemWidget> categoryWidgetList = [];

  // List<Market> marketList = [];
  initMarkets() async {
    await getDataFromServer(apiName: "getcategory").then((value) {
      DataResponse dataResponse = value;

      if (dataResponse.status == 1) {
        for (var item in dataResponse.data) {
          CategoryModel CategoryItem =
              CategoryModel.fromJSON(item);
          // marketList.add(market);
          categoryWidgetList.add(
            CategoryItemWidget(
              categoryModel: CategoryItem,
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
      children: categoryWidgetList,
    );
  }
}
