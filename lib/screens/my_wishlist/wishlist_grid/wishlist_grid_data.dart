import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/utils/app_images.dart';

import '../../../shimmer/shimmer.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_navigation.dart';
import '../../../utils/app_route_names.dart';
import '../../../models/bgriddata_model.dart';
import '../../../utils/global.dart';
import '../../../utils/style/app_styles.dart';

class WishlistGrid extends StatefulWidget {
  const WishlistGrid({super.key});

  @override
  State<WishlistGrid> createState() => _WishlistGridState();
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
              style: AppStyles.font14.normal.colored(AppColors.red),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
            CircleAvatar(
              radius: 10.r,
              backgroundColor: AppColors.yellow,
              child: Icon(
                Icons.star,
                color: AppColors.white,
                size: 20.sp,
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
              style: AppStyles.font14.normal.colored(AppColors.red),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
            CircleAvatar(
              radius: 10.r,
              backgroundColor: AppColors.yellow,
              child: Icon(
                Icons.star,
                color: AppColors.white,
                size: 20.sp,
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
              style: AppStyles.font14.normal.colored(AppColors.red),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
            CircleAvatar(
              radius: 10.r,
              backgroundColor: AppColors.yellow,
              child: Icon(
                Icons.star,
                color: AppColors.white,
                size: 20.sp,
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
              style: AppStyles.font14.normal.colored(AppColors.red),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
            CircleAvatar(
              radius: 10.r,
              backgroundColor: AppColors.yellow,
              child: Icon(
                Icons.star,
                color: AppColors.white,
                size: 20.sp,
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
              style: AppStyles.font14.normal.colored(AppColors.red),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
            CircleAvatar(
              radius: 10.r,
              backgroundColor: AppColors.yellow,
              child: Icon(
                Icons.star,
                color: AppColors.white,
                size: 20.sp,
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
              style: AppStyles.font14.normal.colored(AppColors.red),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
            CircleAvatar(
              radius: 10.r,
              backgroundColor: AppColors.yellow,
              child: Icon(
                Icons.star,
                color: AppColors.white,
                size: 20.sp,
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
              style: AppStyles.font14.normal.colored(AppColors.red),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
            CircleAvatar(
              radius: 10.r,
              backgroundColor: AppColors.yellow,
              child: Icon(
                Icons.star,
                color: AppColors.white,
                size: 20.sp,
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
    productName: "lorem ispum ",
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
              style: AppStyles.font14.normal.colored(AppColors.red),
            ),
          ],
        ),
        SizedBox(height: 3.h),
        Row(
          children: [
            CircleAvatar(
              radius: 10.r,
              backgroundColor: AppColors.yellow,
              child: Icon(
                Icons.star,
                color: AppColors.white,
                size: 20.sp,
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

class _WishlistGridState extends State<WishlistGrid> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 24.h),
        child: Center(
          child: Wrap(
            spacing: 23.w,
            runSpacing: 18.h,
            children: List.generate(
              _bphotos.length,
              (index) {
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
                  child: _isLoading
                      ? CustomShimmer(width: w, height: 100.h)
                      : Container(
                          width: (w * 0.43).w,
                          color: AppColors.tranparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width:
                                    (w * 0.43).w, // Apply ScreenUtil for width
                                height: (h * 0.135)
                                    .h, // Apply ScreenUtil for height
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(_bphotos[index].image),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(5
                                      .r), // Apply ScreenUtil for border radius
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 5
                                          .h, // Apply ScreenUtil for positioning
                                      right: 5
                                          .w, // Apply ScreenUtil for positioning
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _bphotos[index].isLiked =
                                                !_bphotos[index].isLiked;
                                          });
                                        },
                                        child: CircleAvatar(
                                          radius: 10
                                              .r, // Apply ScreenUtil for radius
                                          backgroundColor:
                                              const Color(0xFFFFFFFF),
                                          child: Icon(Icons.favorite,
                                              size: 15
                                                  .sp, // Apply ScreenUtil for icon size
                                              color: _bphotos[index].isLiked
                                                  ? AppColors.red
                                                  : AppColors.grey6B),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 5
                                          .h, // Apply ScreenUtil for positioning
                                      left: 5
                                          .w, // Apply ScreenUtil for positioning
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: CircleAvatar(
                                            radius: 10
                                                .r, // Apply ScreenUtil for radius
                                            backgroundColor:
                                                const Color(0xFFFFFFFF),
                                            child: Image.asset(AppImages.bin)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: 8.h), // Apply ScreenUtil for spacing
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _bphotos[index].productName,
                                    style: AppStyles.font15.normal
                                        .colored(AppColors.black30),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                      height:
                                          7.h), // Apply ScreenUtil for spacing
                                  _bphotos[index].row,
                                ],
                              ),
                            ],
                          ),
                        ),
                );
              },
            ),
          ),
        ),
      ),
      // GridView.builder(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     crossAxisSpacing: 1.w, // Apply ScreenUtil for spacing
      //     mainAxisSpacing: 1.h, // Apply ScreenUtil for spacing
      //     childAspectRatio: 0.90,
      //   ),
      //   itemCount: _bphotos.length,
      //   itemBuilder: (context, index) {
      //    },
      // ),
    );
  }
}
