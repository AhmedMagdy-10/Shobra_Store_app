import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shobra_store_app/feature/data/model.dart';

class EmptyHolderWidget extends StatelessWidget {
  const EmptyHolderWidget({
    super.key,
    required this.context,
    required this.products,
  });
  final BuildContext context;
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h),
        child: Column(
          children: [
            Icon(Icons.shopping_bag_outlined, size: 60.sp, color: Colors.grey),
            SizedBox(height: 16.h),
            Text('لا توجد منتجات', style: TextStyle(fontSize: 18.sp)),
          ],
        ),
      ),
    );
  }
}
