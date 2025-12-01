import 'package:flutter/material.dart';
import 'package:shobra_store_app/core/theme/app_theme.dart';

abstract class Styles {
  static final largeTitle = TextStyle(
    fontSize: 28,
    fontFamily: 'IBM Plex Sans Arabic',
    fontWeight: FontWeight.w600,
    color: mainColor,
  );
  static final mediumTitle = TextStyle(
    fontSize: 24,
    fontFamily: 'IBM Plex Sans Arabic',
    fontWeight: FontWeight.w600,
    color: mainColor,
  );
  static final medium20 = TextStyle(
    fontSize: 20,
    fontFamily: 'IBM Plex Sans Arabic',
    fontWeight: FontWeight.w500,
    color: mainColor,
  );
}
