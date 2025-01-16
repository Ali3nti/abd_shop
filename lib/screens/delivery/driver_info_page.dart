import 'package:abd_shop/constants.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/screens/delivery/delivery_page.dart';
import 'package:flutter/material.dart';
import 'package:abd_shop/models/order_model.dart';

class DriverInfoPage extends StatefulWidget {
  const DriverInfoPage({super.key});

  @override
  State<DriverInfoPage> createState() => _DriverInfoPageState();
}

class _DriverInfoPageState extends State<DriverInfoPage> {
  List<Order> orders = [];

  @override
  void initState() {
    super.initState();
    for (int index = 0; index < 5; index++) {
      Order order = Order();
      order.id = index + 1;
      order.userId = 1;
      order.trackingId = 'ABD-0000$index';
      order.orderDate = DateTime.now().subtract(Duration(days: index));
      order.products = List.generate(3, (productIndex) {
        Product product = Product();
        product.id = productIndex + 1;
        product.name = 'محصول ${index + 1}-${productIndex + 1}';
        product.isInStock = productIndex != 1;
        product.isShipped = index % 2 == 0;
        return product;
      });
      orders.add(order);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, right: 30),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DriverProfilePage(),
                        ),
                      );
                    },
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/212.png",
                        width: 62,
                        height: 62,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " سلام امیر ",
                        style: kHeaderTextStyle,
                      ),
                      Text(
                        "بریم سراغ یه روز کاری جدید",
                        style: TextStyle(
                          color: kGreenColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 100),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationsPage(),
                        ),
                      );
                    },
                    child: Image.asset(
                      "assets/images/bing.png",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            TabBar(
              indicatorColor: Colors.teal,
              labelColor: Colors.teal,
              tabs: [
                Tab(
                  text: 'تاریخچه سفارشات',
                ),
                Tab(
                  text: 'سفارش جدید',
                ),
                Tab(
                  text: 'کیف پول من',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        Order order = orders[index];
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {
                              // Handle order tap
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "آیدی سفارش: ${order.id}",
                                    ),
                                    Text(
                                      "${order.orderDate.toLocal()}"
                                          .split(' ')[0],
                                      style: TextStyle(
                                        color: kRedColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${order.products.length} آیتم",
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  DeliveryDriverPage(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "موجودی کیف پول:",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "200,000 تومان",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "آخرین بروزرسانی: 25 آذر 1403",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "تاریخچه تراکنش‌ها:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: ListView(
                          children: [
                            Card(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: ListTile(
                                title: Text(
                                  "واریز به کیف پول",
                                ),
                                subtitle: Text(
                                  "24 آذر 1403",
                                ),
                                trailing: Text(
                                  "+50,000 تومان",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: ListTile(
                                title: Text(
                                  "برداشت از کیف پول",
                                ),
                                subtitle: Text(
                                  "23 آذر 1403",
                                ),
                                trailing: Text(
                                  "-30,000 تومان",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: ListTile(
                                title: Text(
                                  "واریز به کیف پول",
                                ),
                                subtitle: Text(
                                  "22 آذر 1403",
                                ),
                                trailing: Text(
                                  "+100,000 تومان",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'اعلان‌های راننده',
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(
              Icons.shopping_cart,
            ),
            title: Text(
              'سفارش جدید',
            ),
            subtitle: Text(
              'یک سفارش جدید در انتظار تحویل است.',
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.location_on,
            ),
            title: Text(
              'مسیر جدید',
            ),
            subtitle: Text(
              'مسیر جدیدی برای تحویل سفارش در نظر گرفته شده است.',
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.timer,
            ),
            title: Text(
              'تاخیر در تحویل',
            ),
            subtitle: Text(
              'به دلیل ترافیک، تحویل سفارش با تاخیر همراه خواهد بود.',
            ),
          ),
          ListTile(
            leading: Icon(Icons.check_circle_outline),
            title: Text(
              'سفارش تحویل داده شد',
            ),
            subtitle: Text(
              'سفارش با موفقیت به مشتری تحویل داده شد.',
            ),
          ),
        ],
      ),
    );
  }
}

class DriverProfilePage extends StatefulWidget {
  @override
  _DriverProfilePageState createState() => _DriverProfilePageState();
}

class _DriverProfilePageState extends State<DriverProfilePage> {
  final _nameController = TextEditingController(text: 'علی احمدی');
  final _phoneController = TextEditingController(text: '0912567893');
  final _emailController =
      TextEditingController(text: 'ali.ahmadi@example.com');
  final _licenseController = TextEditingController(text: 'XYZ456');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('پروفایل راننده'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextField(_nameController, 'نام', Icons.person),
              SizedBox(height: 16.0),
              _buildTextField(
                _phoneController,
                'شماره تلفن', Icons.phone),
              SizedBox(height: 16.0),
              _buildTextField(_emailController, 'ایمیل', Icons.email),
              SizedBox(height: 16.0),
              _buildTextField(
                  _licenseController, 'شماره گواهینامه', Icons.card_membership),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  // منطق ذخیره تغییرات
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text(
                  'ذخیره تغییرات',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.teal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.teal),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.teal),
        ),
      ),
    );
  }
}
