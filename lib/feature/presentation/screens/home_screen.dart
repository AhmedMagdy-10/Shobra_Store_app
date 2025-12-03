import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shobra_store_app/core/theme/app_theme.dart';
import 'package:shobra_store_app/core/utils/styles.dart';
import 'package:shobra_store_app/feature/data/model.dart';
import 'package:shobra_store_app/feature/presentation/cubits/main_cubit.dart';
import 'package:shobra_store_app/feature/presentation/cubits/main_cubit_states.dart';
import 'package:shobra_store_app/feature/presentation/widgets/build_categories_item.dart';
import 'package:shobra_store_app/feature/presentation/widgets/build_product_grid.dart';
import 'package:shobra_store_app/feature/presentation/widgets/custom_app_bar.dart';
import 'package:shobra_store_app/feature/presentation/widgets/custom_banner_and_items.dart';
import 'package:shobra_store_app/feature/presentation/widgets/empty_holder_widget.dart';
import 'package:shobra_store_app/feature/presentation/widgets/error_holder_widget.dart';
import 'package:shobra_store_app/feature/presentation/widgets/shimmer_loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      appBar: CustomAppBar(
        actions: [
          Image.asset(
            'assets/images/shubra_logo.png',
            color: mainColor,
            width: 160.w,
          ),
        ],
        leading: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: Row(
            children: [
              Image.asset('assets/images/Search.png', color: mainColor),
              SizedBox(width: 12.w),
              Image.asset('assets/images/Bell.png', color: mainColor),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
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

              BlocBuilder<MainCubit, MainCubitStates>(
                builder: (context, state) {
                  var cubit = BlocProvider.of<MainCubit>(context);

                  if (state is LoadingStates) {
                    return buildShimmerGrid();
                  }

                  if (state is ErrorGetDataState) {
                    return ErrorHolderWidget(
                      error: state.errMessage,
                      cubit: cubit,
                    );
                  }

                  if (cubit.products.isEmpty) {
                    return EmptyHolderWidget(
                      context: context,
                      products: cubit.products,
                    );
                  }

                  return buildProductsGrid(context, cubit.products);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
