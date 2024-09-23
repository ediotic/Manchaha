import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/utils/app_colors.dart';
import 'package:manchaha/utils/style/app_styles.dart';

import '../../../../shimmer/shimmer.dart';
import '../../../../utils/global.dart';

class FAQWidget extends StatefulWidget {
  final String question;
  final String answer;

  const FAQWidget({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  State<FAQWidget> createState() => _FAQWidgetState();
}

class _FAQWidgetState extends State<FAQWidget> {
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

  // ignore: unused_field
  bool _customIcon = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyE6),
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: Theme(
            data: ThemeData(
              dividerColor: Colors.transparent,
              hintColor: Colors.transparent,
            ),
            child: _isLoading
                ? CustomShimmer(width: w - 40, height: 100.h)
                : ExpansionTile(
                    title: Text(
                      widget.question,
                      style: AppStyles.font14.medium.colored(AppColors.black1E),
                    ),
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.greyE2.withOpacity(0.20),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40.r),
                            bottomRight: Radius.circular(40.r),
                          ),
                        ),
                        padding: EdgeInsets.all(16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Answer:",
                              style: AppStyles.font12.medium
                                  .colored(AppColors.black1E)
                                  .copyWith(
                                    fontStyle: FontStyle.italic,
                                  ),
                            ),
                            SizedBox(height: 8.w),
                            Text(
                              widget.answer,
                              style: AppStyles.font12.light
                                  .colored(AppColors.grey9C),
                            ),
                          ],
                        ),
                      ),
                    ],
                    onExpansionChanged: (bool expanded) {
                      setState(() {
                        _customIcon = expanded;
                      });
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
