import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shobra_store_app/core/theme/app_theme.dart';
import 'package:shobra_store_app/feature/presentation/cubits/main_cubit.dart';
import 'package:shobra_store_app/feature/presentation/cubits/main_cubit_states.dart';
import 'package:shobra_store_app/feature/presentation/widgets/custom_app_bar.dart';
import 'package:shobra_store_app/feature/presentation/widgets/custom_curve_buttom.dart';
import 'package:shobra_store_app/feature/presentation/widgets/custom_navigation_bar_icons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainCubitStates>(
      builder: (context, state) {
        var cubit = BlocProvider.of<MainCubit>(context);

        return Scaffold(
          backgroundColor: const Color(0xffffffff),

          body: cubit.pages[cubit.currentIndexPage],
          bottomNavigationBar: const CustomButtomCurveShape(
            child: CustomNavigationBarIcons(),
          ),
        );
      },
    );
  }
}
