import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/utils/app_images.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// import '../../utils/app_methods.dart';
import '../../shimmer/shimmer.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_navigation.dart';
import '../../utils/app_route_names.dart';
import '../../utils/app_strings.dart';
import '../../utils/global.dart';
import '../../utils/random_otp_generate_screen.dart';
import '../../utils/style/app_styles.dart';
import '../commons/bottom_button/bottom_button.dart';
import '../commons/bottom_container/bottom_container_widgets.dart';

class PhoneOTPVerificationScreen extends StatefulWidget {
  const PhoneOTPVerificationScreen({super.key});

  @override
  State<PhoneOTPVerificationScreen> createState() =>
      _PhoneOTPVerificationScreenState();
}

class _PhoneOTPVerificationScreenState
    extends State<PhoneOTPVerificationScreen> {
  String phoneNumber = '7836738760';

  

  late TextEditingController otpController;
            bool _isLoading = true; 

 @override
  void initState() {
    super.initState();
       
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _isLoading = false; // Stop loading after 3 seconds
              otpController = TextEditingController();
    _setInitialOtp();
        });
      });
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  Future<void> _setInitialOtp() async {
    // Simulate a delay to mimic asynchronous OTP generation
    await Future.delayed(const Duration(seconds: 10));
    otpController.text = generateOTP();
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
          child: _isLoading ? CustomShimmer(width: w-80, height: 500.h) :Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 240, 240, 240),
                radius: 60.r, // ScreenUtil applied here
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      AppImages.otpVerificaiton,
                      width: 120.w, // ScreenUtil applied here
                      height: 120.h, // ScreenUtil applied here
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h), // ScreenUtil applied here
              Text(AppStrings.verifyYourAccount,
                  style: AppStyles.font26.semiBold.colored(AppColors.black1F)),
              Text(
                AppStrings.weAreSendingOTPToValidateYour,
                style: AppStyles.font16.normal.colored(AppColors.grey91),
              ),
              Text(
                AppStrings.moblibeNumberHangOn,
                style: AppStyles.font16.normal.colored(AppColors.grey91),
              ),
              SizedBox(height: 20.h), // ScreenUtil applied here
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 70.w), // ScreenUtil applied here
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
                    // ScreenUtil applied here
                    fieldHeight: 50.h,
                    // ScreenUtil applied here
                    fieldWidth: 50.w,
                    // ScreenUtil applied here
                    activeColor: const Color(0xFF52C1E1),
                    selectedColor: const Color(0xFF52C1E1),
                    inactiveColor: Colors.grey,
                    activeFillColor: const Color(0xFF52C1E1),
                    selectedFillColor: const Color(0xFF52C1E1),
                    inactiveFillColor: Colors.white,
                  ),
                  textStyle: AppStyles.font24.normal.colored(AppColors.white),
                  backgroundColor: Colors.transparent,
                  keyboardType: TextInputType.number,
                  enableActiveFill: true,
                ),
              ),
              SizedBox(height: 31.h), // ScreenUtil applied here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.sMSHasBeenSentTo,
                    style: AppStyles.font16.normal.colored(AppColors.black1F),
                  ),
                  Text(
                    '+91 $phoneNumber',
                    style: AppStyles.font16.normal.colored(AppColors.black1F),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: CommonBottomContainer(
          child: BottomCommonButton(
            onPressed: () {
              AppNavigation.goNamed(context, AppRoutes.successPayments);
            },
            label: AppStrings.submitNow,
            labelStyle: AppStyles.font18.medium.colored(AppColors.white),
            height: 60.h,
            width: 395.w,
          ),
        ),
      ),
    );
  }
}
