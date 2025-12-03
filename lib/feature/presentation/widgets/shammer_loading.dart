// 5. product_shimmer.dart - Shimmer Loading
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
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Shimmer(
              duration: const Duration(seconds: 2),
              color: Colors.grey.shade300,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category
                  Shimmer(
                    duration: const Duration(seconds: 2),
                    color: Colors.grey.shade300,
                    child: Container(
                      width: 60.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Shimmer(
                    duration: const Duration(seconds: 2),
                    color: Colors.grey.shade300,
                    child: Container(
                      width: double.infinity,
                      height: 12.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  ),

                  SizedBox(height: 6.h),

                  // Title Line 2
                  Shimmer(
                    duration: const Duration(seconds: 2),
                    color: Colors.grey.shade300,
                    child: Container(
                      width: 100.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Shimmer(
                        duration: const Duration(seconds: 2),
                        color: Colors.grey.shade300,
                        child: Container(
                          width: 50.w,
                          height: 16.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ),
                      Shimmer(
                        duration: const Duration(seconds: 2),
                        color: Colors.grey.shade300,
                        child: Container(
                          width: 40.w,
                          height: 14.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
