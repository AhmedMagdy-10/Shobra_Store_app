import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shobra_store_app/core/theme/app_theme.dart';
import 'package:shobra_store_app/feature/presentation/cubits/main_cubit.dart';
import 'package:shobra_store_app/feature/presentation/cubits/main_cubit_states.dart';

class CustomNavigationBarIcons extends StatelessWidget {
  const CustomNavigationBarIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -12.h),
      child: BlocBuilder<MainCubit, MainCubitStates>(
        builder: (context, state) {
          var cubit = BlocProvider.of<MainCubit>(context);

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SelectedItem(
                stringIcon: 'assets/images/Settings.png',
                isSelected: cubit.currentIndexPage == 4,
                onTap: () => cubit.togglePages(4),
              ),
              SelectedItem(
                stringIcon: 'assets/images/Rocket.png',
                isSelected: cubit.currentIndexPage == 3,
                onTap: () => cubit.togglePages(3),
              ),
              SelectedItem(
                stringIcon: 'assets/images/Receipt.png',
                isSelected: cubit.currentIndexPage == 2,
                onTap: () => cubit.togglePages(2),
              ),
              SelectedItem(
                stringIcon: 'assets/images/Cart.png',
                isSelected: cubit.currentIndexPage == 1,
                onTap: () => cubit.togglePages(1),
              ),
              SelectedItem(
                stringIcon: 'assets/images/home.png',
                isSelected: cubit.currentIndexPage == 0,
                onTap: () => cubit.togglePages(0),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SelectedItem extends StatelessWidget {
  const SelectedItem({
    super.key,
    required this.stringIcon,
    required this.isSelected,
    required this.onTap,
  });

  final String stringIcon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            stringIcon,
            color: isSelected
                ? secondColor
                : const Color.fromARGB(255, 189, 186, 186),
            width: 24.w,
            height: 24.h,
          ),
          SizedBox(height: 5.h),
          if (isSelected)
            Container(
              width: 45.w,
              height: 3.h,
              decoration: BoxDecoration(
                color: secondColor,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
        ],
      ),
    );
  }
}
