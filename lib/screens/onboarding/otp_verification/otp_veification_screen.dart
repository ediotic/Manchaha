import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/screens/onboarding/components/onboarding_appbar.dart';
import 'package:manchaha/utils/app_images.dart';
import 'package:manchaha/utils/app_navigation.dart';
import 'package:manchaha/utils/app_route_names.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/random_otp_generate_screen.dart';
import '../../../utils/style/app_styles.dart';

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({super.key});

  @override
  State<PhoneVerificationScreen> createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  late TextEditingController otpController;

  @override
  void initState() {
    super.initState();
    otpController = TextEditingController();
    _setInitialOtp();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  void _setInitialOtp() {
    otpController.text = generateOTP();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: OnboardingAppBar(
        centerTitle: true,
        title: Text(
          AppStrings.welcomeCaps,
          style: AppStyles.font20.semiBold.colored(AppColors.white),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.appColor,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 80.h, horizontal: 16.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppStrings.phoneVerification,
                  style: AppStyles.font18.normal.colored(AppColors.black30),
                ),
                Text(
                  AppStrings.enterYourOTPCode,
                  style: AppStyles.font26.normal.colored(AppColors.black30),
                ),
                SizedBox(height: 70.h),
                Text(
                  AppStrings.enterYour4digitCode,
                  style: AppStyles.font16.normal.colored(AppColors.black30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '892387876.',
                      style: AppStyles.font14.normal.colored(AppColors.black30),
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      AppStrings.didYouEnterTheCorrectNumber,
                      style: AppStyles.font14.semiBold
                          .colored(AppColors.blueColor),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 46.w), // ScreenUtil applied here
                  child: PinCodeTextField(
                    controller: otpController,
                    appContext: context,
                    length: 4,
                    onChanged: (value) {
                      setState(() {
                        // _otp = value;
                      });
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10.r),
                      fieldHeight: 50.h,
                      fieldWidth: 50.w,
                      activeColor: AppColors.appColor,
                      selectedColor: AppColors.appColor,
                      inactiveColor: AppColors.white,
                      activeFillColor: AppColors.appColor,
                      selectedFillColor: AppColors.appColor,
                      inactiveFillColor: AppColors.white,
                    ),
                    textStyle: AppStyles.font24.normal.colored(AppColors.white),
                    backgroundColor: Colors.transparent,
                    keyboardType: TextInputType.number,
                    enableActiveFill: true,
                  ),
                ),
                SizedBox(height: 45.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.resendCodeIn,
                      style: AppStyles.font15.normal.colored(AppColors.black30),
                    ),
                    Text(
                      '10 seconds',
                      style:
                          AppStyles.font15.semiBold.colored(AppColors.appColor),
                    ),
                    SizedBox(width: 40.w),
                    GestureDetector(
                      onTap: () {
                        AppNavigation.goNamed(context, AppRoutes.bottomNavBar);
                      },
                      child: Container(
                        height: 50.h,
                        width: 50.w,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: otpController.text.trim().length == 4
                              ? const Color(0xFF4A90E2)
                              : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.greyBr),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black30.withOpacity(0.1),
                              spreadRadius: 0.r,
                              blurRadius: 15.r,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Image.asset(
                            AppImages.arrow,
                            color: otpController.text.trim().length == 4
                                ? AppColors.white
                                : AppColors.greyArrow,
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
