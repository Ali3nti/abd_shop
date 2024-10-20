import 'package:flutter/material.dart';

class ProductPageDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مشخصات محصول'),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/mahsool1.png', // لینک تصویر محصول
              height: 250,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'عنوان محصول',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'توضیحات محصول:  مرغ ممتاز - یک کیلوگرم.',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'قیمت: 200000',
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // عملکرد دکمه Add را اینجا اضافه کنید
                          print('Product added to cart');
                        },
                        child: Text('اضافه کردن به سبد خرید',style: TextStyle(color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          minimumSize: Size(double.infinity, 50), // دکمه تمام عرض
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ویژگی‌ها',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('• منبع پروتئین با کیفیت بالا', style: TextStyle(fontSize: 16)),
                      Text('• کم‌چرب و مناسب برای رژیم‌های غذایی', style: TextStyle(fontSize: 16)),
                      Text('• حاوی ویتامین‌های B6 و B12', style: TextStyle(fontSize: 16)),
                      Text('• طعمی لذیذ و قابل استفاده در انواع غذاها', style: TextStyle(fontSize: 16)),
                      Text('• آسان برای پخت و آماده‌سازی', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'نظرات',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildReview('این محصول واقعاً عالی است! کیفیت بسیار خوبی دارد.', 'علی', '⭐⭐⭐⭐⭐'),
                  _buildReview('من از خرید این محصول بسیار راضی هستم. به همه توصیه می‌کنم.', 'مریم', '⭐⭐⭐⭐'),
                  _buildReview('قیمت مناسب و عملکرد عالی. واقعاً ارزش خرید دارد.', 'رضا', '⭐⭐⭐⭐⭐'),
                  _buildReview('طراحی زیبا و کاربرپسند. من به شدت این محصول را توصیه می‌کنم.', 'سارا', '⭐⭐⭐⭐'),
                  _buildReview('تجربه خوبی از استفاده از این محصول داشتم. حتماً دوباره خرید می‌کنم.', 'محمد', '⭐⭐⭐⭐⭐'),
                ],
              ),
            ),
          ),
        ),
          ],
        ),
      ),
    );
  }
}





Widget _buildReview(String review, String author, String rating) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            review,
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
          SizedBox(height: 5),
          Text(
            '- $author',
            style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.teal),
          ),
          Text(
            rating,
            style: TextStyle(fontSize: 14, color: Colors.amber),
          ),
        ],
      ),
    ),
  );
}
