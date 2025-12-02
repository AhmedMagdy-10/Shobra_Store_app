import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shobra_store_app/core/theme/app_theme.dart';

class CustomButtomCurveShape extends StatelessWidget {
  const CustomButtomCurveShape({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, 50.h),
      child: Container(
        width: double.infinity,
        height: 150.h,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.elliptical(1.sw, 130),
          ),
          boxShadow: [
            BoxShadow(
              color: mainColor.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
