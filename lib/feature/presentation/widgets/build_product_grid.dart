import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shobra_store_app/feature/data/model.dart';
import 'package:shobra_store_app/feature/presentation/widgets/product_item.dart';

Widget buildProductsGrid(BuildContext context, List<ProductModel> products) {
  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.60,
      crossAxisSpacing: 12.w,
      mainAxisSpacing: 12.h,
    ),
    itemCount: products.length,
    itemBuilder: (context, index) {
      return BuildProductCard(productModel: products[index]);
    },
  );
}
