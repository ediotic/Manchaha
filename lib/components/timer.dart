import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/style/app_styles.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({super.key});

  @override
  CountdownTimerState createState() => CountdownTimerState();
}

class CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  Duration _duration =
      const Duration(hours: 12); // Set your countdown duration here

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_duration.inSeconds > 0) {
          _duration = _duration - const Duration(seconds: 1);
        } else {
          _timer.cancel();
        }
      });
    });
  }
@override
Widget build(BuildContext context) {
  final hours = _duration.inHours;
  final minutes = _duration.inMinutes % 60;
  final seconds = _duration.inSeconds % 60;

  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(width: 10.w),
      Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$hours',
              style: AppStyles.font16.semiBold.colored(AppColors.black1E),
            ),
            TextSpan(
              text: ' ${AppStrings.hrsCaps} ',
              style: AppStyles.font9.semiBold.colored(AppColors.appColor),
            ),
            TextSpan(
              text: '$minutes',
              style: AppStyles.font16.semiBold.colored(AppColors.black1E),
            ),
            TextSpan(
              text: ' ${AppStrings.minCaps} ',
              style: AppStyles.font9.semiBold.colored(AppColors.appColor),
            ),
            TextSpan(
              text: '$seconds',
              style: AppStyles.font16.semiBold.colored(AppColors.black1E),
            ),
            TextSpan(
              text: ' ${AppStrings.secCaps}',
              style: AppStyles.font9.semiBold.colored(AppColors.appColor),
            ),
          ],
        ),
      ),
    ],
  );
}


  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
