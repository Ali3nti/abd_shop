import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/models/response_model.dart';
import 'package:abd_shop/services/api_helper.dart';
import 'package:abd_shop/widget/my_app_bar.dart';
import 'package:abd_shop/widget/provider/add_to_cart_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class AllPage extends StatefulWidget {
  const AllPage({
    super.key,
  });

  @override
  State<AllPage> createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  List<Product> productList = [];

  initProductsList() async {
    await getProducts().then((value) {
      DataResponse response = value;
      if (response.status == 1) {
        List<dynamic> list = response.data;
        for (var item in list) {
          Product product = Product.fromJson(item);
          productList.add(product);
        }
        setState(() {});
      } else {
        //TODO: if don't have a product in response show error widget
      }
    }).catchError(
      (error) =>
          throw Exception("Error on all_page when use getProduct(): $error"),
    );
  }

  @override
  void initState() {
    super.initState();
    initProductsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: double.infinity,
              height: 50,
              // color: Colors.red,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  const Icon(
                    Icons.line_weight,
                    color: Colors.black,
                    size: 18,
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade200,
                      ),
                      child: const Center(
                        child: Text("همه محصولات"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            (productList.isNotEmpty)
                ? Column(
                    children: [
                      Container(
                        //color: Colors.yellow,
                        padding: const EdgeInsets.only(top: 10, right: 20),
                        margin: const EdgeInsets.only(top: 20),
                        width: double.infinity,
                        height: 50,
                        child: Text(
                          "${productList.length} محصول",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      // GridView.count(
                      //   crossAxisCount: 2,
                      //   shrinkWrap: true,
                      //   physics: NeverScrollableScrollPhysics(),
                      GridView.extent(
                        physics: const NeverScrollableScrollPhysics(),
                        maxCrossAxisExtent: 300,
                        shrinkWrap: true,
                        children: productList
                            .map((item) => GridProductWidget(product: item))
                            .toList(),
                      ),
                    ],
                  )
                : _shimmerList(),
          ],
        ),
      ),
    );
  }

  Widget _shimmerList() {
    try {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 3),
              color: Colors.white,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        height: 80,
                        width: 100,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 20,
                      width: 50,
                      color: Colors.grey.shade200,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 80,
                          color: Colors.grey.shade200,
                        ),
                        const SizedBox(width: 8),
                        Container(
                          height: 30,
                          width: 20,
                          color: Colors.grey.shade200,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print("Exception - wallet_stations_page.dart - _shimmerList():$e");
      }
      return const SizedBox();
    }
  }
}

class GridProductWidget extends StatefulWidget {
  const GridProductWidget({super.key, required this.product});
  final Product product;

  @override
  State<GridProductWidget> createState() => _GridProductWidgetState();
}

class _GridProductWidgetState extends State<GridProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 3, left: 3),
      width: 303,
      height: 400,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: Image.network(
              baseUrl + widget.product.image,
              width: 80,
              height: 90,
            ),
          ),
          AddToCartWidget(
            product: Product(),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.product.price.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              Image.asset(
                width: 15,
                'assets/images/toman.png',
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.product.name,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 2),
              const Text(
                "_",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 2),
              Text(
                widget.product.discount.toString(),
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
