import 'package:finland/managers/finland_route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/resources.dart';

class CustomButton2 extends StatelessWidget {
  const CustomButton2({
    super.key,
    required this.value,
    this.onChange,
  });

  final RouteSortType value;
  final void Function(RouteSortType value)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 184.w,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.lightBlue,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildButton(
              selected: value == RouteSortType.all,
              onTap: () => onChange?.call(RouteSortType.all),
              text: 'All',
            ),
            _buildButton(
              selected: value == RouteSortType.favorite,
              onTap: () => onChange?.call(RouteSortType.favorite),
              text: 'Favorite',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    VoidCallback? onTap,
    required String text,
    bool selected = true,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 80.w,
        height: 32.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: selected ? AppColors.blueAccent : Colors.transparent,
        ),
        child: Text(
          text,
          style: AppStyles.helper2.copyWith(
            height: 1.2,
            fontSize: 13.r,
            color: selected ? Colors.white : AppColors.blueAccent,
          ),
        ),
      ),
    );
  }
}
