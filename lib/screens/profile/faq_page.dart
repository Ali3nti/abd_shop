import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('پرسش‌های متداول'),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildFAQItem(
            question: "چگونه می‌توانم ثبت‌نام کنم؟",
            answer: "برای ثبت‌نام، به صفحه ثبت‌نام بروید و اطلاعات خواسته شده را وارد کنید.",
          ),
          _buildFAQItem(
            question: "چگونه می‌توانم سفارش خود را پیگیری کنم؟",
            answer: "پس از ثبت سفارش، لینک پیگیری به ایمیل شما ارسال می‌شود.",
          ),
          _buildFAQItem(
            question: "آیا امکان بازگشت کالا وجود دارد؟",
            answer: "بله، شما می‌توانید کالا را در مدت 7 روز پس از دریافت، بازگردانید.",
          ),
          _buildFAQItem(
            question: "روش‌های پرداخت کدامند؟",
            answer: "شما می‌توانید با کارت‌های اعتباری، پرداخت در محل یا کیف پول الکترونیکی پرداخت کنید.",
          ),
          _buildFAQItem(
            question: "چگونه می‌توانم با پشتیبانی تماس بگیرم؟",
            answer: "شما می‌توانید از طریق صفحه تماس با ما، با پشتیبانی تماس بگیرید.",
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem({required String question, required String answer}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              answer,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
