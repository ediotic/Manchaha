import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/style/app_styles.dart';

class ProfileButton extends StatelessWidget {
  final String imageUrl;
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final Color backgroundColor;

  const ProfileButton({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.icon,
    required this.onTap,
    this.backgroundColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // padding: EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: Row(
          children: [
            // Image
            Image.asset(
              imageUrl,
              width: 19.w,
              height: 21.h,
            ),
            const SizedBox(width: 10),
            // Text
            Expanded(
              child: Text(
                text,
                style: AppStyles.font16.normal.colored(AppColors.grey87),
              ),
            ),
            const SizedBox(width: 10),
            // Icon
            Icon(
              icon,
              size: 19,
              color: AppColors.black1F,
            ),
          ],
        ),
      ),
    );
  }
}
