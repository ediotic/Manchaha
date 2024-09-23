import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/utils/app_colors.dart';
import 'package:manchaha/utils/style/app_styles.dart';

import '../shimmer/shimmer.dart';
import '../utils/app_strings.dart';
import '../utils/global.dart';

class MyCards extends StatefulWidget {
  const MyCards({
    super.key,
    required this.cardNumber,
    required this.numb,
    required this.expiryMonth,
    required this.expiryYear,
    required this.cardHolderName,
    required this.color,
  });

  final int cardNumber;
  final int numb;
  final int expiryMonth;
  final int expiryYear;
  final String cardHolderName;
  final Color color;

  @override
  State<MyCards> createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false; // Stop loading after 3 seconds
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? CustomShimmer(width: w - 80, height: 200.h)
        : Container(
            width: 320.w, // Applied ScreenUtil for width
            padding: EdgeInsets.all(8.r), // Applied ScreenUtil for padding
            decoration: BoxDecoration(
              color: widget.color, // Use the passed color
              borderRadius: BorderRadius.circular(
                  15.r), // Applied ScreenUtil for borderRadius
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h), // Applied ScreenUtil for height
                Text(widget.cardNumber.toString(),
                    style: AppStyles.font16.bold.colored(AppColors.white)),
                SizedBox(height: 16.h), // Applied ScreenUtil for height
                Text(widget.numb.toString(),
                    style: AppStyles.font9.bold.colored(AppColors.white)),
                SizedBox(height: 16.h), // Applied ScreenUtil for height
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(AppStrings.validThruCaps,
                        style: AppStyles.font8.normal.colored(AppColors.white)),
                    SizedBox(width: 8.w), // Applied ScreenUtil for width
                    Text('${widget.expiryMonth}/${widget.expiryYear}',
                        style: AppStyles.font15.bold.colored(AppColors.white)),
                  ],
                ),
                SizedBox(height: 16.h), // Applied ScreenUtil for height
                Text(widget.cardHolderName,
                    style: AppStyles.font15.bold.colored(AppColors.white)),
              ],
            ),
          );
  }
}
