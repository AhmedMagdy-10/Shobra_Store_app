import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shobra_store_app/feature/presentation/widgets/product_item.dart';

Widget buildProductsGrid() {
  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.60,
      crossAxisSpacing: 12.w,
      mainAxisSpacing: 12.h,
    ),
    itemCount: 4,
    itemBuilder: (context, index) {
      return buildProductCard();
    },
  );
}
