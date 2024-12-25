import 'dart:async';
import 'package:abd_shop/constants.dart';
import 'package:abd_shop/screens/delivery/delivery_page.dart';
import 'package:abd_shop/screens/delivery/driver_page.dart';
import 'package:abd_shop/screens/home/components/slider_Image/image_slider.dart';
import 'package:abd_shop/screens/profile/invite_page.dart';
import 'package:abd_shop/screens/user/user_registration_page.dart';
import 'package:abd_shop/screens/verify/phone_Verify_Page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeImagesSlider extends StatefulWidget {
  const HomeImagesSlider({super.key});

  @override
  State<HomeImagesSlider> createState() => _HomeImagesSliderState();
}

class _HomeImagesSliderState extends State<HomeImagesSlider> {
  final PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.9,
  );
  int currentPage = 0;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    startAutoSlide();
  }

  void startAutoSlide() {
    timer = Timer.periodic(
      const Duration(seconds: 6),
      (Timer timer) {
        if (currentPage < 4) {
          currentPage++;
        } else {
          currentPage = 0;
        }
        pageController.animateToPage(currentPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInQuad);
      },
    );
  }
  sliderPage1(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserRegistrationPage(),
      ),
    );
  }
  sliderPage2(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhoneVerificationPage(),
      ),
    );
  }
  sliderPage3(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DriverPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        SizedBox(
          height: 150,
          child: PageView(
            controller: pageController,
            children: [
              ImageSlider(
                onTap: () {
                  sliderPage3(context);
                },
                imageUrl:
                    "https://dkstatics-public.digikala.com/jet-public/1f05b854f620f190fec7189f31ef89487d5364cf_1730190500.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90/format,webp",
              ),
              ImageSlider(
                onTap: () {sliderPage1(context);},
                imageUrl:
                    "https://dkstatics-public.digikala.com/jet-public/ff7c6541fd471b0de113e2bb955e8bfc88d262b6_1719908556.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90/format,webp",
              ),
              ImageSlider(
                onTap: () {
                  sliderPage2(context);
                },
                imageUrl:
                    "https://dkstatics-public.digikala.com/jet-public/d73eff9db87cd3fd72be30f49e67a1640dde615e_1717333163.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90/format,webp",
              ),
              ImageSlider(
                onTap: () {
                  sliderPage2(context);
                },
                imageUrl:
                    "https://dkstatics-public.digikala.com/jet-public/287f806c0a801981f5e085734e9d4273bd1d3299_1718721407.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90/format,webp",
              ),
              ImageSlider(
                onTap: () {
                  sliderPage2(context);
                },
                imageUrl:
                    "https://dkstatics-public.digikala.com/jet-public/b1f8c75e632c39a3e095a7fc5687fba76ac5ee8b_1730190734.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90/format,webp",
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 60, bottom: 20),
          child: SmoothPageIndicator(
            controller: pageController,
            count: 5,
            effect: const WormEffect(
              activeDotColor: kPrimaryTextColor,
              dotHeight: 7,
              dotWidth: 7,
            ),
          ),
        ),
      ],
    );
  }
}
