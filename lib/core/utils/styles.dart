import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shobra_store_app/core/theme/app_theme.dart';

abstract class Styles {
  static final largeTitle = TextStyle(
    fontSize: 28.sp,
    fontFamily: 'IBM Plex Sans Arabic',
    fontWeight: FontWeight.w600,
    color: mainColor,
  );
  static final mediumTitle = TextStyle(
    fontSize: 24.sp,
    fontFamily: 'IBM Plex Sans Arabic',
    fontWeight: FontWeight.w600,
    color: mainColor,
  );
  static final medium20 = TextStyle(
    fontSize: 20.sp,
    fontFamily: 'IBM Plex Sans Arabic',
    fontWeight: FontWeight.w500,
    color: mainColor,
  );
  static final semibold14 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: mainColor,
  );
}
