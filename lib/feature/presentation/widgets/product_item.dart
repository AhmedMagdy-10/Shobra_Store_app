import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shobra_store_app/core/theme/app_theme.dart';
import 'package:shobra_store_app/core/utils/styles.dart';
import 'package:shobra_store_app/feature/data/model.dart';
import 'package:shobra_store_app/feature/presentation/cubits/main_cubit.dart';
import 'package:shobra_store_app/feature/presentation/widgets/product_details_bottom_sheet.dart';

class BuildProductCard extends StatelessWidget {
  const BuildProductCard({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) =>
              ProductDetailsBottomSheet(product: productModel),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 135.h,
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: Colors.grey.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: productModel.image,
                      fit: BoxFit.contain,
                    ),
                  ),

                  Positioned(
                    top: 3.h,
                    left: 3.w,
                    child: CircleAvatar(
                      backgroundColor: secondColor,
                      radius: 18,

                      child: Icon(Icons.favorite_border, size: 22.sp),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 8.h),

              Text(
                productModel.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.right,
                style: Styles.semibold14.copyWith(
                  color: Colors.black87,
                  fontSize: 13.sp,
                ),
              ),

              SizedBox(height: 8.h),

              // Price
              Text(
                "\$ ${productModel.price}",
                style: Styles.semibold14.copyWith(
                  color: mainColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<MainCubit>(context).addToCart(productModel);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                  ),
                  child: Text(
                    '+ أضف للسلة',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: secondColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
