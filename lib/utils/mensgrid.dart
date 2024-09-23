import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/utils/app_images.dart';

import 'app_colors.dart';
import 'app_navigation.dart';
import 'app_route_names.dart';
import '../models/bgriddata_model.dart';
import 'style/app_styles.dart';

class MensGrid extends StatefulWidget {
  const MensGrid({super.key});

  @override
  State<MensGrid> createState() => _MensGridState();
}

List<BGridData> _bphotos = [
  BGridData(
    image: AppImages.tshirt1,
    productName: "lorem ispum lorem ispum lorem  ",
    row: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '\u{20B9}850',
              style: AppStyles.font18.semiBold.colored(AppColors.black1E),
            ),
            SizedBox(width: 3.w),
            Text(
              '₹900',
              style: AppStyles.font15.normal
                  .colored(AppColors.grey9C)
                  .copyWith(decoration: TextDecoration.lineThrough),
            ),
            SizedBox(width: 3.w),
            Text(
              '15% OFF',
              style: AppStyles.font14.normal.colored(AppColors.orange),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
            Container(
              color: AppColors.yellow,
              height: 20.h,
              width: 20.h,
              child: Icon(
                Icons.star,
                color: AppColors.white,
                size: 11.sp,
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              '4.5',
              style: AppStyles.font15.medium.colored(AppColors.black1E),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              '(415)',
              style: AppStyles.font15.normal.colored(AppColors.grey6B),
            ),
          ],
        ),
      ],
    ),
    isLiked: false,
  ),
  BGridData(
    image: 'assets/collection1/tshirt1.png',
    productName: "lorem ispum lorem ispum lorem ispum",
    row: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '\u{20B9}850',
              style: AppStyles.font18.semiBold.colored(AppColors.black1E),
            ),
            SizedBox(width: 3.w),
            Text(
              '₹900',
              style: AppStyles.font15.normal
                  .colored(AppColors.grey9C)
                  .copyWith(decoration: TextDecoration.lineThrough),
            ),
            SizedBox(width: 3.w),
            Text(
              '15% OFF',
              style: AppStyles.font14.normal.colored(AppColors.orange),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
             Container(
              color: AppColors.yellow,
              height: 20.h,
              width: 20.h,
              child: Icon(
                Icons.star,
                color: AppColors.white,
                size: 11.sp,
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              '4.5',
              style: AppStyles.font15.medium.colored(AppColors.black1E),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              '(415)',
              style: AppStyles.font15.normal.colored(AppColors.grey6B),
            ),
          ],
        ),
      ],
    ),
    isLiked: false,
  ),
  BGridData(
    image: 'assets/collection1/tshirt3.png',
    productName: "lorem ispum lorem ispum lorem  ",
    row: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '\u{20B9}850',
              style: AppStyles.font18.semiBold.colored(AppColors.black1E),
            ),
            SizedBox(width: 3.w),
            Text(
              '₹900',
              style: AppStyles.font15.normal
                  .colored(AppColors.grey9C)
                  .copyWith(decoration: TextDecoration.lineThrough),
            ),
            SizedBox(width: 3.w),
            Text(
              '15% OFF',
              style: AppStyles.font14.normal.colored(AppColors.orange),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
           Container(
              color: AppColors.yellow,
              height: 20.h,
              width: 20.h,
              child: Icon(
                Icons.star,
                color: AppColors.white,
                size: 11.sp,
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              '4.5',
              style: AppStyles.font15.medium.colored(AppColors.black1E),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              '(415)',
              style: AppStyles.font15.normal.colored(AppColors.grey6B),
            ),
          ],
        ),
      ],
    ),
    isLiked: false,
  ),
  BGridData(
    image: 'assets/collection1/tshirt4.png',
    productName: "lorem ispum lorem ispum lorem  ",
    row: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '\u{20B9}850',
              style: AppStyles.font18.semiBold.colored(AppColors.black1E),
            ),
            SizedBox(width: 3.w),
            Text(
              '₹900',
              style: AppStyles.font15.normal
                  .colored(AppColors.grey9C)
                  .copyWith(decoration: TextDecoration.lineThrough),
            ),
            SizedBox(width: 3.w),
            Text(
              '15% OFF',
              style: AppStyles.font14.normal.colored(AppColors.orange),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
             Container(
              color: AppColors.yellow,
              height: 20.h,
              width: 20.h,
              child: Icon(
                Icons.star,
                color: AppColors.white,
                size: 11.sp,
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              '4.5',
              style: AppStyles.font15.medium.colored(AppColors.black1E),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              '(415)',
              style: AppStyles.font15.normal.colored(AppColors.grey6B),
            ),
          ],
        ),
      ],
    ),
    isLiked: false,
  ),
  BGridData(
    image: 'assets/collection1/tshirt1.png',
    productName: "lorem ispum lorem ispum lorem  ",
    row: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '\u{20B9}850',
              style: AppStyles.font18.semiBold.colored(AppColors.black1E),
            ),
            SizedBox(width: 3.w),
            Text(
              '₹900',
              style: AppStyles.font15.normal
                  .colored(AppColors.grey9C)
                  .copyWith(decoration: TextDecoration.lineThrough),
            ),
            SizedBox(width: 3.w),
            Text(
              '15% OFF',
              style: AppStyles.font14.normal.colored(AppColors.orange),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
            Container(
              color: AppColors.yellow,
              height: 20.h,
              width: 20.h,
              child: Icon(
                Icons.star,
                color: AppColors.white,
                size: 11.sp,
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              '4.5',
              style: AppStyles.font15.medium.colored(AppColors.black1E),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              '(415)',
              style: AppStyles.font15.normal.colored(AppColors.grey6B),
            ),
          ],
        ),
      ],
    ),
    isLiked: false,
  ),
  BGridData(
    image: 'assets/collection1/tshirt1.png',
    productName: "lorem ispum lorem ispum lorem  ",
    row: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '\u{20B9}850',
              style: AppStyles.font18.semiBold.colored(AppColors.black1E),
            ),
            SizedBox(width: 3.w),
            Text(
              '₹900',
              style: AppStyles.font15.normal
                  .colored(AppColors.grey9C)
                  .copyWith(decoration: TextDecoration.lineThrough),
            ),
            SizedBox(width: 3.w),
            Text(
              '15% OFF',
              style: AppStyles.font14.normal.colored(AppColors.orange),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
             Container(
              color: AppColors.yellow,
              height: 20.h,
              width: 20.h,
              child: Icon(
                Icons.star,
                color: AppColors.white,
                size: 11.sp,
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              '4.5',
              style: AppStyles.font15.medium.colored(AppColors.black1E),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              '(415)',
              style: AppStyles.font15.normal.colored(AppColors.grey6B),
            ),
          ],
        ),
      ],
    ),
    isLiked: false,
  ),
  BGridData(
    image: 'assets/collection1/tshirt1.png',
    productName: "lorem ispum lorem ispum lorem  ",
    row: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '\u{20B9}850',
              style: AppStyles.font18.semiBold.colored(AppColors.black1E),
            ),
            SizedBox(width: 3.w),
            Text(
              '₹900',
              style: AppStyles.font15.normal
                  .colored(AppColors.grey9C)
                  .copyWith(decoration: TextDecoration.lineThrough),
            ),
            SizedBox(width: 3.w),
            Text(
              '15% OFF',
              style: AppStyles.font14.normal.colored(AppColors.orange),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
        Container(
              color: AppColors.yellow,
              height: 20.h,
              width: 20.h,
              child: Icon(
                Icons.star,
                color: AppColors.white,
                size: 11.sp,
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              '4.5',
              style: AppStyles.font15.medium.colored(AppColors.black1E),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              '(415)',
              style: AppStyles.font15.normal.colored(AppColors.grey6B),
            ),
          ],
        ),
      ],
    ),
    isLiked: false,
  ),
  BGridData(
    image: 'assets/collection1/tshirt2.png',
    productName: "lorem ispum lorem ispum lorem ispum lorem ispum",
    row: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '\u{20B9}850',
              style: AppStyles.font18.semiBold.colored(AppColors.black1E),
            ),
            SizedBox(width: 3.w),
            Text(
              '₹900',
              style: AppStyles.font15.normal
                  .colored(AppColors.grey9C)
                  .copyWith(decoration: TextDecoration.lineThrough),
            ),
            SizedBox(width: 3.w),
            Text(
              '15% OFF',
              style: AppStyles.font14.normal.colored(AppColors.orange),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
           Container(
              color: AppColors.yellow,
              height: 20.h,
              width: 20.h,
              child: Icon(
                Icons.star,
                color: AppColors.white,
                size: 12.sp,
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              '4.5',
              style: AppStyles.font15.medium.colored(AppColors.black1E),
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              '(415)',
              style: AppStyles.font15.normal.colored(AppColors.grey6B),
            ),
          ],
        ),
      ],
    ),
    isLiked: false,
  ),
];

class _MensGridState extends State<MensGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1.w, // Apply ScreenUtil for spacing
          mainAxisSpacing: 8.h, // Apply ScreenUtil for spacing
          childAspectRatio: 0.70.h,
        ),
        itemCount: _bphotos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              AppNavigation.pushNamed(
                context,
                AppRoutes.selectedProduct,
                extra: {
                  "image": _bphotos[index].image,
                  "productName": _bphotos[index].productName,
                  "details": _bphotos[index].row,
                },
              );
            },
            child: Container(
              color: AppColors.tranparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 186.w, 
                    height: 164.h, 
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(_bphotos[index].image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(
                          5.r), // Apply ScreenUtil for border radius
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 5.h, 
                          right: 5.w, 
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _bphotos[index].isLiked =
                                    !_bphotos[index].isLiked;
                              });
                            },
                            child: CircleAvatar(
                              radius: 14.r, 
                              backgroundColor: AppColors.white.withOpacity(0.64),
                              child: Icon(Icons.favorite,
                                  size: 16.sp, 
                                  color: _bphotos[index].isLiked
                                      ? AppColors.favouriteRed
                                      : AppColors.grey6B),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h), // Apply ScreenUtil for spacing
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _bphotos[index].productName,
                          style:  AppStyles.font16.normal.colored(AppColors.black30),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 7.h), // Apply ScreenUtil for spacing
                        _bphotos[index].row,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
