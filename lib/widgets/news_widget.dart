import 'package:finland/utils/news.dart';
import 'package:finland/utils/places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/news.dart';
import '../resources/resources.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key, required this.news, this.onTap, this.onFavTap, required this.isFavorite});

  final News news;
  final VoidCallback? onTap;
  final VoidCallback? onFavTap;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 348.w,
        child: Column(
          children: [
            SizedBox(
              width: 347.w,
              height: 164.h,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        news.asset,
                        fit: BoxFit.cover,
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
            SizedBox(height: 8.h),
            Text(
              news.title,
              maxLines: 2,
              style:
                  AppStyles.helper4.copyWith(color: AppColors.darkGray),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4.h),
            Text(
              news.text,
              maxLines: 2,
              style: AppStyles.helper2.copyWith(
                color: AppColors.darkGray,
                fontSize: 13.r,
              ),
              overflow: TextOverflow.ellipsis,
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
