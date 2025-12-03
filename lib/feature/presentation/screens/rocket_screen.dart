import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shobra_store_app/core/theme/app_theme.dart';
import 'package:shobra_store_app/core/utils/styles.dart';
import 'package:shobra_store_app/feature/presentation/widgets/custom_app_bar.dart';

class RocketScreen extends StatelessWidget {
  const RocketScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      appBar: CustomAppBar(
        actions: [Text('الطلب السريع', style: Styles.largeTitle)],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Lottie.asset(
            'assets/images/Rocket Fast.json',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
