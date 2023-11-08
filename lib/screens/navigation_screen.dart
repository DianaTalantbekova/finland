import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../models/image_item.dart';
import '../resources/resources.dart';
import '../utils/image_items.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({
    Key? key,
    required this.child,
    // required this.preferenceService,
  }) : super(key: key);
  final Widget child;

  // final PreferenceService preferenceService;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    return Material(
      child: Stack(
        children: [
          Positioned.fill(child: widget.child),
          Positioned(
            bottom: bottomPadding + 10.h,
            left: 20.w,
            right: 20.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              height: 80.h,
              width: 348.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColors.blue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  imageItems.length,
                      (index) {
                    final item = imageItems[index];
                    return _buildNavigationBarItem(
                      imageItem: item,
                      selected: index == _selected,
                      onTap: () {
                        _selected = index;
                        context.go(item.path);
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationBarItem({
    required ImageItem imageItem,
    bool selected = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: SizedBox(
          width: 48.w,
          height: 48.w,
          child: Image.asset(
            imageItem.asset,
            fit: BoxFit.cover,
            color: selected ? Colors.white : AppColors.blueAccent,
          ),
        ),
      ),
    );
  }
}
