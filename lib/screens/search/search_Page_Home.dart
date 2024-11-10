import 'package:abd_shop/constant/constants.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:flutter/material.dart';

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
      final matchesQuery = product.name.toLowerCase().contains(query.toLowerCase());
      final matchesCategory = selectedCategoryId == null || product.categoryId == selectedCategoryId;
      return matchesQuery && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'id': null, 'name': 'همه'}, // گزینه برای نمایش همه محصولات
      {'id': 1, 'name': 'کالاهای اساسی'},
      {'id': 2, 'name': 'لبنیات'},
      {'id': 3, 'name': 'مواد پروتئینی'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('جستجو محصولات'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: updateSearchResults,
              decoration: InputDecoration(
                hintText: 'نام محصول را جستجو کنید...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.teal),
                ),
                prefixIcon: Icon(Icons.search, color: Colors.teal),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButton<int?>(
              hint: Text('دسته‌بندی را انتخاب کنید'),
              value: selectedCategoryId,
              isExpanded: true,
              items: categories.map<DropdownMenuItem<int?>>((Map<String, dynamic> category) {
                return DropdownMenuItem<int?>(
                  value: category['id'],
                  child: Text(category['name']),
                );
              }).toList(),
              onChanged: (int? newValue) {
                setState(() {
                  selectedCategoryId = newValue;
                  filterProducts();
                });
              },
            ),
          ),
          Expanded(
            child: filteredProducts.isEmpty
                ? Center(
              child: Text(
                'محصولی یافت نشد',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
                : ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Card(
                  color: Colors.white,
                  shadowColor: Colors.deepOrange,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    leading: Image.network(
                      baseUrl + product.image,
                      height: 80,
                      width: 100,
                    ),
                    title: Text(
                      product.name,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'قیمت: ${product.price} تومان',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    trailing: Icon(Icons.arrow_forward, color: Colors.teal),
                    onTap: () {
                      // Navigate to product details
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
