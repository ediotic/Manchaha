import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/screens/my_wishlist/wishlist_grid/wishlist_grid_data.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../../utils/style/app_styles.dart';
import '../commons/appbar/paymensts_appbar.dart';

class MyWishlistScreen extends StatefulWidget {
  const MyWishlistScreen({super.key});

  @override
  State<MyWishlistScreen> createState() => _MyWishlistScreenState();
}

class _MyWishlistScreenState extends State<MyWishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PaymentsAppBar(
        title: Text(
          AppStrings.myWishlist,
          style: AppStyles.font24.medium.colored(AppColors.black1F),
        ),
        bgColor: AppColors.white,
        centerTitle: false,
        showBackButton: true,
        elevation: 3,
        shadowColor: AppColors.black0,
        automaticallyImplyLeading: true,
        leadingIconColor: AppColors.black0,
        actions: [
          // Padding(padding: EdgeInsets.symmetric(horizontal: 20.w)),
          Image.asset(
            AppImages.ubell,
            color: AppColors.black1F,
            height: 20.h,
            width: 19.w,
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
        children: [
          Expanded(
            child: Container(
              // padding: EdgeInsets.only(left: 25.w),
              color: AppColors.white,
              child: const WishlistGrid(),
            ),
          ),
        ],
      ),
    );
  }
}
