import 'package:finland/utils/places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/place.dart';
import '../resources/resources.dart';

class PlacesWidget extends StatelessWidget {
  const PlacesWidget({
    super.key,
    required this.place,
    this.onTap,
    this.onFavTap,
    required this.isFavorite,
    this.hasPremium = false,
  });

  final Place place;
  final VoidCallback? onTap;
  final VoidCallback? onFavTap;
  final bool isFavorite;
  final bool hasPremium;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 348.w,
        child: Column(
          children: [
            SizedBox(
              width: 348.w,
              height: 200.h,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        place.asset,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Visibility(
                      visible: place.isPremium && !hasPremium,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/png/premium_linear.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Visibility(
                      visible: place.isPremium && !hasPremium,
                      child: Center(
                        child: Image.asset(
                          'assets/png/icons/lock.png',
                          fit: BoxFit.contain,
                          width: 72.w,
                          height: 72.h,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 24.h,
                    right: 24.w,
                    child: GestureDetector(
                      onTap: onFavTap,
                      child: _buildIcon(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place.name,
                      style:
                          AppStyles.helper4.copyWith(color: AppColors.darkGray),
                    ),
                    Text(
                      place.rating,
                      style: AppStyles.helper2.copyWith(color: AppColors.gray),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Image.asset(
      isFavorite ? 'assets/png/icons/fav1.png' : 'assets/png/icons/fav2.png',
      fit: BoxFit.contain,
      width: 40.w,
      height: 40.h,
    );
  }
}
