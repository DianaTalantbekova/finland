import 'package:finland/managers/finland_route_manager.dart';
import 'package:finland/models/finland_route.dart';
import 'package:finland/widgets/route_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../resources/resources.dart';

class OpenedRoute extends StatelessWidget {
  const OpenedRoute({
    super.key,
    required this.finlandRoute,
  });

  final FinlandRoute finlandRoute;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).viewPadding.top;
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Consumer<FinlandRouteManager>(
          builder: (context, provider, child) {
            return Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(28),
                    bottomLeft: Radius.circular(28),
                  ),
                  child: SizedBox(
                    height: 420.h,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            finlandRoute.asset,
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
                                onTap: () =>
                                    provider.toggleFavorite(finlandRoute),
                                child: Image.asset(
                                  provider.isFavorite(finlandRoute)
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
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Routes',
                          style:
                              AppStyles.helper2.copyWith(color: AppColors.gray),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        finlandRoute.text,
                        style: AppStyles.helper1
                            .copyWith(color: AppColors.darkGray),
                      ),
                      for (var i = 0; i < finlandRoute.content.length; ++i)
                        RouteTextWidget(text: finlandRoute.content[i])
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
