import 'package:abd_shop/models/response_model.dart';
import 'package:abd_shop/widget/camera/images_uploader_container.dart';
import 'package:flutter/material.dart';
import 'package:abd_shop/models/product_model.dart';
import 'package:abd_shop/services/api_helper.dart';

class AddProductToListPage extends StatefulWidget {
  const AddProductToListPage({super.key});

  @override
  State<AddProductToListPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductToListPage> {
  final _formKey = GlobalKey<FormState>();
  Product newProduct = Product();
  List<dynamic> imagesList = [];

  void _addProduct() async {
    print("تابع _addProduct فراخوانی شد");

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        print("در حال ارسال اطلاعات محصول...");
        DataResponse response =
            await sendNewProduct(product: newProduct, images: imagesList);

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
                _textField(
                    'نام محصول',
                    (value) => newProduct.name = value ?? '',
                    'لطفا نام محصول را وارد کنید'),
                _textField(
                    'شناسه دسته بندی(Category ID)',
                    (value) =>
                        newProduct.categoryId = int.tryParse(value ?? '') ?? 0,
                    'لطفا شناسه دسته بندی را وارد کنید'),
                _textField(
                    'قیمت',
                    (value) =>
                        newProduct.price = int.tryParse(value ?? '') ?? 0,
                    'لطفا قیمت را وارد کنید',
                    keyboardType: TextInputType.number),
                _textField(
                    'توضیحات محصول',
                    (value) => newProduct.description = value ?? '',
                    'لطفا توضیحات محصول را وارد کنید'),
                _textField(
                    'مقدار موجودی',
                    (value) => newProduct.stockQuantity =
                        int.tryParse(value ?? '') ?? 0,
                    'لطفا مقدار موجودی محصول را وارد کنید'),
                _textField(
                    'واحد(unit)',
                    (value) => newProduct.unit = value ?? '',
                    'لطفا واحد محصول را وارد کنید'),
                _textField('فعال بودن محصول(بله/خیر)', (value) {
                  newProduct.isActive = value?.toLowerCase() == 'بله' ? 1 : 0;
                }, 'لطفا فعال بودن یا نبودن محصول را وارد کنید'),
                _textField(
                    'وزن',
                    (value) =>
                        newProduct.weight = double.tryParse(value ?? '') ?? 0.0,
                    'لطفا وزن محصول را وارد کنید'),
                _textField(
                    'ابعاد',
                    (value) => newProduct.dimensions = value ?? '',
                    'لطفا ابعاد محصول را وارد کنید'),
                _textField('برند', (value) => newProduct.brand = value ?? '',
                    'لطفا برند محصول را وارد کنید'),
                _textField(
                    'تخفیف',
                    (value) =>
                        newProduct.discount = int.tryParse(value ?? '') ?? 0,
                    'لطفا تخفیف محصول را وارد کنید'),
                _textField(
                    'گارانتی',
                    (value) => newProduct.warranty = value ?? '',
                    'لطفا گارانتی محصول را وارد کنید'),
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

  Widget _textField(
      String label, Function(String?) onSaved, String validatorMessage,
      {TextInputType keyboardType = TextInputType.text}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(12.0),
        ),
        onSaved: onSaved,
        validator: (value) => value!.isEmpty ? validatorMessage : null,
        keyboardType: keyboardType,
      ),
    );
  }
}
