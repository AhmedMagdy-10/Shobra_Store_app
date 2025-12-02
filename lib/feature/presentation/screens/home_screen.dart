import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shobra_store_app/core/theme/app_theme.dart';
import 'package:shobra_store_app/feature/presentation/widgets/custom_app_bar.dart';
import 'package:shobra_store_app/feature/presentation/widgets/custom_banner_and_items.dart';
import 'package:shobra_store_app/feature/presentation/widgets/custom_curve_buttom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: CustomAppBar(
        actions: [
          Image.asset(
            'assets/images/shubra_logo.png',
            color: mainColor,
            width: 160.w,
          ),
        ],
        leading: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: Row(
            children: [
              Image.asset('assets/images/Search.png', color: mainColor),
              SizedBox(width: 12.w),
              Image.asset('assets/images/Bell.png', color: mainColor),
            ],
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(children: [CustomBanner()]),
      ),

      bottomNavigationBar: CustomButtomCurveShape(
        child: Transform.translate(
          offset: Offset(0, -15.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/Settings.png'),
              Image.asset('assets/images/Rocket.png'),
              Image.asset('assets/images/Receipt.png'),
              Image.asset('assets/images/Cart.png'),
              Image.asset('assets/images/home.png'),
            ],
          ),
        ),
      ),
    );
  }
}
