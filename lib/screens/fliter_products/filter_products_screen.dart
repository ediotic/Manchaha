import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:manchaha/utils/app_colors.dart';
import 'package:manchaha/utils/app_methods.dart';
import 'package:manchaha/utils/app_navigation.dart';
import 'package:manchaha/utils/app_route_names.dart';
import 'package:manchaha/utils/style/app_styles.dart';

import '../../components/check_box.dart';
import '../../utils/app_strings.dart';

class FilterProducts extends StatefulWidget {
  const FilterProducts({super.key});

  @override
  State<FilterProducts> createState() => _FilterProductsState();
}

class _FilterProductsState extends State<FilterProducts> {
  int isSelectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context);

    return Scaffold(
      backgroundColor: AppColors.white,

      // Appbar starts ---->
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 10,
        surfaceTintColor:
            AppColors.tranparent,
        shadowColor: AppColors.black0.withOpacity(0.2),
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            printDebug('ye press');
          },
          icon:  GestureDetector(
            onTap: () {
               context.pop();                 // not working properly
            },
            child: Icon(Icons.close , size: 35.h, color: AppColors.grey6D,)),
        ),
        title: Text(
          AppStrings.filter,
          style: AppStyles.font24.medium.colored(AppColors.black1F)
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(10.w),
            child: TextButton(
              onPressed: () {
                AppNavigation.pushNamed(context, AppRoutes.filterProducts);
              },
              child: Text(
                AppStrings.clearAll,
                style: AppStyles.font14.normal.colored(AppColors.appColor),
              ),
            ),
          ),
        ],
      ),
      // AppBar Ends

      // body start
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectedIndex = 0;
                    });
                  },
                  child: Container(
                    height: 70.h,
                    // Use ScreenUtil for height
                    width: 150.w,
                    // Use ScreenUtil for width
                    decoration: BoxDecoration(
                      color: isSelectedIndex == 0
                          ? AppColors.white
                          : AppColors.greyF1,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      AppStrings.brand,
                      style: AppStyles.font14.normal.colored(AppColors.black1F),
                    ),
                  ),
                ),
                const CheckboxWithText(label: 'S'),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectedIndex = 1;
                    });
                  },
                  child: Container(
                    height: 70.h,
                    // Use ScreenUtil for height
                    width: 150.w,
                    // Use ScreenUtil for width
                    decoration: BoxDecoration(
                      color: isSelectedIndex == 1
                          ? AppColors.white
                          : AppColors.greyF1,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      AppStrings.size,
                      style: AppStyles.font14.normal.colored(AppColors.black1F),
                    ),
                  ),
                ),
                const CheckboxWithText(label: 'M'),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectedIndex = 2;
                    });
                  },
                  child: Container(
                    height: 70.h,
                    // Use ScreenUtil for height
                    width: 150.w,
                    // Use ScreenUtil for width
                    decoration: BoxDecoration(
                      color: isSelectedIndex == 2
                          ? AppColors.white
                          : AppColors.greyF1,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      AppStrings.categories,
                      style: AppStyles.font14.normal.colored(AppColors.black1F),
                    ),
                  ),
                ),
                const CheckboxWithText(label: 'L'),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectedIndex = 3;
                    });
                  },
                  child: Container(
                    height: 70.h,
                    // Use ScreenUtil for height
                    width: 150.w,
                    // Use ScreenUtil for width
                    decoration: BoxDecoration(
                      color: isSelectedIndex == 3
                          ? AppColors.white
                          : AppColors.greyF1,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      AppStrings.bundles,
                      style: AppStyles.font14.normal.colored(AppColors.black1F),
                    ),
                  ),
                ),
                const CheckboxWithText(label: 'XL'),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectedIndex = 4;
                    });
                  },
                  child: Container(
                    height: 70.h,
                    // Use ScreenUtil for height
                    width: 150.w,
                    // Use ScreenUtil for width
                    decoration: BoxDecoration(
                      color: isSelectedIndex == 4
                          ? AppColors.white
                          : AppColors.greyF1,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      AppStrings.priceRange,
                      style: AppStyles.font14.normal.colored(AppColors.black1F),
                    ),
                  ),
                ),
                const CheckboxWithText(label: 'XXL'),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectedIndex = 5;
                    });
                  },
                  child: Container(
                    height: 70.h,
                    // Use ScreenUtil for height
                    width: 150.w,
                    // Use ScreenUtil for width
                    decoration: BoxDecoration(
                      color: isSelectedIndex == 5
                          ? AppColors.white
                          : AppColors.greyF1,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      AppStrings.discount,
                      style: AppStyles.font14.normal.colored(AppColors.black1F),
                    ),
                  ),
                ),
                const CheckboxWithText(label: '3XL'),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectedIndex = 6;
                    });
                  },
                  child: Container(
                    height: 70.h,
                    // Use ScreenUtil for height
                    width: 150.w,
                    // Use ScreenUtil for width
                    decoration: BoxDecoration(
                      color: isSelectedIndex == 6
                          ? AppColors.white
                          : AppColors.greyF1,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      AppStrings.rating,
                      style: AppStyles.font14.normal.colored(AppColors.black1F),
                    ),
                  ),
                ),
                const CheckboxWithText(label: '4XL'),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectedIndex = 7;
                    });
                  },
                  child: Container(
                    height: 70.h,
                    // Use ScreenUtil for height
                    width: 150.w,
                    // Use ScreenUtil for width
                    decoration: BoxDecoration(
                      color: isSelectedIndex == 7
                          ? AppColors.white
                          : AppColors.greyF1,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      AppStrings.pattern,
                      style: AppStyles.font14.normal.colored(AppColors.black1F),
                    ),
                  ),
                ),
                const CheckboxWithText(label: '5XL'),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectedIndex = 8;
                    });
                  },
                  child: Container(
                    height: 70.h,
                    // Use ScreenUtil for height
                    width: 150.w,
                    // Use ScreenUtil for width
                    decoration: BoxDecoration(
                      color: isSelectedIndex == 8
                          ? AppColors.white
                          : AppColors.greyF1,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      AppStrings.sleeveLength,
                      style: AppStyles.font14.normal.colored(AppColors.black1F),
                    ),
                  ),
                ),
                const CheckboxWithText(
                  label: '6XL',
                )
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectedIndex = 9;
                    });
                  },
                  child: Container(
                    height: 70.h,
                    // Use ScreenUtil for height
                    width: 150.w,
                    // Use ScreenUtil for width
                    decoration: BoxDecoration(
                      color: isSelectedIndex == 9
                          ? AppColors.white
                          : AppColors.greyF1,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      AppStrings.charater,
                      style: AppStyles.font14.normal.colored(AppColors.black1F),
                    ),
                  ),
                ),
                const CheckboxWithText(
                  label: '10XL',
                )
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 120.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.greyC8.withOpacity(0.1),
              spreadRadius: 5.r,
              blurRadius: 15.r,
              offset: Offset(0, -2.h), // Shadow positioned above
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => AppNavigation.pushNamed(context, AppRoutes.filterProducts),
                child: Container(
                  margin: EdgeInsets.only(left: 23.w , right: 6.5.w),
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(
                      color: AppColors.appColor,
                      width: 1.0.w,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.clearAll,
                      style: AppStyles.font18.medium.colored(AppColors.appColor),
                    ),
                  ),
                ),
              ),
            ),
      Expanded(
        child: Container(
          margin: EdgeInsets.only(right: 19.w ,left: 6.5.w),
          height: 56.h,
          decoration: BoxDecoration(
            color: AppColors.appColor,
            borderRadius: BorderRadius.circular(50.r),
            border: Border.all(
        color: AppColors.appColor,
        width: 1.0.w,
            ),
            boxShadow: [
        BoxShadow(
          color: AppColors.blue4A.withOpacity(0.30), 
          offset: const Offset(0,10), 
          blurRadius: 16,
          spreadRadius: 2,
        ),
            ],
          ),
          child: Center(
            child: Text(
        'View 15 Results',
        style: AppStyles.font18.medium.colored(AppColors.white),
            ),
          ),
        ),
      ),

          ],
        ),
      ),
    );
  }
}
