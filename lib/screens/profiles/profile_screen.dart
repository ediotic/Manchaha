import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/utils/app_colors.dart';
import 'package:manchaha/utils/app_images.dart';
import 'package:manchaha/utils/app_navigation.dart';
import 'package:manchaha/utils/app_route_names.dart';
import 'package:manchaha/utils/app_strings.dart';
import 'package:manchaha/utils/style/app_styles.dart';

import '../../shimmer/shimmer.dart';
import '../../utils/global.dart';
import 'widgets/profiles_buttons_widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
      backgroundColor: AppColors.appColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: (h * 0.04).h,
              horizontal: 18.w,
            ),
            child: _isLoading
                ? CustomShimmer(
                    width: w,
                    height: 50.h,
                    // borderRadius: 100.r,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              AppNavigation.pushNamed(
                                  context, AppRoutes.myProfile);
                            },
                            child: CircleAvatar(
                              backgroundColor:
                                  AppColors.black0.withOpacity(0.20),
                              radius: 25.r,
                              child: Image.asset(
                                AppImages.profileicon,
                                height: (h * 0.05).h,
                                width: (w * 0.12).w,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lorem Ipsum',
                                  style: AppStyles.font17.medium
                                      .colored(AppColors.white),
                                ),
                                Text(
                                  'Lorem Ipsum@gmail.com',
                                  style: AppStyles.font13.normal
                                      .colored(AppColors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () => AppNavigation.pushReplacement(
                            context, AppRoutes.login),
                        child: Image.asset(
                          AppImages.logouticon,
                          height: 26.h,
                          width: 26.w,
                        ),
                      ),
                    ],
                  ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black0.withOpacity(0.20),
                    spreadRadius: 0,
                    blurRadius: 13,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.shippingAddress,
                        style:
                            AppStyles.font16.medium.colored(AppColors.black1F),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Divider(
                        thickness: 1.h,
                        color: AppColors.greyF4,
                      ),
                      ProfileButton(
                        imageUrl: AppImages.orderhistory,
                        text: AppStrings.orderhistory,
                        icon: Icons.arrow_forward_ios,
                        onTap: () {
                          AppNavigation.pushNamed(
                              context, AppRoutes.orderHistory);
                        },
                      ),
                      Divider(
                        thickness: 1.h,
                        color: AppColors.greyF4,
                      ),
                      ProfileButton(
                        imageUrl: AppImages.shipping,
                        text: AppStrings.shippingAddress,
                        icon: Icons.arrow_forward_ios,
                        onTap: () {
                          AppNavigation.pushNamed(context, AppRoutes.address);
                        },
                      ),
                      Divider(
                        thickness: 1.h,
                        color: AppColors.greyF4,
                      ),
                      ProfileButton(
                        imageUrl: AppImages.payment,
                        text: AppStrings.paymentMethod,
                        icon: Icons.arrow_forward_ios,
                        onTap: () {
                          AppNavigation.pushNamed(context, AppRoutes.myCards);
                        },
                      ),
                      Divider(
                        thickness: 1.h,
                        color: AppColors.greyF4,
                      ),
                      ProfileButton(
                        imageUrl: AppImages.wishlist,
                        text: AppStrings.myWishlist,
                        icon: Icons.arrow_forward_ios,
                        onTap: () {
                          AppNavigation.pushNamed(context, AppRoutes.wishlist);
                        },
                      ),
                      Divider(
                        thickness: 1.h,
                        color: AppColors.greyF4,
                      ),
                      Text(
                        AppStrings.supportInfo,
                        style:
                            AppStyles.font16.medium.colored(AppColors.black1F),
                      ),
                      Divider(
                        thickness: 1.h,
                        color: AppColors.greyF4,
                      ),
                      ProfileButton(
                        imageUrl: AppImages.privacy,
                        text: AppStrings.privacyPolicy,
                        icon: Icons.arrow_forward_ios,
                        onTap: () {
                          AppNavigation.pushNamed(
                              context, AppRoutes.privacyPolicy);
                        },
                      ),
                      Divider(
                        thickness: 1.h,
                        color: AppColors.greyF4,
                      ),
                      ProfileButton(
                        imageUrl: AppImages.terms,
                        text: AppStrings.terms,
                        icon: Icons.arrow_forward_ios,
                        onTap: () {
                          AppNavigation.pushNamed(
                              context, AppRoutes.termsConditons);
                        },
                      ),
                      Divider(
                        thickness: 1.h,
                        color: AppColors.greyF4,
                      ),
                      ProfileButton(
                        imageUrl: AppImages.faq,
                        text: AppStrings.faq,
                        icon: Icons.arrow_forward_ios,
                        onTap: () {
                          AppNavigation.pushNamed(context, AppRoutes.faq);
                        },
                      ),
                      Divider(
                        thickness: 1.h,
                        color: AppColors.greyF4,
                      ),
                      Text(
                        AppStrings.accountManagement,
                        style:
                            AppStyles.font16.medium.colored(AppColors.black1F),
                      ),
                      Divider(
                        thickness: 1.h,
                        color: AppColors.greyF4,
                      ),
                      ProfileButton(
                        imageUrl: AppImages.noti,
                        text: AppStrings.noti,
                        icon: Icons.arrow_forward_ios,
                        onTap: () {
                          AppNavigation.pushNamed(
                              context, AppRoutes.notification);
                        },
                      ),
                      Divider(
                        thickness: 1.h,
                        color: AppColors.greyF4,
                      ),
                      SizedBox(height: 80.h)
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
