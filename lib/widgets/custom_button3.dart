import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/resources.dart';

class CustomButton3 extends StatelessWidget {
  const CustomButton3({
    super.key,
    required this.text,
    required this.asset,
    this.onTap,
    this.isPremium = false,
  });

  final String text;
  final String asset;
  final VoidCallback? onTap;
  final bool isPremium;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 348.w,
        height: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.blueAccent,
          ),
          color: isPremium ? AppColors.blueAccent : Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Image.asset(
                asset,
                fit: BoxFit.contain,
                width: 24.w,
                height: 24.h,
              ),
              SizedBox(width: 8.w),
              Text(
                text,
                style: AppStyles.helper2.copyWith(
                  color: isPremium ? Colors.white : AppColors.blueAccent,
                  height: 1.6,
                ),
              ),
              const Spacer(),
              Image.asset(
                'assets/png/icons/arrow_right.png',
                fit: BoxFit.contain,
                width: 24.w,
                height: 24.h,
                color: isPremium ? Colors.white : AppColors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
