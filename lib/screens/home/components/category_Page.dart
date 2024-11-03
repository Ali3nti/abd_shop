import 'package:abd_shop/models/category_model.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../services/api_helper.dart';

class CategoryPage extends StatefulWidget {
  final CategoryModel category;

  const CategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = getProducts(widget.category.id); // دریافت محصولات بر اساس ID کتگوری
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('محصولات ${widget.category.name}'), // نمایش نام کتگوری
      ),
      body: FutureBuilder<List<Product>>(
        future: futureProducts,
        builder: (context, snapshot) {
          // در حال بارگذاری
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // در صورت وجود خطا
          if (snapshot.hasError) {
            return Center(child: Text('خطا: ${snapshot.error}'));
          }

          // در صورتی که داده‌ای وجود نداشته باشد
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('محصولی یافت نشد.'));
          }

          // نمایش لیست محصولات
          final products = snapshot.data!;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text('قیمت: ${product.price} تومان\nوزن: ${product.weight} گرم\nرنگ: ${product.color}'),
                leading: Image.network(product.logo),
                isThreeLine: true,
              );
            },
          );
        },
      ),
    );
  }
}
