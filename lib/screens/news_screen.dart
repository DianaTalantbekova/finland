import 'package:finland/managers/news_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../resources/resources.dart';
import '../widgets/widgets.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).viewPadding.top;
    return Material(
      color: Colors.white,
      child: Consumer<NewsManager>(
        builder: (context, provider, child) {
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
                    'News',
                    style:
                        AppStyles.helper1.copyWith(color: AppColors.darkGray),
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
                    final news = provider.actualList[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      child: NewsWidget(
                        onTap: () => context.go(
                            '/news/opened_news?id=${provider.actualList[index].id}'),
                        onFavTap: () => provider.toggleFavorite(news),
                        news: news,
                        isFavorite: provider.isFavorite(news),
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
}
