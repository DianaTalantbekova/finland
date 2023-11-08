import 'package:finland/models/finland_route.dart';
import 'package:finland/utils/finland_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/resources.dart';

class RouteWidget extends StatelessWidget {
  const RouteWidget({
    super.key,
    required this.finlandRoute,
    this.onTap,
    this.onFavTap,
    this.isFavorite = false,
  });

  final FinlandRoute finlandRoute;
  final VoidCallback? onTap;
  final VoidCallback? onFavTap;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: SizedBox(
          width: 348.w,
          height: 464.h,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  finlandRoute.asset,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Image.asset(
                  'assets/png/routes/linear.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 24.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: onFavTap,
                          child: _buildIcon(),
                        ),
                      ),
                      Text(
                        finlandRoute.text,
                        style: AppStyles.helper3,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
