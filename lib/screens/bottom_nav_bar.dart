import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../../utils/app_methods.dart';
import '../provider/controllers/home_provider.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_routes.dart';
import '../utils/app_strings.dart';
import 'categories/categories_screen.dart';
import 'home/home_screen.dart';
import 'order_history/order_history_screen.dart';
import 'profiles/profile_screen.dart';
// import 'under_development_screen.dart';

class BottomNavBar extends StatefulWidget {
  final BottomNavArguments staticIndex;

  const BottomNavBar({
    super.key,
    required this.staticIndex,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int isSelected = 0;

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: 4, vsync: this);

    if (!isNullOrEmpty(widget.staticIndex)) {
      _controller.index = widget.staticIndex.index;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: () async {
          if (_controller.index != 0) {
            _controller.animateTo(0);
            return false;
          } else {
            return await SystemChannels.platform
                .invokeMethod('SystemNavigator.pop');
          }
        },
        child: TabBarView(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            ChangeNotifierProvider(
              create: (context) => HomeProvider(),
              child: const HomeScreen(),
            ),
            const CategoriesScreen(),
            const OrderHistoryScreen(),
            const ProfileScreen(),
          ],
        ),
      ),
      backgroundColor: AppColors.white,
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 27.h),
        child: Container(
          height: 90.h,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.black0.withOpacity(0.12),
                spreadRadius: 0.r,
                blurRadius: 10.r,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: GNav(
            color: AppColors.greyB0,
            activeColor: AppColors.white,
            tabBackgroundColor: AppColors.appColor,
            selectedIndex: _controller.index,
            onTabChange: (index) {
              _controller.index = index;
              setState(() {});
            },
            padding: EdgeInsets.symmetric(vertical: 13.h),
            tabs: [
              GButton(
                onPressed: () {
                  setState(() {
                    isSelected = 0;
                  });
                },
                leading: Padding(
                  padding:
                      EdgeInsets.only(right: isSelected == 0 ? 8.0.w : 0.w),
                  child: Image.asset(
                    AppImages.home,
                    color: isSelected == 0 ? AppColors.white : AppColors.greyB0,
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
                icon: Icons.home,
                iconSize: 1.sp,
                text: AppStrings.home,
                margin: EdgeInsets.only(left: 22.w),
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 11.h),
              ),
              GButton(
                onPressed: () {
                  setState(() {
                    isSelected = 1;
                  });
                },
                leading: Padding(
                  padding:
                      EdgeInsets.only(right: isSelected == 1 ? 8.0.w : 0.w),
                  child: Image.asset(
                    AppImages.gridIcon,
                    color: isSelected == 1 ? AppColors.white : AppColors.greyB0,
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
                icon: Icons.favorite_border,
                iconSize: 1.sp,
                text: AppStrings.categories,
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 11.h),
              ),
              GButton(
                onPressed: () {
                  setState(() {
                    isSelected = 2;
                  });
                },
                leading: Padding(
                  padding:
                      EdgeInsets.only(right: isSelected == 2 ? 8.0.w : 0.w),
                  child: Image.asset(
                    AppImages.bag,
                    color: isSelected == 2 ? AppColors.white : AppColors.greyB0,
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
                icon: Icons.search,
                iconSize: 1.sp,
                text: AppStrings.order,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 11.h),
              ),
              GButton(
                onPressed: () {
                  setState(() {
                    isSelected = 3;
                  });
                },
                leading: Padding(
                  padding:
                      EdgeInsets.only(right: isSelected == 3 ? 8.0.w : 0.w),
                  child: Image.asset(
                    AppImages.profile,
                    color: isSelected == 3 ? AppColors.white : AppColors.greyB0,
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
                icon: Icons.settings,
                iconSize: 1.sp,
                text: AppStrings.profile,
                margin: EdgeInsets.only(right: 22.w),
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 11.h),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _controller.index = index;
    });
  }
}
