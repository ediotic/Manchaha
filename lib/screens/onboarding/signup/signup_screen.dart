import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:manchaha/screens/onboarding/components/onboarding_appbar.dart';
import 'package:manchaha/utils/app_colors.dart';
import 'package:manchaha/utils/app_images.dart';

import '../../../utils/app_methods.dart';
import '../../../utils/app_navigation.dart';
import '../../../utils/app_route_names.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/style/app_styles.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // to close the key when tapped outside the user field ----->
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: OnboardingAppBar(
          centerTitle: true,
          title: Text(
            AppStrings.welcomeCaps,
            style: AppStyles.font20.semiBold.colored(AppColors.white),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 80.h, horizontal: 33.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                AppStrings.helloNiceToMeetYou,
                style: AppStyles.font18.normal.colored(AppColors.black30),
              ),
              Text(
                AppStrings.joinOurManchahaApp,
                style: AppStyles.font26.normal.colored(AppColors.black30),
              ),
              SizedBox(height: 151.h),
              phoneController.text.trim().isNotEmpty
                  ? Row(
                      children: [
                        Text(
                          AppStrings.phoneNumber,
                          style:
                              AppStyles.font13.normal.colored(AppColors.grey79),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
              phoneController.text.trim().isNotEmpty
                  ? SizedBox(height: 8.h)
                  : const SizedBox.shrink(),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 3),
                      blurRadius: 15.r,
                      spreadRadius: 0.r,
                      color: const Color(0xFF303030).withOpacity(0.1),
                    )
                  ],
                ),
                child: IntlPhoneField(
                  controller: phoneController,
                  showDropdownIcon: false,
                  initialCountryCode: 'IN',
                  keyboardType: TextInputType.number,
                  flagsButtonMargin: EdgeInsets.only(bottom: 0.h),
                  textAlignVertical: TextAlignVertical.top,
                  style: AppStyles.font14.normal.colored(AppColors.black2427),
                  decoration: InputDecoration(
                    hintText: AppStrings.phoneNumber,
                    contentPadding: EdgeInsets.only(top: 14.h),
                    border: InputBorder.none,
                    counter: const SizedBox.shrink(),
                  ),
                  onChanged: (phone) {
                    printDebug(phone.completeNumber);
                    setState(() {});
                  },
                ),
              ),
              SizedBox(height: 210.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the login password screen
                        AppNavigation.pushNamed(
                            context, AppRoutes.otpVerification);
                      },
                      child: Container(
                        height: 65.h,
                        width: 364.w,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(50.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 10.r,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.continueText,
                              style: AppStyles.font16.semiBold
                                  .colored(AppColors.grey4e55),
                            ),
                            SizedBox(width: 8.w),
                            Image.asset(
                              AppImages.arrow,
                              color: AppColors.grey4e55,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                AppStrings.byCreatingAccount,
                style: AppStyles.font15.normal.colored(AppColors.black2427),
              ),
              Text(
                AppStrings.termsOfServicePrivacyPolicy,
                style: AppStyles.font15.semiBold.colored(AppColors.black2427),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
