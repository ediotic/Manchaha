import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/app_colors.dart';
import 'back_button.dart';

// app bar
class OnboardingAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final bool centerTitle;
  final double elevation;
  final Color? bgColor;
  final SystemUiOverlayStyle? systemOverlayStyle;

  const OnboardingAppBar({
    super.key,
    this.title = const SizedBox.shrink(),
    this.actions,
    this.elevation = 0,
    this.bgColor,
    this.centerTitle = true,
    this.systemOverlayStyle,
  });

  @override
  State<OnboardingAppBar> createState() => _OnboardingAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(100.0.h);
}

class _OnboardingAppBarState extends State<OnboardingAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: context.canPop()
          ? BackButtonWidget(
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                }
              },
              color: AppColors.white,
            )
          : null,
      titleSpacing: 0,
      elevation: widget.elevation,
      backgroundColor: widget.bgColor ?? AppColors.appColor,
      surfaceTintColor: AppColors.tranparent,
      centerTitle: true,
      automaticallyImplyLeading: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
      ),
      title: widget.title,
      actions: widget.actions,
      systemOverlayStyle: widget.systemOverlayStyle ??
          const SystemUiOverlayStyle(
            statusBarColor: AppColors.appColor,
            statusBarIconBrightness: Brightness.light,
          ),
      // bottom: PreferredSize(
      //   preferredSize: Size.fromHeight(50.h),
      //   child: const SizedBox(),
      // ),
    );
  }
}
