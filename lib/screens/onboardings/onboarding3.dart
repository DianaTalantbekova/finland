import 'package:finland/resources/app_colors.dart';
import 'package:finland/resources/app_styles.dart';
import 'package:finland/widgets/custom_button1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 29.h),
            Image.asset(
              'assets/png/onboarding3.png',
              fit: BoxFit.cover,
              height: 472.h,
            ),
            SizedBox(height: 26.h),
            Text(
              "Read the news while\ntraveling so you don't miss\nthe most important things",
              style: AppStyles.helper1,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            CustomButton1(
              onTap: () => context.go('/routes'),
              text: 'NEXT',
            ),
            SizedBox(height: 56.h),
          ],
        ),
      ),
    );
  }
}
