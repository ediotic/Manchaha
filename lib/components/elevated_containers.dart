// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/utils/app_colors.dart';
import 'package:manchaha/utils/style/app_styles.dart';

import '../utils/app_images.dart';
import '../utils/app_strings.dart';
import '../utils/global.dart';
import 'uc_images.dart';

class ElevatedContainers extends StatefulWidget {
  const ElevatedContainers({super.key});

  @override
  State<ElevatedContainers> createState() => _ElevatedContainersState();
}

class _ElevatedContainersState extends State<ElevatedContainers> {
  final List<Ucimages> _cimage = [
    Ucimages(
      image: AppImages.fashion,
      text: Text(
        AppStrings.fashion,
        style: AppStyles.font11.medium.colored(AppColors.grey6B),
      ),
      backgroundColor: const Color(0xFF10C843),
    ),
    Ucimages(
      image: AppImages.electronics,
      text: Text(
        AppStrings.electronics,
        style:AppStyles.font11.medium.colored(AppColors.grey6B),
      ),
      backgroundColor: AppColors.appColor,
    ),
    Ucimages(
      image: AppImages.appliances,
      text: Text(
        AppStrings.appliances,
        style: AppStyles.font11.medium.colored(AppColors.grey6B),
      ),
      backgroundColor: const Color(0xFFEA580C),
    ),
    Ucimages(
      image: AppImages.beauty,
      text: Text(
        AppStrings.beauty,
        style: AppStyles.font11.medium.colored(AppColors.grey6B),
      ),
      backgroundColor: const Color(0xFF34C8E9),
    ),
    Ucimages(
      image: AppImages.furniture,
      text: Text(
        AppStrings.furniture,
        style: AppStyles.font11.medium.colored(AppColors.grey6B),
      ),
      backgroundColor: AppColors.appColor,
    ),
  ];

  int? tappedIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        _cimage.length,
        (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                tappedIndex = index; // Update the tapped index
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              // width: (w*0.19).w,
              decoration: BoxDecoration(
                color: tappedIndex == index
                    ? AppColors.white
                    :   AppColors.whiteF7,
                borderRadius: BorderRadius.circular(50.r),
                boxShadow: tappedIndex == index // Add shadow only to tapped container
                    ? [
                        BoxShadow(
                          color: AppColors.greyC8.withOpacity(0.3),
                          // spreadRadius: 2.r, 
                          blurRadius: 13.r, 
                          offset: const Offset(0,3), 
                        ),
                      ]
                    : [], // No shadow for untapped containers
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: CircleAvatar(
                      radius: 28.r,
                      backgroundColor: _cimage[index].backgroundColor,
                      child: ClipOval(
                        child: Image.asset(
                          _cimage[index].image,
                          width: 40.w,
                          height: 40.h,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  _cimage[index].text,
                  SizedBox(height: 27.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
