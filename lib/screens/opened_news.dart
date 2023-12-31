import 'package:finland/managers/news_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/news.dart';
import '../resources/resources.dart';

class OpenedNews extends StatelessWidget {
  const OpenedNews({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).viewPadding.top;
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Consumer<NewsManager>(
          builder: (context, provider, child) {
            return Column(
              children: [
                SizedBox(
                  height: 304.h,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          news.asset,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 20.w,
                        right: 20.w,
                        top: topPadding + 17.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: context.pop,
                              child: Image.asset(
                                'assets/png/icons/back.png',
                                fit: BoxFit.contain,
                                width: 40.w,
                                height: 40.h,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => provider.toggleFavorite(news),
                              child: Image.asset(
                                provider.isFavorite(news)
                                    ? 'assets/png/icons/fav1.png'
                                    : 'assets/png/icons/fav2.png',
                                fit: BoxFit.contain,
                                width: 40.w,
                                height: 40.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'News',
                          style:
                              AppStyles.helper2.copyWith(color: AppColors.gray),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        news.title,
                        style: AppStyles.helper1
                            .copyWith(color: AppColors.darkGray),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        news.text,
                        style: AppStyles.helper2.copyWith(
                          color: AppColors.darkGray,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: bottomPadding),
              ],
            );
          },
        ),
      ),
    );
  }
}
