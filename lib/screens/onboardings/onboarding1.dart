import 'package:finland/resources/app_colors.dart';
import 'package:finland/resources/app_styles.dart';
import 'package:finland/widgets/custom_button1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 29.h),
            Image.asset(
              'assets/png/onboarding1.png',
              fit: BoxFit.cover,
              height: 472.h,
            ),
            SizedBox(height: 26.h),
            Text(
              'We have selected for you the most popular routes',
              style: AppStyles.helper1,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            CustomButton1(
              onTap: () => context.go('/onboarding2'),
              text: 'NEXT',
            ),
            SizedBox(height: 56.h),
          ],
        ),
      ),
    );
  }
}
