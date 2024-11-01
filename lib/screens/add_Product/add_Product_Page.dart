import 'package:flutter/material.dart';
import '../../models/product_model_2.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  List<Product> _products = []; // لیست محصولات
  String _id = '';
  String _name = '';
  String _categoryId = '';
  double _price = 0.0;
  String _description = '';
  int _stockQuantity = 0;
  String _unit = '';
  String _brand = '';
  bool _isActive = true;
  double _weight = 0.0;
  String _dimensions = '';
  String _color = '';
  double _rating = 0.0;
  int _reviewCount = 0;
  double _discount = 0.0;
  DateTime? _offerStart;
  DateTime? _offerEnd;
  String _warranty = '';
  List<String> _tags = [];
  String _providerVendors = '';
  String _productUrl = '';
  String _imageUrl = ''; // متغیر جدید برای لینک عکس

  void _addProduct() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // اضافه کردن محصول جدید به لیست
      _products.add(Product(
        id: _id,
        name: _name,
        categoryId: _categoryId,
        price: _price,
        description: _description,
        stockQuantity: _stockQuantity,
        unit: _unit,
        brand: _brand,
        isActive: _isActive,
        weight: _weight,
        dimensions: _dimensions,
        color: _color,
        rating: _rating,
        reviewCount: _reviewCount,
        discount: _discount,
        offerStart: _offerStart,
        offerEnd: _offerEnd,
        warranty: _warranty,
        tags: _tags,
        providerVendors: _providerVendors,
        productUrl: _productUrl,
        imageUrl: _imageUrl, // لینک عکس
      ));
      // پاک کردن فرم برای اضافه کردن محصول بعدی
      _formKey.currentState!.reset();
      setState(() {
        _id = '';
        _name = '';
        _categoryId = '';
        _price = 0.0;
        _description = '';
        _stockQuantity = 0;
        _unit = '';
        _brand = '';
        _isActive = true;
        _weight = 0.0;
        _dimensions = '';
        _color = '';
        _rating = 0.0;
        _reviewCount = 0;
        _discount = 0.0;
        _offerStart = null;
        _offerEnd = null;
        _warranty = '';
        _tags = [];
        _providerVendors = '';
        _productUrl = '';
        _imageUrl = ''; // پاک کردن لینک عکس
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اضافه کردن محصول'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTextField('شناسه محصول (ID)', 'مثال: 123', (value) => _id = value!),
                _buildTextField('نام محصول', 'مثال: گوشی هوشمند', (value) => _name = value!),
                _buildTextField('شناسه دسته‌بندی (Category ID)', 'مثال: 456', (value) => _categoryId = value!),
                _buildDateField('تاریخ شروع پیشنهاد (Offer Start)', 'مثال: 2023-11-01', (value) => _offerStart = DateTime.parse(value!)),
                _buildDateField('تاریخ پایان پیشنهاد (Offer End)', 'مثال: 2023-12-01', (value) => _offerEnd = DateTime.parse(value!)),
                _buildTextField('قیمت محصول', 'مثال: 1500000', (value) => _price = double.parse(value!), keyboardType: TextInputType.number),
                _buildTextField('توضیحات محصول', 'مثال: این یک گوشی هوشمند است', (value) => _description = value!),
                _buildTextField('مقدار موجودی (Stock Quantity)', 'مثال: 50', (value) => _stockQuantity = int.parse(value!), keyboardType: TextInputType.number),
                _buildTextField('واحد (Unit)', 'مثال: عدد', (value) => _unit = value!),
                _buildTextField('برند (Brand)', 'مثال: سامسونگ', (value) => _brand = value!),
                SwitchListTile(
                  title: Text('فعال (Is Active)'),
                  value: _isActive,
                  onChanged: (bool value) {
                    setState(() {
                      _isActive = value;
                    });
                  },
                ),
                _buildTextField('وزن (Weight)', 'مثال: 200', (value) => _weight = double.parse(value!), keyboardType: TextInputType.number),
                _buildTextField('ابعاد (Dimensions)', 'مثال: 15x7x0.8', (value) => _dimensions = value!),
                _buildTextField('رنگ (Color)', 'مثال: سیاه', (value) => _color = value!),
                _buildTextField('رتبه‌بندی (Rating)', 'مثال: 4.5', (value) => _rating = double.parse(value!), keyboardType: TextInputType.number),
                _buildTextField('تعداد نظرات (Review Count)', 'مثال: 100', (value) => _reviewCount = int.parse(value!), keyboardType: TextInputType.number),
                _buildTextField('تخفیف (Discount)', 'مثال: 10', (value) => _discount = double.parse(value!), keyboardType: TextInputType.number),
                _buildTextField('گارانتی (Warranty)', 'مثال: 1 سال', (value) => _warranty = value!),
                _buildTextField('برچسب‌ها (Tags)', 'مثال: الکترونیک, گوشی', (value) => _tags = value!.split(',').map((tag) => tag.trim()).toList()),
                _buildTextField('تامین‌کنندگان (Provider Vendors)', 'مثال: تامین‌کننده A', (value) => _providerVendors = value!),
                _buildTextField('لینک عکس (Image URL)', 'مثال: http://example.com/image.jpg', (value) => _imageUrl = value!),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _addProduct,
                  child: Text('اضافه کردن محصول'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 20),
                if (_products.isNotEmpty) ...[
                  Text('محصولات اضافه شده:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _products.length,
                    itemBuilder: (context, index) {
                      final product = _products[index];
                      return _buildProductCard(product);
                    },
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, Function(String?) onSaved, {TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint, // اضافه کردن راهنما
      ),
      keyboardType: keyboardType,
      validator: (value) {
        if (value!.isEmpty) {
          return 'لطفاً ${label} را وارد کنید';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }

  Widget _buildDateField(String label, String hint, Function(String?) onSaved) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint, // اضافه کردن راهنما
      ),
      keyboardType: TextInputType.datetime,
      validator: (value) {
        if (value!.isEmpty) {
          return 'لطفاً ${label} را وارد کنید';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.imageUrl, height: 100, width: 100, fit: BoxFit.cover),
            SizedBox(height: 8),
            Text('شناسه: ${product.id}', style: TextStyle(fontSize: 16)),
            Text('نام: ${product.name}', style: TextStyle(fontSize: 16)),
            Text('دسته‌بندی: ${product.categoryId}', style: TextStyle(fontSize: 16)),
            Text('تاریخ شروع پیشنهاد: ${product.offerStart?.toLocal().toString().split(' ')[0]}', style: TextStyle(fontSize: 16)),
            Text('تاریخ پایان پیشنهاد: ${product.offerEnd?.toLocal().toString().split(' ')[0]}', style: TextStyle(fontSize: 16)),
            Text('قیمت: ${product.price.toString()} تومان', style: TextStyle(fontSize: 16)),
            Text('توضیحات: ${product.description}', style: TextStyle(fontSize: 16)),
            Text('موجودی: ${product.stockQuantity}', style: TextStyle(fontSize: 16)),
            Text('واحد: ${product.unit}', style: TextStyle(fontSize: 16)),
            Text('برند: ${product.brand}', style: TextStyle(fontSize: 16)),
            Text('فعال: ${product.isActive ? "بله" : "خیر"}', style: TextStyle(fontSize: 16)),
            Text('وزن: ${product.weight}', style: TextStyle(fontSize: 16)),
            Text('ابعاد: ${product.dimensions}', style: TextStyle(fontSize: 16)),
            Text('رنگ: ${product.color}', style: TextStyle(fontSize: 16)),
            Text('رتبه‌بندی: ${product.rating}', style: TextStyle(fontSize: 16)),
            Text('تعداد نظرات: ${product.reviewCount}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
