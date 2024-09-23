import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/shimmer/shimmer.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_navigation.dart';
import '../../utils/app_route_names.dart';
import '../../utils/app_strings.dart';
import '../../utils/global.dart';
import '../../utils/style/app_styles.dart';
import '../commons/bottom_button/bottom_button.dart';
import '../commons/bottom_container/bottom_container_widgets.dart';

class PaymentSuccessScreen extends StatefulWidget {
  const PaymentSuccessScreen({super.key});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: Center(
          child: _isLoading? CustomShimmer(width: w-40, height: 500.h) : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 240, 240, 240),
                radius: 60.r, // Applied ScreenUtil for radius
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      AppImages.paymentSuccess,
                      width: 120.w, // Applied ScreenUtil for width
                      height: 120.h, // Applied ScreenUtil for height
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ), // Applied ScreenUtil for height
              Text(
                AppStrings.paymentSuccessful,
                style: AppStyles.font26.semiBold.colored(AppColors.black1F),
              ),
              Text(
                AppStrings.weHaveEmailedTheReceipt,
                style: AppStyles.font16.normal.colored(AppColors.grey91),
              ),
              SizedBox(height: 20.h), // Applied ScreenUtil for height
            ],
          ),
        ),
        bottomNavigationBar: CommonBottomContainer(
          child: BottomCommonButton(
            onPressed: () {
              AppNavigation.pushNamed(context, AppRoutes.bottomNavBar);
            },
            label: AppStrings.finish,
            labelStyle: AppStyles.font18.medium.colored(AppColors.white),
            height: 60.h,
            width: 395.w,
          ),
        ),
      ),
    );
  }
}
