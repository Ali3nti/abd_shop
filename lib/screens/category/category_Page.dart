import 'package:abd_shop/constant/constants.dart';
import 'package:abd_shop/models/category_model.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({
    super.key,
    required this.category,
    required this.products,
  });

  final CategoryModel category;
  final List<Product> products;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: widget.products
              .map(
                (e) => Container(
                  padding: const EdgeInsets.only(top: 10),
                  color: Colors.grey.shade50,
                  width: double.infinity,
                  height: 200,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        alignment: Alignment.center,
                        child: Image.network(
                          baseUrl + e.image,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      const SizedBox(width: 50),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                e.brand,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 3),
                              Text(e.description),
                              const SizedBox(height: 3),
                              Text(e.color),
                              const SizedBox(height: 3),
                              Row(
                                children: [
                                  Text(e.isActive.toString()),
                                  const SizedBox(width: 160),
                                  Text(
                                    e.rating.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Icon(Icons.star,
                                      color: Colors.yellow, size: 15),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Text(
                                            e.discount.toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          const Text(
                                            "%",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 120),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            e.price.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(width: 5),
                                          Image.asset("assets/images/toman.png",
                                              width: 20, height: 20),
                                        ],
                                      ),
                                      Text(
                                        e.price.toString(),
                                        style: const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
