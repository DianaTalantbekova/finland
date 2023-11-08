import 'package:finland/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 202.h),
        Image.asset(
          'assets/png/empty_fav.png',
          fit: BoxFit.contain,
          width: 104.w,
          height: 104.h,
        ),
        SizedBox(height: 12.h),
        Text(
          "you haven't saved\nanything yet",
          style: AppStyles.helper4,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
