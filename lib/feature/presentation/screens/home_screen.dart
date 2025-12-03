import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shobra_store_app/core/utils/styles.dart';
import 'package:shobra_store_app/feature/presentation/widgets/build_categories_item.dart';
import 'package:shobra_store_app/feature/presentation/widgets/build_product_grid.dart';
import 'package:shobra_store_app/feature/presentation/widgets/custom_banner_and_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const CustomBanner(),

            SizedBox(height: 20.h),

            Text('التصنيفات', style: Styles.largeTitle),

            SizedBox(height: 12.h),

            buildCategories(),

            SizedBox(height: 20.h),

            buildProductsGrid(),
          ],
        ),
      ),
    );
  }
}
