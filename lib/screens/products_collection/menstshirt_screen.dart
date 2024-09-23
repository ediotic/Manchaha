import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:manchaha/screens/commons/appbar/paymensts_appbar.dart';
import 'package:manchaha/utils/app_colors.dart';
import 'package:manchaha/utils/app_methods.dart';
import 'package:manchaha/utils/app_navigation.dart';
import 'package:manchaha/utils/app_route_names.dart';
import 'package:manchaha/utils/style/app_styles.dart';
import '../../shimmer/shimmer.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../../utils/global.dart';
import '../../utils/mensgrid.dart';

class MensTShirt extends StatefulWidget {
  const MensTShirt({super.key});

  @override
  State<MensTShirt> createState() => _MensTShirtState();
}

class _MensTShirtState extends State<MensTShirt> {
  int isSelectedIndex = -1;
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

  Future sortByBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      barrierColor: Colors.black.withOpacity(0.80),
      builder: (context) => Container(
        height: 400.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r)),
            color: AppColors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(19.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.sortBy,
                    style: AppStyles.font18.semiBold.colored(AppColors.black1E),
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
            InkWell(
              onTap: () => printDebug('1:::tapped'),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 19.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.priceHighToLow,
                  style: AppStyles.font14.normal.colored(AppColors.black1F),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            InkWell(
              onTap: () => printDebug('2:::tapped'),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 19.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.priceLowToHigh,
                  style: AppStyles.font14.normal.colored(AppColors.black1F),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            InkWell(
              onTap: () => printDebug('3:::tapped'),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 19.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.popularity,
                  style: AppStyles.font14.normal.colored(AppColors.black1F),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            InkWell(
              onTap: () => printDebug('4:::tapped'),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 19.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.discount,
                  style: AppStyles.font14.normal.colored(AppColors.black1F),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            InkWell(
              onTap: () => printDebug('5:::tapped'),
              child: Container(
                padding: EdgeInsets.symmetric(
                    // vertical: 12.h,
                    horizontal: 19.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.customerRating,
                  style: AppStyles.font14.normal.colored(AppColors.black1F),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // Appbar starts ---->
      appBar: PaymentsAppBar(
        title: Text(
          AppStrings.mensTShirt,
          style: AppStyles.font24.medium.colored(AppColors.black1F),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: InkWell(
              onTap: () {
                // Handle image tap
                printDebug('Notification image tapped');
              },
              child: Image.asset(
                AppImages.usearch, // Path to your search icon
                height: 23.h,
                color: const Color(0xFF1F2937), // Custom color
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: InkWell(
              onTap: () {
                // Handle image tap
                printDebug('Bag image tapped');
              },
              child: Image.asset(
                AppImages.ubag, // Path to your bag icon
                height: 23.h,
                color: const Color(0xFF1F2937),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),

      // AppBar Ends

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(20.w),
            child: _isLoading
                ? CustomShimmer(
                    width: w,
                    height: 40.h,
                  )
                : Container(
                    alignment: Alignment.center,
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text('15400 items',
                        style:
                            AppStyles.font14.medium.colored(AppColors.black1F)),
                  ),
          ),

          SizedBox(height: 1.h),

          // Grid View for items
          Expanded(
            child: _isLoading
                ? CustomShimmer(
                    width: w,
                    height: 200.h,
                  )
                : Padding(
                    padding: EdgeInsets.only(left: 25.w),
                    child: Container(
                      color: AppColors.white,
                      child: const MensGrid(),
                    ),
                  ),
          ),
        ],
      ),
      // grid view finish

      // Bottom Navigation Bar
      bottomNavigationBar: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                AppNavigation.pushNamed(context, AppRoutes.filterProducts);
                setState(() {
                  isSelectedIndex = 0;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                child: Container(
                  // height: 76.h,
                  color: isSelectedIndex == 0
                      ? const Color(0xFFF6F6F6)
                      : const Color(0xFFFFFFFF),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        AppImages.suffixSearchIcon,
                        fit: BoxFit.none,
                      ),
                      Text(
                        AppStrings.filter,
                        style:
                            AppStyles.font20.normal.colored(AppColors.black1F),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                sortByBottomSheet(context);
                setState(() {
                  isSelectedIndex = 1;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                child: Container(
                  // height: 76.h,
                  color: isSelectedIndex == 1
                      ? const Color(0xFFF6F6F6)
                      : const Color(0xFFFFFFFF),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        AppImages.sortBy,
                        fit: BoxFit.none,
                      ),
                      Text(AppStrings.sortBy,
                          style: AppStyles.font20.normal
                              .colored(AppColors.black1E)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
