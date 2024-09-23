import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/style/app_styles.dart';

class CardDetailsFields extends StatelessWidget {
  final String hintText; // Hint text for the TextField
  final Color borderColor; // Color of the border
  final Color focusedBorderColor; // Color of the border when focused
  final Color enabledBorderColor; // Color of the border when enabled

  const CardDetailsFields({
    super.key,
    required this.hintText,
    this.borderColor = AppColors.greyC3, // Default color if not provided
    this.focusedBorderColor = AppColors.greyE4, // Default color if not provided
    this.enabledBorderColor = AppColors.greyE4, // Default color if not provided
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyles.font16.normal.colored(AppColors.grey93),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
            width: 1.0,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: focusedBorderColor,
            width: 1.0,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: enabledBorderColor,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
