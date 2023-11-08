import 'package:finland/models/place.dart';
import 'package:finland/widgets/route_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../resources/resources.dart';

class OpenedPlace extends StatelessWidget {
  const OpenedPlace({
    super.key,
    required this.place,
  });

  final Place place;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).viewPadding.top;
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(28),
                bottomLeft: Radius.circular(28),
              ),
              child: SizedBox(
                height: 304.h,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        place.asset,
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
                          Image.asset(
                            'assets/png/icons/fav2.png',
                            fit: BoxFit.contain,
                            width: 40.w,
                            height: 40.h,
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
                      style: AppStyles.helper2.copyWith(color: AppColors.gray),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    place.name,
                    style:
                    AppStyles.helper1.copyWith(color: AppColors.darkGray),
                  ),
                  for (var i = 0; i < place.content.length; ++i)
                    RouteTextWidget(text: place.content[i])
                ],
              ),
            ),
            SizedBox(height: bottomPadding),
          ],
        ),
      ),
    );
  }
}
