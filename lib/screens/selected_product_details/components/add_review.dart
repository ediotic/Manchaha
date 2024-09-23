import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/global.dart';
import '../../../utils/style/app_styles.dart';
import '../../commons/bottom_button/bottom_button.dart';
import 'view_review.dart';

class AddReviewBottomSheet extends StatefulWidget {
  const AddReviewBottomSheet({super.key});

  @override
  State<AddReviewBottomSheet> createState() => AaddReviewBottomSheetState();
}

class AaddReviewBottomSheetState extends State<AddReviewBottomSheet> {
  late TextEditingController headingCntrl, reviewCntrl;
  late FocusNode headingFocus, reviewFocus;

  @override
  void initState() {
    super.initState();
    headingCntrl = TextEditingController();
    reviewCntrl = TextEditingController();
    headingFocus = FocusNode();
    reviewFocus = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: AppColors.tranparent,
        height: (h * 0.75).h, // Adjusted height using ScreenUtil
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 33.w,
          right: 33.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              // Adjusted padding using ScreenUtil
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.leaveAReview,
                    style: AppStyles.font22.medium.colored(AppColors.black1F),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.6.h, // Adjusted thickness using ScreenUtil
              indent: 28.w,
              endIndent: 27.w,
              color: AppColors.greyE5E,
            ),
            SizedBox(height: 22.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.howWasYourOrder,
                      style:
                          AppStyles.font18.semiBold.colored(AppColors.black06),
                    ),
                    Text(
                      AppStrings.pleaseGiveYourRatingAndYourReview,
                      style: AppStyles.font14.normal.colored(AppColors.grey93),
                    ),
                    SizedBox(height: 13.h),
                    Row(
                      children: List.generate(
                        5,
                        (index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 15.99.w),
                            child: const Icon(
                              Icons.star,
                              color: AppColors.yellow,
                              size: 30.0,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 21.5.h),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border:
                            Border.all(color: AppColors.greyE5E, width: 1.w),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.5.w, top: 12.5.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.headingOfYourReview,
                              style: AppStyles.font12.normal
                                  .colored(AppColors.grey93),
                            ),
                            TextFormField(
                              controller: headingCntrl,
                              focusNode: headingFocus,
                              cursorColor: AppColors.appColor,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppStrings.fantasticProduct,
                                hintStyle: AppStyles.font16.medium
                                    .colored(AppColors.grey6D),
                              ),
                              style: AppStyles.font16.medium
                                  .colored(AppColors.black06),
                            ),
                            SizedBox(height: 10.h)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          border:
                              Border.all(color: AppColors.greyE5E, width: 1.w),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.5.w, top: 12.5.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.writeYourReview,
                              style: AppStyles.font12.normal
                                  .colored(AppColors.grey93),
                            ),
                            TextFormField(
                              controller: reviewCntrl,
                              focusNode: reviewFocus,
                              cursorColor: AppColors.appColor,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppStrings.writeYourReview,
                                hintStyle: AppStyles.font16.medium
                                    .colored(AppColors.grey6D),
                              ),
                              style: AppStyles.font16.medium
                                  .colored(AppColors.black06),
                            ),
                            SizedBox(height: 10.h)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 25.5.h),
                    Image.asset(AppImages.reviewImage),
                    SizedBox(height: 35.h),
                    BottomCommonButton(
                      onPressed: () {
                        dispalyBottomSheett(context);
                      },
                      label: AppStrings.submitReview,
                      labelStyle:
                          AppStyles.font18.medium.colored(AppColors.whiteF9),
                      backgroundColor: AppColors.black1F,
                      height: 65.h,
                      width: 364.w,
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future dispalyBottomSheett(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      barrierColor: AppColors.black0.withOpacity(0.80),
      builder: (context) => const ViewReviewBottomSheet(),
    );
  }
}
