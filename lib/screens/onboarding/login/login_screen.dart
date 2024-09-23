import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:manchaha/screens/onboarding/components/onboarding_appbar.dart';
import 'package:manchaha/utils/app_colors.dart';
import 'package:manchaha/utils/app_images.dart';
import 'package:manchaha/utils/style/app_styles.dart';

import '../../../utils/app_common_button.dart';
import '../../../utils/app_methods.dart';
import '../../../utils/app_navigation.dart';
import '../../../utils/app_route_names.dart';
import '../../../utils/app_strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: OnboardingAppBar(
        bgColor: AppColors.appColor,
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
        // keyborad close when tapped outside the upser field.
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 46.h),
          child: Center(
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.0.w),
                  child: IntlPhoneField(
                    controller: phoneController,
                    showDropdownIcon: false,
                    initialCountryCode: 'IN',
                    keyboardType: TextInputType.number,
                    flagsButtonMargin: EdgeInsets.only(bottom: 0.h),
                    textAlignVertical: TextAlignVertical.top,
                    style: AppStyles.font14.normal.colored(AppColors.black2427),
                    decoration: const InputDecoration(
                      labelText: AppStrings.phoneNumber,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.grey3B4051),
                      ),
                      counter: SizedBox.shrink(),
                    ),
                    onChanged: (phone) {
                      printDebug(phone.completeNumber);
                    },
                  ),
                ),
                SizedBox(height: 180.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 33.w),
                  child: AppCommonButton(
                    buttonColor: AppColors.appColor,
                    onPressed: () {
                      AppNavigation.pushNamed(
                          context, AppRoutes.otpVerification);
                    },
                    label: AppStrings.loginCaps,
                    labelStyle:
                        AppStyles.font16.medium.colored(AppColors.whiteF9),
                    suffix: Image.asset(
                      AppImages.arrow,
                      color: AppColors.whiteF9,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                TextButton(
                  onPressed: () {
                    // Navigate to the sign-up screen
                    AppNavigation.pushNamed(context, AppRoutes.signUp);
                  },
                  child: Text(
                    AppStrings.orCreateMyAccountCaps,
                    style: AppStyles.font15.normal.colored(AppColors.grey50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
