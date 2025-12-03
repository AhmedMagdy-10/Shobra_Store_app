import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shobra_store_app/core/repo/api_helper.dart';
import 'package:shobra_store_app/core/repo/home_repo_imple.dart';
import 'package:shobra_store_app/feature/presentation/cubits/main_cubit.dart';
import 'package:shobra_store_app/feature/presentation/screens/splash_screen.dart';

void main() {
  // Removes pointer indicators
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final dio = Dio();

    // 2. Create ApiHelper
    final apiHelper = ApiHelper(dio);

    // 3. Create Repository
    final homeRepo = HomeRepoImpl(apiHelper);
    return BlocProvider(
      create: (context) => MainCubit(homeRepo)..getAllProducts(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'IBM Plex Sans Arabic',
            primarySwatch: Colors.green,
          ),
          home: Scaffold(body: SplashScreen()),
        ),
      ),
    );
  }
}
