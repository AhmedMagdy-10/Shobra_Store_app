import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shobra_store_app/core/theme/app_theme.dart';

class ProductDetailsBottomSheet extends StatefulWidget {
  final dynamic product;

  const ProductDetailsBottomSheet({super.key, required this.product});

  @override
  State<ProductDetailsBottomSheet> createState() =>
      _ProductDetailsBottomSheetState();
}

class _ProductDetailsBottomSheetState extends State<ProductDetailsBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  int quantity = 1;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
        ),
        child: Column(
          children: [
            // Handle Bar
            _buildHandleBar(),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Product Image with Hero Animation
                    _buildProductImage(),

                    // Product Info
                    Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Category & Rating
                          _buildCategoryAndRating(),

                          SizedBox(height: 12.h),

                          // Title
                          _buildTitle(),

                          SizedBox(height: 16.h),

                          // Price & Quantity
                          _buildPriceAndQuantity(),

                          SizedBox(height: 20.h),

                          // Description
                          _buildDescription(),

                          SizedBox(height: 24.h),

                          // Features/Benefits
                          _buildFeatures(),

                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Actions
            _buildBottomActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildHandleBar() {
    return Container(
      margin: EdgeInsets.only(top: 12.h, bottom: 8.h),
      width: 50.w,
      height: 5.h,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10.r),
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      height: 300.h,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [mainColor.withOpacity(0.05), Colors.white],
        ),
      ),
      child: Stack(
        children: [
          // Product Image
          Center(
            child: Hero(
              tag: 'product_${widget.product.id}',
              child: CachedNetworkImage(
                imageUrl: widget.product.image ?? '',
                height: 250.h,
                fit: BoxFit.contain,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator(color: mainColor)),
                errorWidget: (context, url, error) => Icon(
                  Icons.image_not_supported,
                  size: 100.sp,
                  color: Colors.grey,
                ),
              ),
            ),
          ),

          // Close Button
          Positioned(
            top: 16.h,
            left: 16.w,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(Icons.close, size: 24.sp, color: Colors.black87),
              ),
            ),
          ),

          // Favorite Button
          Positioned(
            top: 16.h,
            right: 16.w,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 24.sp,
                  color: isFavorite ? Colors.red : Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryAndRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Rating
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: Colors.amber.shade50,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 18.sp),
              SizedBox(width: 4.w),
              Text(
                '${widget.product.rating.rate}',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber.shade900,
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                '(${widget.product.rating.count})',
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
            ],
          ),
        ),

        // Category
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: mainColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            widget.product.category.toString().toUpperCase(),
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              color: mainColor,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.product.title ?? '',
      style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
        height: 1.3,
      ),
      textAlign: TextAlign.right,
    );
  }

  Widget _buildPriceAndQuantity() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Quantity Selector
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Row(
            children: [
              // Minus
              _buildQuantityButton(
                icon: Icons.remove,
                onTap: () {
                  if (quantity > 1) {
                    setState(() => quantity--);
                  }
                },
              ),

              // Quantity
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  '$quantity',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Plus
              _buildQuantityButton(
                icon: Icons.add,
                onTap: () {
                  setState(() => quantity++);
                },
              ),
            ],
          ),
        ),

        // Price
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'السعر',
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
            Text(
              '\$${(widget.product.price * quantity).toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: secondColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: mainColor.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20.sp, color: mainColor),
      ),
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'الوصف',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          widget.product.description ?? '',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey.shade700,
            height: 1.5,
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }

  Widget _buildFeatures() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'المميزات',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 12.h),
        _buildFeatureItem(Icons.verified, 'ضمان الجودة'),
        _buildFeatureItem(Icons.local_shipping, 'شحن مجاني'),
        _buildFeatureItem(Icons.replay, 'إرجاع خلال 30 يوم'),
        _buildFeatureItem(Icons.support_agent, 'دعم فني 24/7'),
      ],
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700),
          ),
          SizedBox(width: 12.w),
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: secondColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, size: 20.sp, color: secondColor),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Share Button
          _buildActionButton(
            icon: Icons.share,
            onTap: () {
              // Share functionality
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('مشاركة المنتج')));
            },
          ),

          SizedBox(width: 12.w),

          // Add to Cart Button
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('تم إضافة ${widget.product.title} إلى السلة'),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                    action: SnackBarAction(
                      label: 'عرض السلة',
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart, color: secondColor, size: 24.sp),
                  SizedBox(width: 8.w),
                  Text(
                    'أضف إلى السلة',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: secondColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          border: Border.all(color: mainColor),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Icon(icon, color: mainColor, size: 24.sp),
      ),
    );
  }
}
