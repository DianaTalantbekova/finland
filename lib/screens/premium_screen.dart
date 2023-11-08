import 'package:finland/widgets/custom_button1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../managers/premium_manager.dart';
import '../resources/resources.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  bool purchaseLoading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 17.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Premium',
                      style:
                          AppStyles.helper1.copyWith(color: AppColors.darkGray),
                    ),
                    GestureDetector(
                      onTap: context.pop,
                      child: Image.asset(
                        'assets/png/icons/close.png',
                        fit: BoxFit.contain,
                        width: 32.w,
                        height: 32.h,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Restore purchases',
                      style: AppStyles.helper2.copyWith(
                        color: AppColors.blueAccent,
                        fontSize: 13.r,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Image.asset(
                'assets/png/premium_png.png',
                fit: BoxFit.cover,
                height: 340.h,
              ),
              SizedBox(height: 24.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildText(text: '1. Access to all the locations'),
                  _buildText(text: '2. No advertising'),
                  _buildText(text: '3. Unlimited number of places to save'),
                ],
              ),
              SizedBox(height: 48.h),
              CustomButton1(
                onTap: _onBuyPremium,
                text: 'BUY PREMIUM',
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Privacy policy',
                      style: AppStyles.helper2.copyWith(
                        fontSize: 13.r,
                        color: AppColors.blueAccent,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Terms of use',
                      style: AppStyles.helper2.copyWith(
                        fontSize: 13.r,
                        color: AppColors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText({required String text}) {
    return Text(
      text,
      style: AppStyles.helper2.copyWith(
        color: AppColors.blueAccent,
        fontSize: 19.r,
        height: 1.8,
      ),
    );
  }

  void _onBuyPremium() async {
    final provider = Provider.of<PremiumManager>(context, listen: false);
    provider.onBuyPremium();
    context.pop();
  }
}
