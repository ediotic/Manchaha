import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import '../models/bgriddata_model.dart';
import 'style/app_styles.dart';

class BGridViewBar extends StatefulWidget {
  const BGridViewBar({super.key});

  @override
  State<BGridViewBar> createState() => _BGridViewBarState();
}

List<BGridData> _bphotos = [
  BGridData(
    image: 'assets/collection1/tshirt1.png',
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
    image: 'assets/collection1/tshirt2.png',
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

class _BGridViewBarState extends State<BGridViewBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
         physics:const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1.w,
          mainAxisSpacing: 8.h, 
          // childAspectRatio: 0.75, // Adjust this ratio for height adjustments
        ),
        itemCount: _bphotos.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image section
              Container(
                width: 160.w,
                height: 100.h, 
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_bphotos[index].image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius:
                      BorderRadius.circular(5.r), 
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 5.h, 
                      right: 5.w, 
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _bphotos[index].isLiked = !_bphotos[index].isLiked;
                          });
                        },
                        child: CircleAvatar(
                          radius: 12.r, 
                          backgroundColor:  AppColors.white.withOpacity(0.64),
                          child: Icon(
                            Icons.favorite,
                            size: 14.sp, 
                            color: _bphotos[index].isLiked
                                ?  AppColors.favouriteRed
                                :  AppColors.grey6B,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h), 

              // Product Name and other details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _bphotos[index].productName,
                      style: AppStyles.font15.normal.colored(AppColors.black30),
                         
                      maxLines: 2, 
                      overflow: TextOverflow
                          .ellipsis,
                    ),
                    SizedBox(height: 5.h), 
                    _bphotos[index].row,
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
