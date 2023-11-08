import 'package:apphud/apphud.dart';
import 'package:finland/main.dart';
import 'package:finland/managers/premium_manager.dart';
import 'package:finland/resources/resources.dart';
import 'package:finland/screens/premium_screen.dart';
import 'package:finland/utils/links.dart';
import 'package:finland/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
                  onTap: () => launchUri(Links.privacyPolicy),
                  text: 'Privacy policy',
                  asset: 'assets/png/icons/privacy.png',
                ),
                SizedBox(height: 16.h),
                CustomButton3(
                  onTap: () => launchUri(Links.termsOfUse),
                  text: 'Terms of use',
                  asset: 'assets/png/icons/terms.png',
                ),
                SizedBox(height: 16.h),
                CustomButton3(
                  onTap: () => launchUri(Links.support),
                  text: 'Support',
                  asset: 'assets/png/icons/support.png',
                ),
                SizedBox(height: 16.h),
                CustomButton3(
                  onTap: _onRestore,
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

  void _onRestore() async {
    final provider = Provider.of<PremiumManager>(context, listen: false);
    final res = await Apphud.restorePurchases();
    if (res.purchases.map((e) => e.isActive).contains(true)) {
      provider.onBuyPremium();
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }
}
