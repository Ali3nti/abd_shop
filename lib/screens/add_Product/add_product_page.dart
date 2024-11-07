import 'package:abd_shop/models/response_model.dart';
import 'package:abd_shop/widget/camera/images_uploader_container.dart';
import 'package:flutter/material.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/services/api_helper.dart';
import 'package:abd_shop/widget/my_snack_bar.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  Product newProduct = Product();
  List<dynamic> imagesList = [];

  void _addProduct() async {
    print("تابع _addProduct فراخوانی شد");

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        print("در حال ارسال اطلاعات محصول...");
        DataResponse response = await sendNewProduct(product: newProduct, images: imagesList);

        print("پاسخ سرور: ${response.status}");
        if (response.status == 1) {
          print("محصول با موفقیت اضافه شد.");
        } else {
          print("خطا در اضافه کردن محصول: ${response.message}");
        }
      } catch (e) {
        print("خطا در ارسال محصول: $e");
      }
    } else {
      print("اعتبارسنجی ناموفق بود.");
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
                TextFormField(
                  decoration: InputDecoration(labelText: 'نام محصول'),
                  initialValue: newProduct.name,
                  onSaved: (value) => newProduct.name = value ?? '',
                  validator: (value) => value!.isEmpty ? 'لطفا نام محصول را وارد کنید' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'شناسه دسته بندی(Category ID)'),
                  onSaved: (value) => newProduct.categoryId = int.tryParse(value ?? '') ?? 0,
                  validator: (value) => value!.isEmpty ? 'لطفا شناسه دسته بندی را وارد کنید' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'قیمت'),
                  onSaved: (value) => newProduct.price,
                  validator: (value) => value!.isEmpty ? 'لطفا قیمت را وارد کنید' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'توضیحات محصول'),
                  onSaved: (value) => newProduct.description = value ?? '',
                  validator: (value) => value!.isEmpty ? 'لطفا توضیحات محصول را وارد کنید' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'مقدار موجودی'),
                  onSaved: (value) => newProduct.stockQuantity = int.tryParse(value ?? '') ?? 0,
                  validator: (value) => value!.isEmpty ? 'لطفا مقدار موجودی محصول را وارد کنید' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'واحد(unit)'),
                  onSaved: (value) => newProduct.unit = value ?? '',
                  validator: (value) => value!.isEmpty ? 'لطفا واحد محصول را وارد کنید' : null,
                ),TextFormField(
                  decoration: InputDecoration(labelText: 'فعال بودن محصول(بله/خیر)'),
                  onSaved: (value) =>
                  newProduct.isActive,
                  validator: (value) =>
                  value!.isEmpty ? 'لطفا فعال بودن یا نبودن محصول را وارد کنید' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'وزن'),
                  onSaved: (value) => newProduct.weight = double.tryParse(value ?? '') ?? 0.0,
                  validator: (value) => value!.isEmpty ? 'لطفا وزن محصول را وارد کنید' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'ابعاد'),
                  onSaved: (value) => newProduct.dimensions = value ?? '',
                  validator: (value) => value!.isEmpty ? 'لطفا ابعاد محصول را وارد کنید' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'برند'),
                  onSaved: (value) => newProduct.brand = value ?? '',
                  validator: (value) => value!.isEmpty ? 'لطفا برند محصول را وارد کنید' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'تخفیف'),
                  onSaved: (value) => newProduct.discount = value ?? '',
                  validator: (value) => value!.isEmpty ? 'لطفا تخفیف محصول را وارد کنید' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'گارانتی'),
                  onSaved: (value) => newProduct.warranty = value ?? '',
                  validator: (value) => value!.isEmpty ? 'لطفا گارانتی محصول را وارد کنید' : null,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: ImagesUploaderContainer(onChanged: (images) {
                    print(images.length);
                    imagesList = images;
                  }),
                ),
                ElevatedButton(
                  onPressed: _addProduct,
                  child: Text('اضافه کردن محصول'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
