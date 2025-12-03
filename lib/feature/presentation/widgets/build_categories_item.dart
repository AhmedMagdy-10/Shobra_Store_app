import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shobra_store_app/core/theme/app_theme.dart';
import 'package:shobra_store_app/feature/presentation/cubits/main_cubit.dart';
import 'package:shobra_store_app/feature/presentation/cubits/main_cubit_states.dart';
import 'package:shobra_store_app/feature/presentation/widgets/custom_buttom.dart';

Widget buildCategories() {
  final List<Map<String, String?>> categories = [
    {'label': 'الكترونيات', 'value': 'electronics'},
    {'label': 'اكسسوارات', 'value': 'jewelery'},
    {'label': 'ملابس رجالي', 'value': "men's clothing"},
    {'label': 'ملابس حريمي', 'value': "women's clothing"},
    {'label': 'كل المنتجات', 'value': null},
  ];

  return BlocBuilder<MainCubit, MainCubitStates>(
    builder: (context, state) {
      var cubit = BlocProvider.of<MainCubit>(context);

      return Container(
        height: 50.h,
        margin: EdgeInsets.symmetric(vertical: 10.h),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            final isSelected = cubit.selectedCategory == category['value'];

            return Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: CustomButtonModifyed(
                onTapButton: () {
                  // ✅ THIS IS THE FIX!
                  if (category['value'] == null) {
                    // Get all products
                    cubit.getAllProducts();
                  } else {
                    // Get filtered products
                    cubit.getCategoryProduct(category['value']!);
                  }
                },
                text: category['label']!,
                color: isSelected ? mainColor : secondColor,
                textStyle: TextStyle(
                  color: isSelected ? secondColor : mainColor,
                  fontSize: 20.sp,

                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
