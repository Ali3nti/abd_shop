import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchPageHome extends StatefulWidget {
  final List<Product> products;

  SearchPageHome({required this.products});

  @override
  _SearchPageHomeState createState() => _SearchPageHomeState();
}

class _SearchPageHomeState extends State<SearchPageHome> {
  List<Product> filteredProducts = [];
  String query = '';
  int? selectedCategoryId;

  @override
  void initState() {
    super.initState();
    filteredProducts = widget.products;
  }

  void updateSearchResults(String query) {
    setState(() {
      this.query = query;
      filterProducts();
    });
  }

  void filterProducts() {
    filteredProducts = widget.products.where((product) {
      final matchesQuery =
          product.name.toLowerCase().contains(query.toLowerCase());
      final matchesCategory = selectedCategoryId == null ||
          product.categoryId == selectedCategoryId;
      return matchesQuery && matchesCategory;
    }).toList();
  }

  final formatter = NumberFormat('#,###');

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'id': null, 'name': ' همه محصولات'},
      {'id': 1, 'name': 'کالاهای اساسی'},
      {'id': 2, 'name': 'لبنیات'},
      {'id': 3, 'name': 'مواد پروتئینی'},
    ];

    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(foregroundColor: Colors.white,
        title: Text('جستجو محصولات',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only( top: 15,right: 10,left: 10),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Image.asset(
                    'assets/images/search-normal.png',
                    color: Colors.grey.shade700,
                  ),
                ),
                hintText: "جستجو در کالاها و فروشگاه ها",
                hintStyle: kMainTextStyle,
              ),
              style: kMainTextStyle,
            )
            ,
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Row(
              children: [
                Image.asset("assets/images/fire.jpg",height:50,),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "جستجوهای محبوب",
                  style: kMainTextStyle,
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kWhiteColor,
                  foregroundColor: Colors.black54,
                  side: BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Text("شیر",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(
                width: 5,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kWhiteColor,
                  foregroundColor: Colors.black54,
                  side: BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Text("تخم مرغ",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(
                width: 5,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kWhiteColor,
                  foregroundColor: Colors.black54,
                  side: BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Text("روغن",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
