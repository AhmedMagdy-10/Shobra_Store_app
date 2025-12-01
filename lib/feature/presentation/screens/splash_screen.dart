import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shobra_store_app/core/theme/app_theme.dart';
import 'package:shobra_store_app/core/utils/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // navigateToHome();
  }

  // Future<void> navigateToHome() async {
  //   await Future.delayed(const Duration(seconds: 3));
  //   if (mounted) {
  //     Get.off(
  //       () => const HomeScreen(),
  //       transition: Transition.fadeIn,
  //       duration: const Duration(milliseconds: 500),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              mainColor,
              mainColor,
              Colors.white.withValues(alpha: 0.95),
              Colors.white,
            ],
            stops: const [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 24.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Logo
                        Image.asset('assets/images/shubra_logo.png'),

                        SizedBox(height: 24.h),

                        Center(
                          child: Lottie.asset(
                            'assets/images/Animation - 1744956806670 (1).json',
                            height: 350.h,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.shopping_bag_outlined,
                                size: 150.sp,
                                color: mainColor.withValues(alpha: 0.5),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 24.h),
                        // Main Title
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'وفر وقتك مع ',
                                style: Styles.medium20,
                              ),
                              TextSpan(
                                text: 'شبرا ستور',
                                style: Styles.medium20.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21.sp,
                                  color: mainColor,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 12.h),

                        // Subtitle 1
                        Text('كل يوم… إطلالة جديدة', style: Styles.largeTitle),

                        SizedBox(height: 12.h),

                        // Subtitle 2
                        Text(
                          'تصفح الآن واختر ما يناسبك',
                          style: Styles.largeTitle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Bottom Section
              Transform.translate(
                offset: Offset(0, 50.h),
                child: Container(
                  width: double.infinity,
                  height: 150.h,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.elliptical(1.sw, 130),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: mainColor.withValues(alpha: 0.3),
                        blurRadius: 20,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Transform.translate(
                      offset: Offset(0, -15.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'هيا لنبدأ',
                            textAlign: TextAlign.center,
                            style: Styles.mediumTitle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
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
