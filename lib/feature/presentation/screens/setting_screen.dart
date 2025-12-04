import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shobra_store_app/core/theme/app_theme.dart';
import 'package:shobra_store_app/core/utils/styles.dart';
import 'package:shobra_store_app/feature/presentation/cubits/main_cubit.dart';
import 'package:shobra_store_app/feature/presentation/widgets/custom_app_bar.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<MainCubit>(context);
    return Scaffold(
      backgroundColor: secondColor,
      appBar: CustomAppBar(
        actions: [Text('الاعدادات', style: Styles.largeTitle)],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildHeader(),

            SizedBox(height: 24.h),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xff2749BF),
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff2749BF).withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildDarkModeSection(cubit),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Divider(
                      color: Colors.white.withValues(alpha: 0.2),
                      thickness: 1,
                    ),
                  ),

                  _buildLanguageSection(context, cubit),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            _buildAdditionalSettings(context),

            SizedBox(height: 24.h),

            buildAboutSection(),
          ],
        ),
      ),
    );
  }
}

Widget _buildHeader() {
  return Container(
    padding: EdgeInsets.all(20.w),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Color(0xff2749BF), Color(0xff4A6FE8)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(20.r),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'الإعدادات العامة',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'تخصيص تجربتك',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
        SizedBox(width: 16.w),
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(Icons.settings, color: Colors.white, size: 32.sp),
        ),
      ],
    ),
  );
}

Widget _buildDarkModeSection(MainCubit cubit) {
  return Container(
    padding: EdgeInsets.all(20.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Switch
        Transform.scale(
          scale: 1.1,
          child: Switch(
            value: cubit.isDarkMode,

            onChanged: (value) {
              cubit.toggleMode();
            },
            activeThumbColor: const Color(0xff122258),
            activeTrackColor: const Color(0xff122258).withValues(alpha: 0.5),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.white.withValues(alpha: 0.3),
          ),
        ),

        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'تفعيل الوضع الليلي',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    cubit.isDarkMode ? 'مفعّل' : 'غير مفعّل',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 12.w),
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: cubit.isDarkMode
                      ? const Color(0xff122258)
                      : Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  cubit.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildLanguageSection(BuildContext context, MainCubit cubit) {
  return InkWell(
    onTap: () {
      _showLanguageBottomSheet(context, cubit);
    },
    child: Container(
      padding: EdgeInsets.all(20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Arrow Icon
          Icon(
            Icons.arrow_back_ios,
            color: Colors.white.withValues(alpha: 0.7),
            size: 20.sp,
          ),

          // Text & Icon
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'اختيار اللغة',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        cubit.selectedLangauge,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 12.w),
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(Icons.language, color: Colors.white, size: 24.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildAdditionalSettings(BuildContext context) {
  final settings = [
    {
      'icon': Icons.notifications,
      'title': 'الإشعارات',
      'subtitle': 'إدارة الإشعارات',
      'color': const Color(0xFFFF6B6B),
    },
    {
      'icon': Icons.security,
      'title': 'الخصوصية والأمان',
      'subtitle': 'حماية بياناتك',
      'color': const Color(0xFF4ECDC4),
    },
    {
      'icon': Icons.help_outline,
      'title': 'المساعدة والدعم',
      'subtitle': 'تواصل معنا',
      'color': const Color(0xFFFFBE0B),
    },
  ];

  return Column(
    children: settings.map((setting) {
      return Container(
        margin: EdgeInsets.only(bottom: 12.h),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          child: InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('فتح ${setting['title']}'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            borderRadius: BorderRadius.circular(16.r),
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios, size: 16.sp, color: Colors.grey),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        setting['title'] as String,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        setting['subtitle'] as String,
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(width: 12.w),
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: (setting['color'] as Color).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      setting['icon'] as IconData,
                      color: setting['color'] as Color,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }).toList(),
  );
}

Widget buildAboutSection() {
  return Container(
    padding: EdgeInsets.all(20.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/shubra_logo.png',
              width: 40.w,
              height: 40.h,
            ),
            SizedBox(width: 12.w),
            Text(
              'شبرا ستور',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xff2749BF),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Text(
          'الإصدار 1.0.0',
          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
        ),
        SizedBox(height: 8.h),
        Text(
          '© 2024 جميع الحقوق محفوظة',
          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
        ),
      ],
    ),
  );
}

void _showLanguageBottomSheet(BuildContext context, MainCubit cubit) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle Bar
            Container(
              width: 50.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),

            SizedBox(height: 20.h),

            // Title
            Text(
              'اختر اللغة',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20.h),

            // Languages
            _buildLanguageOption(
              context,
              cubit,
              '🇸🇦',
              'العربية',
              'Arabic',
              cubit.selectedLangauge == 'العربية',
            ),

            SizedBox(height: 12.h),

            _buildLanguageOption(
              context,
              cubit,
              '🇬🇧',
              'English',
              'الإنجليزية',
              cubit.selectedLangauge == 'English',
            ),

            SizedBox(height: 20.h),
          ],
        ),
      );
    },
  );
}

Widget _buildLanguageOption(
  BuildContext context,
  MainCubit cubit,
  String flag,
  String title,
  String subtitle,
  bool isSelected,
) {
  return InkWell(
    onTap: () {
      cubit.changeLangauge(title);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('تم تغيير اللغة إلى $title'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
        ),
      );
    },
    child: Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xff2749BF).withOpacity(0.1)
            : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isSelected ? const Color(0xff2749BF) : Colors.transparent,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          if (isSelected)
            Icon(
              Icons.check_circle,
              color: const Color(0xff2749BF),
              size: 24.sp,
            ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? const Color(0xff2749BF) : Colors.black87,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                subtitle,
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
            ],
          ),
          SizedBox(width: 12.w),
          Text(flag, style: TextStyle(fontSize: 32.sp)),
        ],
      ),
    ),
  );
}
