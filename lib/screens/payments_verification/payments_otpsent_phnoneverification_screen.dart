import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/utils/app_colors.dart';
import 'package:manchaha/utils/app_navigation.dart';
import 'package:manchaha/utils/app_route_names.dart';

import '../../shimmer/shimmer.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../../utils/global.dart';
import '../../utils/style/app_styles.dart';
import '../commons/bottom_button/bottom_button.dart';
import '../commons/bottom_container/bottom_container_widgets.dart';

class PaymentOTPSentPhoneVerification extends StatefulWidget {
  const PaymentOTPSentPhoneVerification({super.key});

  @override
  State<PaymentOTPSentPhoneVerification> createState() =>
      _PaymentOTPSentPhoneVerificationState();
}

class _PaymentOTPSentPhoneVerificationState
    extends State<PaymentOTPSentPhoneVerification> {
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
        backgroundColor: AppColors.white,
        body: Center(
          child: _isLoading? CustomShimmer(width: w-40, height: 500.h) :Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 240, 240, 240),
                radius: 60.r,
                child: Image.asset(
                  AppImages.verifyAccount,
                  width: 120.w, // Adjust width as needed
                  height: 120.h, // Adjust height as needed
                ),
              ),
              SizedBox(height: 20.h), // ScreenUtil applied here
              Text(
                AppStrings.verifyYourAccount,
                style: AppStyles.font26.semiBold.colored(AppColors.black1F),
              ),
              Text(
                AppStrings.enterYourMobileNumber,
                style: AppStyles.font16.normal.colored(AppColors.grey91),
              ),
              SizedBox(height: 12.h), // ScreenUtil applied here
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 25.w), // ScreenUtil applied here
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  obscureText: false,
                  style: AppStyles.font24.normal
                      .colored(AppColors.white), // ScreenUtil applied here
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CommonBottomContainer(
          child: BottomCommonButton(
            onPressed: () {
              AppNavigation.pushNamed(context, AppRoutes.paymentsOTPVerification);
            },
            label: AppStrings.sendOTP,
            labelStyle: AppStyles.font18.medium.colored(AppColors.white),
            height: 60.h,
            width: 395.w,
          ),
        ),
      ),
    );
  }
}
