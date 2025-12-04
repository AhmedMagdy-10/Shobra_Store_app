import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shobra_store_app/core/theme/app_theme.dart';
import 'package:shobra_store_app/core/utils/styles.dart';

import 'package:shobra_store_app/feature/data/cart_item_model.dart';
import 'package:shobra_store_app/feature/presentation/cubits/main_cubit.dart';
import 'package:shobra_store_app/feature/presentation/cubits/main_cubit_states.dart';
import 'package:shobra_store_app/feature/presentation/widgets/custom_app_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      appBar: CustomAppBar(
        actions: [Text('سلة المشتريات', style: Styles.largeTitle)],
      ),
      body: BlocBuilder<MainCubit, MainCubitStates>(
        builder: (context, state) {
          var cubit = BlocProvider.of<MainCubit>(context);

          if (cubit.cartItems.isEmpty) {
            return _buildEmptyCart();
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () {
                    showClearCartDialog(context, cubit);
                  },
                  child: Text('مسح الكل ', style: Styles.semibold14),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(16.w),
                  itemCount: cubit.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cubit.cartItems[index];
                    return _buildCartItem(context, item, cubit);
                  },
                ),
              ),

              // Bottom Summary
              buildBottomSummary(context, cubit),
            ],
          );
        },
      ),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Lottie.asset(
          'assets/images/Mobile Shopping.json',
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildCartItem(
    BuildContext context,
    CartItemModel item,
    MainCubit cubit,
  ) {
    return Dismissible(
      key: Key(item.productId.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        cubit.removeFromCart(item.productId);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تم حذف ${item.title}'),
            behavior: SnackBarBehavior.floating,
            action: SnackBarAction(
              label: 'تراجع',
              onPressed: () {
                // Add back logic
              },
            ),
          ),
        );
      },
      background: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16.r),
        ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Icon(Icons.delete, color: Colors.white, size: 32.sp),
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Quantity Controls
            Column(
              children: [
                buildQuantityButton(
                  icon: Icons.add,
                  onTap: () => cubit.increaseQuantity(item.productId),
                ),
                SizedBox(height: 8.h),
                Text(
                  '${item.quantity}',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                buildQuantityButton(
                  icon: Icons.remove,
                  onTap: () => cubit.decreaseQuantity(item.productId),
                ),
              ],
            ),

            SizedBox(width: 16.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    item.category.toUpperCase(),
                    style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (item.quantity > 1)
                        Text(
                          '\$${item.price.toStringAsFixed(2)} × ${item.quantity}',
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                        ),
                      SizedBox(width: 8.w),
                      Text(
                        '\$${item.totalPrice.toStringAsFixed(2)}',
                        style: Styles.medium20,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(width: 12.w),

            // Product Image
            Container(
              width: 80.w,
              height: 80.h,
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: CachedNetworkImage(
                imageUrl: item.image,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQuantityButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32.w,
        height: 32.h,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(icon, size: 18.sp, color: secondColor),
      ),
    );
  }

  Widget buildBottomSummary(BuildContext context, MainCubit cubit) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'الإجمالي',
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '\$${cubit.totalPrice.toStringAsFixed(2)}',
                      style: Styles.largeTitle,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: secondColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.shopping_bag, size: 18.sp, color: secondColor),
                      SizedBox(width: 8.w),
                      Text(
                        '${cubit.totalItems} منتج',
                        style: Styles.semibold14,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            // Checkout Button
            SizedBox(
              width: double.infinity,
              height: 56.h,
              child: ElevatedButton(
                onPressed: () {
                  showCheckoutDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_checkout,
                      size: 24.sp,
                      color: secondColor,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      'إتمام الطلب',
                      style: Styles.medium20.copyWith(color: secondColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showClearCartDialog(BuildContext context, MainCubit cubit) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('مسح السلة'),
        content: const Text('هل تريد حذف جميع المنتجات من السلة؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              cubit.clearCart();
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('مسح'),
          ),
        ],
      ),
    );
  }

  void showCheckoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 32.sp),
            SizedBox(width: 12.w),
            const Text('تم الطلب بنجاح'),
          ],
        ),
        content: const Text('سيتم التواصل معك قريباً لتأكيد الطلب'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('حسناً'),
          ),
        ],
      ),
    );
  }
}
