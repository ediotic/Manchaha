import 'dart:io';

import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

/// Common Back button used in pages header
class BackButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final Color? color;

  const BackButtonWidget({required this.onPressed, super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        Platform.isIOS ? Icons.arrow_back_ios_new : Icons.arrow_back_rounded,
        color: color ?? AppColors.white,
      ),
    );
  }
}
