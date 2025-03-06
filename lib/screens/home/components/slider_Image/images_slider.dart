import 'dart:async';
import 'package:abd_shop/constants.dart';
import 'package:abd_shop/screens/delivery/driver_info_page.dart';
import 'package:abd_shop/screens/home/components/slider_Image/image_slider.dart';
import 'package:abd_shop/screens/orders/order_tracking_page.dart';

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
        builder: (context) => OrderTrackingPage(),
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
        builder: (context) => DriverInfoPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        SizedBox(
          height: 145,
          child: PageView(
            controller: pageController,
            children: [
              ImageSlider(
                  onTap: () {sliderPage1(context);},
                  imageUrl:
                      "https://dkstatics-public.digikala.com/jet-public/1e77e2ed6449ea7e0325fa939227b888b82f9351_1732346071.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90/format,webp"),
              ImageSlider(
                  onTap: () {},
                  imageUrl:
                      "https://dkstatics-public.digikala.com/jet-public/9346504408270c417a32b541ff014afa4acabf66_1735336788.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90/format,webp"),
              ImageSlider(
                  onTap: () {},
                  imageUrl:
                      "https://dkstatics-public.digikala.com/jet-public/8064f8a09e057f7d2390e70d95f03b6306907312_1734947925.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90/format,webp"),
              ImageSlider(
                  onTap: () {},
                  imageUrl:
                      "https://dkstatics-public.digikala.com/jet-public/e497e0d8b5782898d978330280548663404d01df_1735336667.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90/format,webp"),
              ImageSlider(
                  onTap: () {},
                  imageUrl:
                      "https://dkstatics-public.digikala.com/jet-public/c54133989b3188b319123577465bd727e151fe56_1735336587.jpg?x-oss-process=image/resize,m_lfit,h_800,w_800/quality,q_90/format,webp"),
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
