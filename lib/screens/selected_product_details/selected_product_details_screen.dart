import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/new_grid.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_methods.dart';
import '../../utils/app_navigation.dart';
import '../../utils/app_route_names.dart';
import '../../utils/app_strings.dart';
import '../../utils/global.dart';
import '../../utils/style/app_styles.dart';
import 'components/add_review.dart';
import 'components/view_review.dart';

class SelectedProduct extends StatefulWidget {
  final String image;
  final String productName;
  final Widget details;

  const SelectedProduct({
    super.key,
    required this.image,
    required this.productName,
    required this.details,
  });

  @override
  State<SelectedProduct> createState() => _SelectedProductState();
}

class _SelectedProductState extends State<SelectedProduct> {
  int isSelectedIndex = -1;
  int isSelectedIndexx = -1;
  int isSelectedIndexxx = -1;
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
    Future dispalyBottomSheett(BuildContext context) {
      return showModalBottomSheet(
        context: context,
        backgroundColor: AppColors.white,
        barrierColor: AppColors.black0.withOpacity(0.80),
        builder: (context) => const ViewReviewBottomSheet(),
      );
    }

    Future addReviewBottomSheet(BuildContext context) {
      return showModalBottomSheet(
        context: context,
        barrierColor: AppColors.black0.withOpacity(0.80),
        builder: (context) => const AddReviewBottomSheet(),
      );
    }

// body start

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 10,
        surfaceTintColor: Colors.transparent,
        shadowColor: const Color(0xFF000000).withOpacity(0.2),
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: AppColors.black1F),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: InkWell(
              onTap: () {
                printDebug('Notification image tapped');
              },
              child: Image.asset(
                AppImages.likeicon,
                height: 23.h,
                color: AppColors.black1F,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: InkWell(
              onTap: () {
                printDebug('Option image tapped');
              },
              child: Image.asset(
                AppImages.optionicon,
                height: 23.h,
                color: AppColors.black1F,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: InkWell(
              onTap: () {
                printDebug('Bag image tapped');
              },
              child: Image.asset(
                AppImages.ubag,
                height: 23.h,
                color: AppColors.black1F,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 355.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.productName,
                      style:
                          AppStyles.font18.medium.colored(AppColors.black30)),
                  SizedBox(height: 16.h),
                  widget.details,
                  SizedBox(height: 16.h), // Updated spacing
                  Text(AppStrings.colorColon,
                      style:
                          AppStyles.font16.semiBold.colored(AppColors.black1E)),
                  SizedBox(height: 3.h),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelectedIndex = 0;
                          });
                        },
                        child: Container(
                          height: 26.h,
                          width: 52.w,
                          decoration: BoxDecoration(
                            color: isSelectedIndex == 0
                                ? const Color(0xFF4A90E2)
                                : const Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Center(
                            child: Text(
                              'Black',
                              style: AppStyles.font12.light.colored(
                                isSelectedIndex == 0
                                    ? const Color(0xFFF0F0F0)
                                    : const Color(0xFF1B1A1A),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w), // Added spacing
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelectedIndex = 1;
                          });
                        },
                        child: Container(
                          height: 26.h,
                          width: 52.w,
                          decoration: BoxDecoration(
                            color: isSelectedIndex == 1
                                ? const Color(0xFF4A90E2)
                                : const Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Center(
                            child: Text(
                              'White', // Updated color option
                              style: AppStyles.font12.light.colored(
                                isSelectedIndex == 1
                                    ? const Color(0xFFF0F0F0)
                                    : const Color(0xFF1B1A1A),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w), // Added spacing
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelectedIndex = 2;
                          });
                        },
                        child: Container(
                          height: 26.h,
                          width: 52.w,
                          decoration: BoxDecoration(
                            color: isSelectedIndex == 2
                                ? const Color(0xFF4A90E2)
                                : const Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Center(
                            child: Text(
                              'Blue', // Updated color option
                              style: AppStyles.font12.light.colored(
                                isSelectedIndex == 2
                                    ? const Color(0xFFF0F0F0)
                                    : const Color(0xFF1B1A1A),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w), // Added spacing
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelectedIndex = 3;
                          });
                        },
                        child: Container(
                          height: 26.h,
                          width: 52.w,
                          decoration: BoxDecoration(
                            color: isSelectedIndex == 3
                                ? const Color(0xFF4A90E2)
                                : const Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Center(
                            child: Text(
                              'Grey', // Updated color option
                              style: AppStyles.font12.light.colored(
                                isSelectedIndex == 3
                                    ? const Color(0xFFF0F0F0)
                                    : const Color(0xFF1B1A1A),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w), // Added spacing
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelectedIndex = 4;
                          });
                        },
                        child: Container(
                          height: 26.h,
                          width: 52.w,
                          decoration: BoxDecoration(
                            color: isSelectedIndex == 4
                                ? const Color(0xFF4A90E2)
                                : const Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Center(
                            child: Text(
                              'Brown', // Updated color option
                              style: AppStyles.font12.light.colored(
                                isSelectedIndex == 4
                                    ? const Color(0xFFF0F0F0)
                                    : const Color(0xFF1B1A1A),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(AppStrings.sizeColon,
                      style:
                          AppStyles.font16.semiBold.colored(AppColors.black1E)),
                  SizedBox(height: 3.h),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelectedIndexx = 5;
                          });
                        },
                        child: Container(
                          height: 36.h,
                          width: 38.w,
                          decoration: BoxDecoration(
                            color: isSelectedIndexx == 5
                                ? const Color(0xFF4A90E2)
                                : const Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Center(
                            child: Text(
                              'S',
                              style: AppStyles.font12.light.colored(
                                isSelectedIndex == 5
                                    ? const Color(0xFFF0F0F0)
                                    : const Color(0xFF1F2937),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w), // Added spacing
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelectedIndexx = 6;
                          });
                        },
                        child: Container(
                          height: 36.h,
                          width: 38.w,
                          decoration: BoxDecoration(
                            color: isSelectedIndexx == 6
                                ? const Color(0xFF4A90E2)
                                : const Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Center(
                            child: Text(
                              'M',
                              style: AppStyles.font12.light.colored(
                                isSelectedIndex == 6
                                    ? const Color(0xFFF0F0F0)
                                    : const Color(0xFF1F2937),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w), // Added spacing
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelectedIndexx = 7;
                          });
                        },
                        child: Container(
                          height: 36.h,
                          width: 38.w,
                          decoration: BoxDecoration(
                            color: isSelectedIndexx == 7
                                ? const Color(0xFF4A90E2)
                                : const Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Center(
                            child: Text(
                              'L',
                              style: AppStyles.font12.light.colored(
                                isSelectedIndex == 7
                                    ? const Color(0xFFF0F0F0)
                                    : const Color(0xFF1F2937),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w), // Added spacing
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelectedIndexx = 8;
                          });
                        },
                        child: Container(
                          height: 36.h,
                          width: 38.w,
                          decoration: BoxDecoration(
                            color: isSelectedIndexx == 8
                                ? const Color(0xFF4A90E2)
                                : const Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Center(
                            child: Text(
                              'XL',
                              style: AppStyles.font12.light.colored(
                                isSelectedIndex == 8
                                    ? const Color(0xFFF0F0F0)
                                    : const Color(0xFF1F2937),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w), // Added spacing
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelectedIndexx = 9;
                          });
                        },
                        child: Container(
                          height: 36.h,
                          width: 42.w,
                          decoration: BoxDecoration(
                            color: isSelectedIndexx == 9
                                ? const Color(0xFF4A90E2)
                                : const Color(0xFFF0F0F0),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Center(
                            child: Text(
                              'XXL',
                              style: AppStyles.font12.light.colored(
                                isSelectedIndex == 9
                                    ? const Color(0xFFF0F0F0)
                                    : const Color(0xFF1F2937),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    height: 50.h,
                    color: const Color(0xFFFFFFFF),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isSelectedIndexxx = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.description,
                                style: AppStyles.font12.light.colored(
                                  isSelectedIndexxx == 0
                                      ? const Color(0xFF4A90E2)
                                      : const Color(0xFF9191A5),
                                ),
                              ),
                              if (isSelectedIndexxx ==
                                  0) // Add underline if selected
                                Container(
                                  margin: EdgeInsets.only(top: 3.h),
                                  height: 2.h,
                                  width: 90.w,
                                  color: const Color(0xFF4A90E2),
                                ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isSelectedIndexxx = 1;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.specifications,
                                style: AppStyles.font12.light.colored(
                                  isSelectedIndexxx == 1
                                      ? const Color(0xFF4A90E2)
                                      : const Color(0xFF9191A5),
                                ),
                              ),
                              if (isSelectedIndexxx ==
                                  1) // Add underline if selected
                                Container(
                                  margin: EdgeInsets.only(top: 3.h),
                                  height: 2.h,
                                  width: 100.w,
                                  color: const Color(0xFF4A90E2),
                                ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isSelectedIndexxx = 2;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.moreInfo,
                                style: AppStyles.font12.light.colored(
                                  isSelectedIndexxx == 2
                                      ? const Color(0xFF4A90E2)
                                      : const Color(0xFF9191A5),
                                ),
                              ),
                              if (isSelectedIndexxx ==
                                  2) // Add underline if selected
                                Container(
                                  margin: EdgeInsets.only(top: 3.h),
                                  height: 2.h,
                                  width: 70.w,
                                  color: const Color(0xFF4A90E2),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: AppColors.white,
                    child: Text(
                        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Autem quia perspiciatis, architecto maiores saepe excepturi nostrum explicabo, voluptatibus drum fuga rem dicta iusto. Minus veritatis incidunt corporis consectetur dignissimos.oloribus ha architecto maiores saepe excepturi nostrum explicabo, voluptatibus drum fuga rem dicta iusto. Minus veritatis incidunt corporis consectetur dignissimos.oloribus ha iusto. Minus veritatis incidunt corporis.',
                        style:
                            AppStyles.font13.normal.colored(AppColors.grey93)),
                  ),
                  SizedBox(
                    height: 38.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFDBDEFF).withOpacity(0.25.h),
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(
                          16.0.h), // Adding padding to the content
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Aligning text to the start
                        children: [
                          Text(
                            AppStrings.productDetails,
                            style: AppStyles.font16.medium
                                .colored(AppColors.black1E),
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              children: [
                                Text(
                                  '\u2022',
                                  style: TextStyle(
                                    color: const Color(0xFF6B7280),
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  AppStrings.fabric,
                                  style: AppStyles.font14.normal
                                      .colored(AppColors.grey9C),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text('    - Cotton',
                                    style: AppStyles.font14.normal
                                        .colored(AppColors.black1E)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              children: [
                                Text(
                                  '\u2022',
                                  style: TextStyle(
                                    color: const Color(0xFF6B7280),
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  AppStrings.length,
                                  style: AppStyles.font14.normal
                                      .colored(AppColors.grey9C),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  '   - Regular',
                                  style: AppStyles.font14.normal
                                      .colored(AppColors.black1E),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              children: [
                                Text(
                                  '\u2022',
                                  style: TextStyle(
                                    color: const Color(0xFF6B7280),
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  AppStrings.neck,
                                  style: AppStyles.font14.normal
                                      .colored(AppColors.grey9C),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text('      - Round Neck',
                                    style: AppStyles.font14.normal
                                        .colored(AppColors.black1E)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              children: [
                                Text(
                                  '\u2022',
                                  style: TextStyle(
                                    color: const Color(0xFF6B7280),
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  AppStrings.pattern,
                                  style: AppStyles.font14.normal
                                      .colored(AppColors.grey9C),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text('  - Graphic printDebug',
                                    style: AppStyles.font14.normal
                                        .colored(AppColors.black1E)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Divider(
                            thickness: 0.6.h,
                            color: const Color(0xFFE5E7EB),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  AppStrings.viewMore,
                                  style: TextStyle(
                                    color: Color(0xFF4A90E2),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14.sp,
                                  color: const Color(0xFF4A90E2),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  gapH(20.h),
                  Text(
                    AppStrings.ratingAndReviews,
                    style: AppStyles.font16.medium.colored(AppColors.black1E),
                  ),
                  gapH(20.h),
                  Divider(
                    thickness: 0.6.h,
                    height: 0.h,
                    indent: 9.w,
                    endIndent: 9.w,
                    color: const Color(0xFFE5E7EB),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 22.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text.rich(
                              TextSpan(
                                text: '4.8',
                                style: AppStyles.font28.semiBold
                                    .colored(AppColors.black1E),
                                children: [
                                  TextSpan(
                                    text: '/',
                                    style: AppStyles.font22.semiBold
                                        .colored(AppColors.grey9C),
                                  ),
                                  TextSpan(
                                    text: '5',
                                    style: AppStyles.font28.semiBold
                                        .colored(AppColors.grey9C),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 18.73.w),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.overallRating,
                                  style: AppStyles.font16.medium
                                      .colored(AppColors.black1E),
                                ),
                                Text(
                                  '456 Rating',
                                  style: AppStyles.font13.normal
                                      .colored(AppColors.grey9C),
                                ),
                              ],
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            addReviewBottomSheet(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.appColor,
                              borderRadius: BorderRadius.circular(40.r),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 3),
                                  blurRadius: 6.r,
                                  spreadRadius: 0.r,
                                  color: AppColors.black0.withOpacity(0.16),
                                )
                              ],
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 11.h, horizontal: 36.w),
                            child: Text(
                              AppStrings.add,
                              style: AppStyles.font16.medium.colored(
                                  AppColors.white), // Set text color to white
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 0.6.h,
                    indent: 9.w,
                    endIndent: 9.h,
                    color: const Color(0xFFE5E7EB),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          dispalyBottomSheett(context);
                        },
                        child: Text('View All 46 Ratings',
                            style: AppStyles.font15.normal
                                .colored(AppColors.appColor)),
                      ),
                      IconButton(
                        onPressed: () {
                          dispalyBottomSheett(context);
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 14.sp,
                          color: AppColors.appColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.youMayLike,
                          style: AppStyles.font18.semiBold
                              .colored(AppColors.black1E)),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Text(
                                  AppStrings.viewAll,
                                  style: AppStyles.font15.normal
                                      .colored(AppColors.grey6B),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.grey6B,
                                  size: 12.sp,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  // Grid View for items
                  Container(
                    height: 240.h,
                    width: double.infinity,
                    color: AppColors.white,
                    child: const NewGrid(),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: (w * 90).w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF1F6),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment
                                .center, // Center the text horizontally
                            children: [
                              Text(
                                AppStrings.totalPrice,
                                style: AppStyles.font12.normal
                                    .colored(AppColors.grey6B),
                              ),
                              Text(
                                '850\u{20B9}',
                                style: AppStyles.font20.bold
                                    .colored(AppColors.black1F),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                AppNavigation.pushNamed(
                                    context, AppRoutes.myCart);
                              },
                              child: Container(
                                height: 54.h,
                                width: 200.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4A90E2),
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppImages.bag,
                                      height: 16.h,
                                      width: 15.w,
                                      color: AppColors.white,
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      AppStrings.bag,
                                      style: AppStyles.font18.medium
                                          .colored(AppColors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
