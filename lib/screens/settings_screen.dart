import 'package:finland/managers/premium_manager.dart';
import 'package:finland/resources/resources.dart';
import 'package:finland/screens/premium_screen.dart';
import 'package:finland/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Consumer(
          builder: (BuildContext context,PremiumManager value, Widget? child) {
            return Column(
              children: [
                SizedBox(height: 17.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Settings',
                      style: AppStyles.helper1.copyWith(color: AppColors.darkGray),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                CustomButton3(
                  onTap: () {},
                  text: 'Privacy policy',
                  asset: 'assets/png/icons/privacy.png',
                ),
                SizedBox(height: 16.h),
                CustomButton3(
                  onTap: () {},
                  text: 'Terms of use',
                  asset: 'assets/png/icons/terms.png',
                ),
                SizedBox(height: 16.h),
                CustomButton3(
                  onTap: () {},
                  text: 'Support',
                  asset: 'assets/png/icons/support.png',
                ),
                SizedBox(height: 16.h),
                CustomButton3(
                  onTap: () {},
                  text: 'Restore purchases',
                  asset: 'assets/png/icons/restore.png',
                ),
                SizedBox(height: 16.h),
                Visibility(
                  visible: !value.isPremium,
                  child: CustomButton3(
                    onTap: () => _onPremiumTap(context),
                    text: 'BUY PREMIUM',
                    asset: 'assets/png/icons/premium.png',
                    isPremium: true,
                  ),
                ),
              ],
            );
          },

        ),
      ),
    );
  }

  _onPremiumTap(BuildContext context) {
    final route = MaterialPageRoute(builder: (BuildContext context) {
      return const PremiumScreen();
    });
    Navigator.of(context, rootNavigator: true).push(route);
  }
}
