import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/resources.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1({
    super.key,
    this.onTap, required this.text,
  });

  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 348.w,
        height: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.blueAccent,
        ),
        child: Text(
          text,
          style: AppStyles.helper2.copyWith(height: 1.6),
        ),
      ),
    );
  }
}
