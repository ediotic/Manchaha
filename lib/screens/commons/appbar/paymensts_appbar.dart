import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: unused_import
import 'package:go_router/go_router.dart';

import '../../../../utils/app_colors.dart';
import '../../../utils/global.dart';
import '../../onboarding/components/back_button.dart';

class PaymentsAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double appBarHeight;
  final Widget? title;
  final List<Widget>? actions;
  final bool centerTitle;
  final double elevation;
  final Color? bgColor;
  final bool automaticallyImplyLeading;
  final bool showBackButton;
  final Color? leadingIconColor;
  final ShapeBorder? shape;
  final Color? shadowColor;

  const PaymentsAppBar({
    super.key,
    this.appBarHeight = 0.06,
    this.title = const SizedBox.shrink(),
    this.actions,
    this.elevation = 4.0, // Increased elevation for shadow visibility
    this.bgColor,
    this.centerTitle = true,
    this.automaticallyImplyLeading = false,
    this.showBackButton = true,
    this.leadingIconColor,
    this.shape,
    this.shadowColor,
  });

  @override
  State<PaymentsAppBar> createState() => _PaymentsAppBarState();

  @override
  Size get preferredSize => Size.fromHeight((h * appBarHeight).h);
  // 0.09
}

class _PaymentsAppBarState extends State<PaymentsAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: BackButtonWidget(
      //   onPressed: () {
      //     if (Navigator.of(context).canPop()) {
      //       Navigator.of(context).pop();
      //     }
      //   },
      //   color: widget.leadingIconColor ?? AppColors.black0,
      // ),
      leading: widget.showBackButton &&
              (Navigator.of(context).canPop() ||
                  widget.automaticallyImplyLeading)
          ? BackButtonWidget(
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
              color: widget.leadingIconColor ?? AppColors.black0,
            )
          : null,
      titleSpacing: 0,
      elevation: widget.elevation,
      backgroundColor: widget.bgColor ?? AppColors.white,
      surfaceTintColor: AppColors.tranparent,
      centerTitle: widget.centerTitle,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      shadowColor: widget.shadowColor ?? AppColors.black0,
      title: widget.title,
      actions: widget.actions,
    );
  }
}
