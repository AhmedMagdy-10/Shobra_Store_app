import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shobra_store_app/core/theme/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.color,
    this.isCenter,
  });

  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? color;
  final bool? isCenter;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: double.infinity,
      actionsPadding: EdgeInsets.only(right: 12.w),
      backgroundColor: Color(0xffffffff),
      scrolledUnderElevation: 0,
      title: title,
      centerTitle: isCenter ?? false,
      leading:
          leading ??
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Row(
              children: [
                Image.asset('assets/images/Search.png', color: mainColor),
                SizedBox(width: 12.w),
                Image.asset('assets/images/Bell.png', color: mainColor),
              ],
            ),
          ),
      actions: actions,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
