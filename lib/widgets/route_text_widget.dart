import 'package:finland/models/finland_route.dart';
import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_styles.dart';

class RouteTextWidget extends StatelessWidget {
  const RouteTextWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ' \u2022 ',
          style: AppStyles.helper2.copyWith(color: AppColors.darkGray),
        ),
        Flexible(
          child: Text(
            text,
            style: AppStyles.helper2.copyWith(color: AppColors.darkGray),
          ),
        ),
      ],
    );
  }
}
