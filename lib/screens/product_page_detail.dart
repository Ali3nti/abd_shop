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
            _buildProductInfo(),
            SizedBox(height: 20),
            _buildProductFeatures(),
            SizedBox(height: 50),
            _buildReviewsSection(),
            SizedBox(height: 20),
            StarRating(onRatingChanged: (double rating) { /* ثبت امتیاز */ }),
          ],
        ),
      ),
    );
  }

  Widget _buildProductInfo() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(horizontal: 16.0),
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
            'توضیحات محصول: مرغ ممتاز - یک کیلوگرم.',
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
              print('Product added to cart');
            },
            child: Text('اضافه کردن به سبد خرید', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductFeatures() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(horizontal: 16.0),
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
    );
  }

  Widget _buildReviewsSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(horizontal: 16.0),
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
    );
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
}

class StarRating extends StatefulWidget {
  final int starCount;
  final double rating;
  final Function(double) onRatingChanged;

  StarRating({
    this.starCount = 5,
    this.rating = 0.0,
    required this.onRatingChanged,
  });

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  double _rating = 0.0;

  @override
  void initState() {
    super.initState();
    _rating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.starCount, (index) {
              return IconButton(
                icon: Icon(
                  index < _rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                ),
                onPressed: () {
                  setState(() {
                    _rating = index + 1.0;
                  });
                  widget.onRatingChanged(_rating);
                },
              );
            }),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("امتیاز شما: $_rating ثبت شد")),
              );
            },
            child: Text('ثبت امتیاز'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
