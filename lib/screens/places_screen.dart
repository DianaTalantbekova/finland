import 'package:finland/managers/place_manager.dart';
import 'package:finland/managers/premium_manager.dart';
import 'package:finland/models/place.dart';
import 'package:finland/screens/premium_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../resources/resources.dart';
import '../widgets/widgets.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).viewPadding.top;
    final premiumManager = context.read<PremiumManager>();
    return Material(
      color: Colors.white,
      child: Consumer<PlaceManager>(
        builder: (BuildContext context, provider, Widget? child) {
          return Column(
            children: [
              SizedBox(height: 17.h + topPadding),
              CustomButton2(
                value: provider.selected,
                onChange: provider.onChange,
              ),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'FINLAND',
                    style: AppStyles.helper2.copyWith(color: AppColors.gray),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Places',
                    style:
                        AppStyles.helper1.copyWith(color: AppColors.darkGray),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  children: List.generate(
                    Category.values.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: _buildText(
                        onTap: () => provider.selectCategory(
                          Category.values[index],
                        ),
                        text: Category.values[index].value,
                        selected: Category.values[index] == provider.category,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              if (provider.isEmpty)
                const FavoriteWidget()
              else
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 150),
                    itemCount: provider.actualList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final place = provider.actualList[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 8.h,
                        ),
                        child: PlacesWidget(
                          hasPremium: premiumManager.isPremium,
                          onTap: () {
                            if (place.isPremium && !premiumManager.isPremium) {
                              final route = MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return const PremiumScreen();
                              });
                              Navigator.of(context, rootNavigator: true)
                                  .push(route);
                              return;
                            }
                            context.go(
                                '/places/opened_place?id=${provider.actualList[index].id}');
                          },
                          onFavTap: () => provider.toggleFavorite(place),
                          place: place,
                          isFavorite: provider.isFavorite(place),
                        ),
                      );
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildText({
    bool selected = false,
    required String text,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: AppStyles.helper2
            .copyWith(color: selected ? AppColors.blueAccent : AppColors.gray),
      ),
    );
  }
}
