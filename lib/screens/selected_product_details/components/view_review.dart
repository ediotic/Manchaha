import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../components/see_more_text.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/global.dart';
import '../../../utils/style/app_styles.dart';

class ViewReviewBottomSheet extends StatefulWidget {
  const ViewReviewBottomSheet({super.key});

  @override
  State<ViewReviewBottomSheet> createState() => _ViewReviewBottomSheetState();
}

class _ViewReviewBottomSheetState extends State<ViewReviewBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (h * 0.65).h, // Adjusted height using ScreenUtil
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.ratingAndReviews,
                  style: AppStyles.font22.medium.colored(AppColors.black1F),
                ),
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.6.h,
            indent: 20.w,
            endIndent: 20.w,
            color: AppColors.greyE5E,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      color: AppColors.white,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: CircleAvatar(
                                  radius: 35.r,
                                  backgroundColor: AppColors.white,
                                  child: ClipOval(
                                    child: Image.asset(
                                      AppImages.icon1,
                                      fit: BoxFit.cover,
                                      width: 70.w,
                                      height: 70.h,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lorem Ispum',
                                    style: AppStyles.font14.medium
                                        .colored(const Color(0xFF060606)),
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWithSeeMore(
                                          text:
                                              'Lorem ipsum dolor sit amet consectetur adipisicing elit. .',
                                          fontSize: 12.sp,
                                        ),
                                        SizedBox(height: 8.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: List.generate(
                                            5,
                                            (index) => Padding(
                                              padding:
                                                  EdgeInsets.only(right: 4.w),
                                              child: Icon(
                                                Icons.star,
                                                size: 14.sp,
                                                color: AppColors.yellow,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 0.6.h,
                  indent: 20.w,
                  endIndent: 20.w,
                  color: const Color(0xFFE5E7EB),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
