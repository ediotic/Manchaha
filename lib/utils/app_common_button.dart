import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/utils/style/app_styles.dart';

import '../../../utils/app_colors.dart';

// custom app button
class AppCommonButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? label;
  final Widget? suffix;
  final Widget? prefix;
  final Color? buttonColor;
  final bool? enabled;
  final TextStyle? labelStyle;
  final double? txtFontSize;
  final EdgeInsetsGeometry? margin;
  final bool? showShadow;
  final bool? isLoading;

  const AppCommonButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.suffix,
    this.prefix,
    this.buttonColor,
    this.enabled = true,
    this.labelStyle,
    this.txtFontSize,
    this.margin,
    this.showShadow,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled! ? onPressed : null,
      child: Container(
        margin: margin ?? const EdgeInsets.all(0),
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        height: 65.h,
        decoration:
            ((enabled ?? true) && (showShadow ?? true)) ? decoration() : null,
        child: buttonContent(),
      ),
    );
  }

  Row buttonContent() {
    return Row(
      mainAxisAlignment: suffix != null
          ? MainAxisAlignment.spaceAround
          : MainAxisAlignment.center,
      children: isLoading ?? false
          ? [const CircularProgressIndicator(color: AppColors.appColor)]
          : [
              prefix == null ? const SizedBox.shrink() : prefix!,
              Text(
                label!,
                style: labelStyle ??
                    AppStyles.font16.medium.colored(AppColors.whiteF9),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              suffix == null ? const SizedBox.shrink() : suffix!,
            ],
    );
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }

  BoxDecoration decoration() {
    return BoxDecoration(
      color: enabled!
          ? (buttonColor ?? AppColors.appColor)
          : (buttonColor ?? AppColors.grey50),
      borderRadius: BorderRadius.circular(50.r),
      boxShadow: [
        BoxShadow(
          color: AppColors.black0.withOpacity(0.1),
          spreadRadius: 0.r,
          blurRadius: 15.r,
          offset: const Offset(0, 5),
        ),
      ],
    );
  }
}
