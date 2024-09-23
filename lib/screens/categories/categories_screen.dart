import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:manchaha/utils/app_methods.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../../utils/global.dart';
import '../../utils/style/app_styles.dart';
import '../commons/appbar/paymensts_appbar.dart';
import 'widgets/filter_button/filter_button.dart';
import 'widgets/fashion_grid/fashion_grid.dart';
import 'widgets/searchbar/searchbar.dart';
import 'widgets/side_containers/side_containers.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int isSelectedIndex = 0;
  List<String> categoriesList = [
    AppStrings.fashion,
    AppStrings.electronics,
    AppStrings.homeApplicants,
    AppStrings.beauty,
    AppStrings.furniture,
    AppStrings.shoes,
    AppStrings.antiques,
    AppStrings.toys,
    AppStrings.babys,
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: PaymentsAppBar(
          title: Padding(
            padding: EdgeInsets.only(left: 17.0.w),
            child: Text(
              AppStrings.categories,
              style: AppStyles.font24.medium.colored(AppColors.black1F),
            ),
          ),
          bgColor: AppColors.white,
          centerTitle: false,
          showBackButton: false,
          elevation: 3,
          shadowColor: AppColors.black0,
          automaticallyImplyLeading: true,
          leadingIconColor: AppColors.black0,
          actions: [
            Image.asset(
              AppImages.ubell,
              color: AppColors.black1F,
              height: 19.h,
              width: 20.w,
            ),
            SizedBox(
              width: 20.w,
            ),
            Image.asset(
              AppImages.ubag,
              color: AppColors.black1F,
              height: 20.h,
              width: 19.w,
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: (h * 0.02).h),
            Row(
              children: [
                const Expanded(child: SearchBarWidget()),
                FilterButton(
                  onTap: () {
                    printDebug('filter button ::: tapped');
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ],
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Card(
                          margin: EdgeInsets.only(
                              top: 4.h, right: 4.w, bottom: 4.h),
                          elevation: 13,
                          shadowColor: AppColors.greyC8,
                          color: AppColors.white,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ...List.generate(
                                categoriesList.length,
                                (index) {
                                  return CustomContainer(
                                    isSelected: isSelectedIndex == index,
                                    text: categoriesList[index],
                                    padding:
                                        EdgeInsets.symmetric(vertical: 25.h),
                                    borderRadius: index == 0
                                        ? BorderRadius.only(
                                            topRight: Radius.circular(10.r),
                                          )
                                        : index == categoriesList.length - 1
                                            ? BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(20.r),
                                              )
                                            : BorderRadius.zero,
                                    backgroundColor: isSelectedIndex == index
                                        ? AppColors.greyF5
                                        : AppColors.white,
                                    textStyle: AppStyles.font13.medium.colored(
                                      isSelectedIndex == index
                                          ? AppColors.blue06
                                          : AppColors.black1F,
                                    ),
                                    width: (w * 0.24).w,
                                    onTap: () {
                                      setState(() {
                                        isSelectedIndex = index;
                                      });
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40.h)
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 14.w),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(
                                  color: AppColors.greyE6, width: 1.w),
                              borderRadius: BorderRadius.circular(15.r),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.blue00.withOpacity(0.15),
                                  blurRadius: 5.0,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 14.w, top: 11.h, right: 13.3.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppStrings.mensFashion,
                                        style: AppStyles.font12.medium
                                            .colored(AppColors.black0),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          AppStrings.seeAll,
                                          style: AppStyles.font10.medium
                                              .colored(AppColors.appColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1.w,
                                  color: AppColors.greyE2.withOpacity(0.40),
                                ),
                                SizedBox(height: 5.h),
                                FashionGrid(
                                  fashionDataList: [
                                    FashionData(
                                        image: AppImages.m1,
                                        productName: "Fashion 01"),
                                    FashionData(
                                        image: AppImages.m2,
                                        productName: "Fashion 02"),
                                    FashionData(
                                        image: AppImages.m3,
                                        productName: "Fashion 03"),
                                    FashionData(
                                        image: AppImages.m4,
                                        productName: "Fashion 04"),
                                    FashionData(
                                        image: AppImages.m5,
                                        productName: "Fashion 05"),
                                    FashionData(
                                        image: AppImages.m6,
                                        productName: "Fashion 06"),
                                  ],
                                ),
                                SizedBox(height: 12.5.h),
                              ],
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 14.w),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(
                                  color: AppColors.greyE6, width: 1.w),
                              borderRadius: BorderRadius.circular(15.r),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.blue00.withOpacity(0.15),
                                  blurRadius: 5.0,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 14.w, top: 11.h, right: 13.3.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppStrings.femaleFashion,
                                        style: AppStyles.font12.medium
                                            .colored(AppColors.black0),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          AppStrings.seeAll,
                                          style: AppStyles.font10.medium
                                              .colored(AppColors.appColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1.w,
                                  color: AppColors.greyE2.withOpacity(0.40),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                FashionGrid(
                                  fashionDataList: [
                                    FashionData(
                                        image: AppImages.f1,
                                        productName: "Fashion 01"),
                                    FashionData(
                                        image: AppImages.f2,
                                        productName: "Fashion 02"),
                                    FashionData(
                                        image: AppImages.f3,
                                        productName: "Fashion 03"),
                                    FashionData(
                                        image: AppImages.f4,
                                        productName: "Fashion 04"),
                                    FashionData(
                                        image: AppImages.f5,
                                        productName: "Fashion 05"),
                                    FashionData(
                                        image: AppImages.f6,
                                        productName: "Fashion 06"),
                                  ],
                                ),
                                SizedBox(height: 12.5.h),
                              ],
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 14.w),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(
                                  color: AppColors.greyE6, width: 1.w),
                              borderRadius: BorderRadius.circular(15.r),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.blue00.withOpacity(0.15),
                                  blurRadius: 5.0,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 14.w, top: 11.h, right: 13.3.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppStrings.accessories,
                                        style: AppStyles.font12.medium
                                            .colored(AppColors.black0),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          AppStrings.seeAll,
                                          style: AppStyles.font10.medium
                                              .colored(AppColors.appColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1.w,
                                  color: AppColors.greyE2.withOpacity(0.40),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                FashionGrid(
                                  fashionDataList: [
                                    FashionData(
                                        image: AppImages.a1,
                                        productName: "Fashion 01"),
                                    FashionData(
                                        image: AppImages.a2,
                                        productName: "Fashion 02"),
                                    FashionData(
                                        image: AppImages.a3,
                                        productName: "Fashion 03"),
                                    FashionData(
                                        image: AppImages.a4,
                                        productName: "Fashion 04"),
                                    FashionData(
                                        image: AppImages.a5,
                                        productName: "Fashion 05"),
                                    FashionData(
                                        image: AppImages.a6,
                                        productName: "Fashion 06"),
                                  ],
                                ),
                                SizedBox(height: 12.5.h),
                              ],
                            ),
                          ),
                          SizedBox(height: 40.h)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}
