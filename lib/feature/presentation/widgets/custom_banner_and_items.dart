import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shobra_store_app/core/constant/constant_string.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200.h,
        aspectRatio: 16 / 9,
        autoPlay: true,

        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: [
        BannerItems(imageUrl: ConstantString.promoBanner),
        BannerItems(imageUrl: ConstantString.promoBanner2),
        BannerItems(imageUrl: ConstantString.promoBanner3),
      ],
    );
  }
}

class BannerItems extends StatelessWidget {
  const BannerItems({super.key, required this.imageUrl});

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(18.w)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.w),
        child: Image.asset(imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}
