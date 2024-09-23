import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckboxWithText extends StatefulWidget {
  final String label;

  const CheckboxWithText({super.key, required this.label});

  @override
  CheckboxWithTextState createState() => CheckboxWithTextState();
}

class CheckboxWithTextState extends State<CheckboxWithText> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24.w, // Adjust checkbox size using ScreenUtil
          height: 24.h,
          child: Checkbox(
            activeColor: const Color(0xFF1163C4),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value ?? false;
              });
            },
          ),
        ),
        SizedBox(width: 8.w), // Space between checkbox and text
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 14.sp, // Font size with ScreenUtil
            fontWeight: FontWeight.w500,
            color: const Color(0xFF333333),
          ),
        ),
      ],
    );
  }
}
