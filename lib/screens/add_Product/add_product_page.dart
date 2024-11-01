import 'package:abd_shop/models/product_model_2.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final List<Product> _products = []; // لیست محصولات
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // فرم ورودی اطلاعات محصول
                // TextFormField(
                //   decoration: InputDecoration(labelText: 'شناسه محصول (ID)'),
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return 'لطفاً شناسه محصول را وارد کنید';
                //     }
                //     return null;
                //   },
                //   onSaved: (value) {
                //     _id = value!;
                //   },
                // ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'نام محصول'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'لطفاً نام محصول را وارد کنید';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'شناسه دسته‌بندی (Category ID)'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'لطفاً شناسه دسته‌بندی را وارد کنید';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _categoryId = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'قیمت محصول'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'لطفاً قیمت محصول را وارد کنید';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _price = double.parse(value!);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'توضیحات محصول'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'لطفاً توضیحات محصول را وارد کنید';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _description = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'مقدار موجودی (Stock Quantity)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'لطفاً مقدار موجودی را وارد کنید';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _stockQuantity = int.parse(value!);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'واحد (Unit)'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'لطفاً واحد را وارد کنید';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _unit = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'برند (Brand)'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'لطفاً برند را وارد کنید';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _brand = value!;
                  },
                ),
                SwitchListTile(
                  title: Text('فعال (Is Active)'),
                  value: _isActive,
                  onChanged: (bool value) {
                    setState(() {
                      _isActive = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'وزن (Weight)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'لطفاً وزن را وارد کنید';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _weight = double.parse(value!);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'ابعاد (Dimensions)'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'لطفاً ابعاد را وارد کنید';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _dimensions = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'رنگ (Color)'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'لطفاً رنگ را وارد کنید';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _color = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'رتبه‌بندی (Rating)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'لطفاً رتبه‌بندی را وارد کنید';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _rating = double.parse(value!);
                  },
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'تعداد نظرات (Review Count)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'لطفاً تعداد نظرات را وارد کنید';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _reviewCount = int.parse(value!);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'تخفیف (Discount)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'لطفاً تخفیف را وارد کنید';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _discount = double.parse(value!);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'گارانتی (Warranty)'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'لطفاً گارانتی را وارد کنید';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _warranty = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'برچسب‌ها (Tags)'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'لطفاً برچسب‌ها را وارد کنید';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _tags = value!.split(',').map((tag) => tag.trim()).toList();
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'تامین‌کنندگان (Provider Vendors)'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'لطفاً تامین‌کنندگان را وارد کنید';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _providerVendors = value!;
                  },
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'لینک عکس (Image URL)'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'لطفاً لینک عکس را وارد کنید';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _imageUrl = value!;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _addProduct,
                  child: Text('اضافه کردن محصول'),
                ),
                SizedBox(height: 20),
                // نمایش لیست محصولات
                if (_products.isNotEmpty) ...[
                  Text('محصولات اضافه شده:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _products.length,
                    itemBuilder: (context, index) {
                      final product = _products[index];
                      return Card(
                        elevation: 5,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(product.imageUrl,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover), // نمایش تصویر
                              Text('شناسه: ${product.id}',
                                  style: TextStyle(fontSize: 16)),
                              Text('نام: ${product.name}',
                                  style: TextStyle(fontSize: 16)),
                              Text('دسته‌بندی: ${product.categoryId}',
                                  style: TextStyle(fontSize: 16)),
                              Text(
                                  'تاریخ شروع پیشنهاد: ${product.offerStart?.toLocal().toString().split(' ')[0]}',
                                  style: TextStyle(fontSize: 16)),
                              Text(
                                  'تاریخ پایان پیشنهاد: ${product.offerEnd?.toLocal().toString().split(' ')[0]}',
                                  style: TextStyle(fontSize: 16)),
                              Text('قیمت: ${product.price.toString()} تومان',
                                  style: TextStyle(fontSize: 16)),
                              Text('توضیحات: ${product.description}',
                                  style: TextStyle(fontSize: 16)),
                              Text('موجودی: ${product.stockQuantity}',
                                  style: TextStyle(fontSize: 16)),
                              Text('واحد: ${product.unit}',
                                  style: TextStyle(fontSize: 16)),
                              Text('برند: ${product.brand}',
                                  style: TextStyle(fontSize: 16)),
                              Text('فعال: ${product.isActive ? "بله" : "خیر"}',
                                  style: TextStyle(fontSize: 16)),
                              Text('وزن: ${product.weight}',
                                  style: TextStyle(fontSize: 16)),
                              Text('ابعاد: ${product.dimensions}',
                                  style: TextStyle(fontSize: 16)),
                              Text('رنگ: ${product.color}',
                                  style: TextStyle(fontSize: 16)),
                              Text('رتبه‌بندی: ${product.rating}',
                                  style: TextStyle(fontSize: 16)),
                              Text('تعداد نظرات: ${product.reviewCount}',
                                  style: TextStyle(fontSize: 16)),
                              Text('تخفیف: ${product.discount}%',
                                  style: TextStyle(fontSize: 16)),
                              if (product.offerStart != null)
                                Text(
                                    'تاریخ شروع پیشنهاد: ${product.offerStart!.toLocal().toString().split(' ')[0]}',
                                    style: TextStyle(fontSize: 16)),
                              if (product.offerEnd != null)
                                Text(
                                    'تاریخ پایان پیشنهاد: ${product.offerEnd!.toLocal().toString().split(' ')[0]}',
                                    style: TextStyle(fontSize: 16)),
                              Text('گارانتی: ${product.warranty}',
                                  style: TextStyle(fontSize: 16)),
                              Text('برچسب‌ها: ${product.tags.join(', ')}',
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      );
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
}
