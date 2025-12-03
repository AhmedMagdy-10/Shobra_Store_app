// 1. product_shimmer.dart - Shimmer Widget
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              children: [
                Shimmer(
                  duration: const Duration(seconds: 2),
                  interval: const Duration(seconds: 1),
                  color: Colors.grey.shade300,
                  colorOpacity: 0.3,
                  enabled: true,
                  direction: const ShimmerDirection.fromLTRB(),
                  child: Container(
                    width: double.infinity,
                    height: 120.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
                // Favorite Icon Shimmer
                Positioned(
                  top: 4.h,
                  left: 4.w,
                  child: Shimmer(
                    duration: const Duration(seconds: 2),
                    color: Colors.grey.shade300,
                    child: Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 8.h),

            Shimmer(
              duration: const Duration(seconds: 2),
              color: Colors.grey.shade300,
              child: Container(
                width: double.infinity,
                height: 12.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),

            SizedBox(height: 6.h),

            Shimmer(
              duration: const Duration(seconds: 2),
              color: Colors.grey.shade300,
              child: Container(
                width: 80.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),

            SizedBox(height: 8.h),

            Shimmer(
              duration: const Duration(seconds: 2),
              color: Colors.grey.shade300,
              child: Container(
                width: 60.w,
                height: 16.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),

            const Spacer(),

            Shimmer(
              duration: const Duration(seconds: 2),
              color: Colors.grey.shade300,
              child: Container(
                width: double.infinity,
                height: 36.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildShimmerGrid() {
  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.65,
      crossAxisSpacing: 12.w,
      mainAxisSpacing: 12.h,
    ),
    itemCount: 6, // 6 shimmer items
    itemBuilder: (context, index) {
      return const ProductShimmer();
    },
  );
}
