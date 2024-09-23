import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/utils/app_colors.dart';
import 'package:manchaha/utils/style/app_styles.dart';

class TextWithSeeMore extends StatefulWidget {
  final String text;
  final int maxWords;
  final double fontSize;

  const TextWithSeeMore({
    super.key,
    required this.text,
    this.maxWords = 15,
    required this.fontSize,
  });

  @override
  TextWithSeeMoreState createState() => TextWithSeeMoreState();
}

class TextWithSeeMoreState extends State<TextWithSeeMore> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    List<String> words = widget.text.split(' ');
    bool hasMoreWords = words.length > widget.maxWords;

    String firstPart = hasMoreWords
        ? words.sublist(0, widget.maxWords).join(' ')
        : widget.text;
    String remainingPart =
        hasMoreWords ? words.sublist(widget.maxWords).join(' ') : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: isExpanded ? widget.text : firstPart,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: widget.fontSize.sp, // Applied ScreenUtil here
                  color: AppColors.grey93,
                ),
              ),
              if (hasMoreWords && !isExpanded)
                TextSpan(
                  text: ' See More',
                  style: AppStyles.font11.normal.colored(AppColors.blue52),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      setState(() {
                        isExpanded = true;
                      });
                    },
                ),
            ],
          ),
        ),
        if (isExpanded && remainingPart.isNotEmpty)
          Text(
            remainingPart,
            style: AppStyles.font11.normal.colored(AppColors.blue52),
          ),
      ],
    );
  }
}
