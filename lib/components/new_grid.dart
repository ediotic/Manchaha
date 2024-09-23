import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_navigation.dart';
import '../utils/app_route_names.dart';
import '../models/bgriddata_model.dart';
import '../utils/style/app_styles.dart';

class NewGrid extends StatefulWidget {
  const NewGrid({super.key});

  @override
  State<NewGrid> createState() => _NewGridState();
}

List<BGridData> _bphotos = [
  BGridData(
    image: AppImages.newt2,
    productName: "lorem ispum lorem",
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
            CircleAvatar(
              radius: 12.r, 
              backgroundColor: AppColors.yellow,
              child: Icon(
                Icons.star,
                color: AppColors.white,
                size: 18.sp, 
              ),
            ),
            SizedBox(
              width: 4.w, 
            ),
            Text('4.5',
                style: AppStyles.font15.medium.colored(AppColors.black1E)),
            SizedBox(
              width: 4.w, 
            ),
            Text('(415)',
                style: AppStyles.font13.normal.colored(AppColors.grey6B)),
          ],
        ),
      ],
    ),
    isLiked: false,
  ),
  BGridData(
    image: AppImages.newt1,
    productName: "lorem ispum lorem ",
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
            CircleAvatar(
              radius: 12.r, 
              backgroundColor: AppColors.yellow,
              child: Icon(
                Icons.star,
                color: AppColors.white,
                size: 18.sp, 
              ),
            ),
            SizedBox(
              width: 4.w, 
            ),
            Text('4.5',
                style: AppStyles.font15.medium.colored(AppColors.black1E)),
            SizedBox(
              width: 4.w,
            ),
            Text('(415)',
                style: AppStyles.font13.normal.colored(AppColors.grey6B)),
          ],
        ),
      ],
    ),
    isLiked: false,
  ),
];


class _NewGridState extends State<NewGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: GridView.builder(
        physics:const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1.w, // Applied ScreenUtil for crossAxisSpacing
          mainAxisSpacing: 8.h, // Applied ScreenUtil for mainAxisSpacing
          childAspectRatio: 0.75, // Maintained childAspectRatio
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
                    width: 160.w, // Applied ScreenUtil for width
                    height: 110.h, // Applied ScreenUtil for height
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(_bphotos[index].image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(
                          5.r), // Applied ScreenUtil for borderRadius
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 5.h, // Applied ScreenUtil for positioning
                          right: 5.w, // Applied ScreenUtil for positioning
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _bphotos[index].isLiked =
                                    !_bphotos[index].isLiked;
                              });
                            },
                            child: CircleAvatar(
                              radius: 10.r, // Applied ScreenUtil for radius
                              backgroundColor: AppColors.white,
                              child: Icon(
                                Icons.favorite,
                                size: 15.sp, // Applied ScreenUtil for icon size
                                color: _bphotos[index].isLiked
                                    ? AppColors.favouriteRed
                                    : AppColors.grey6B,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h), // Applied ScreenUtil for spacing
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _bphotos[index].productName,
                          style: AppStyles.font15.normal.colored(AppColors.black30),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 7.h), // Applied ScreenUtil for spacing
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
