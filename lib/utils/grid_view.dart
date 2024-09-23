import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/gird_modal.dart';
import 'app_colors.dart';
import 'style/app_styles.dart';

class GridViewBar extends StatefulWidget {
  const GridViewBar({super.key});

  @override
  State<GridViewBar> createState() => _GridViewBarState();
}

List<GridData> _photos = [
  GridData(
    image: 'assets/collection1/shoes1.png',
    productName: "Running Shoes",
    container: Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      padding: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.grey6D,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Center(
        child: Text(
          'Upto 40% off',
          style: AppStyles.font13.medium.colored(AppColors.white),
        ),
      ),
    ),
  ),
  GridData(
    image: 'assets/collection1/shoes2.png',
    productName: "Sneakers",
    container: Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      padding: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.grey6D,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Center(
        child: Text(
          'Upto 40% off',
          style: AppStyles.font13.medium.colored(AppColors.white),
        ),
      ),
    ),
  ),
  GridData(
    image: 'assets/collection1/watch1.png',
    productName: "Wrist Watch",
    container: Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      padding: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.grey6D,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Center(
        child: Text(
          'Upto 40% off',
          style: AppStyles.font13.medium.colored(AppColors.white),
        ),
      ),
    ),
  ),
  GridData(
    image: 'assets/collection1/speaker1.png',
    productName: "Bluetooth Speaker",
    container: Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      padding: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.grey6D,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Center(
        child: Text(
          'Upto 40% off',
          style: AppStyles.font13.medium.colored(AppColors.white),
        ),
      ),
    ),
  ),
];

class _GridViewBarState extends State<GridViewBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 20.h,
          // mainAxisExtent: 300.h
          // childAspectRatio: (1),
        ),
        itemCount: _photos.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1.6, // adjustment k liye
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(_photos[index].image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  _photos[index].productName,
                  style: AppStyles.font14.normal.colored(AppColors.black22),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 5.h),
              _photos[index].container,
            ],
          );
        },
      ),
    );
  }
}
