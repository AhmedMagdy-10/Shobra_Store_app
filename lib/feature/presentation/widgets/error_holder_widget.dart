import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shobra_store_app/feature/data/model.dart';
import 'package:shobra_store_app/feature/presentation/cubits/main_cubit.dart';

class ErrorHolderWidget extends StatelessWidget {
  const ErrorHolderWidget({
    super.key,
    required this.error,
    required this.cubit,
  });
  final String error;
  final MainCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 60.sp, color: Colors.red),
            SizedBox(height: 16.h),
            Text('حدث خطأ', style: TextStyle(fontSize: 18.sp)),
            SizedBox(height: 8.h),
            Text(
              error,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () => cubit.getAllProducts(),
              child: const Text('حاول مرة أخرى'),
            ),
          ],
        ),
      ),
    );
  }
}
