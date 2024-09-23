import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/utils/app_colors.dart';
import 'package:manchaha/utils/app_common_button.dart';
import 'package:manchaha/utils/app_navigation.dart';
import 'package:manchaha/utils/global.dart';
import 'package:manchaha/utils/style/app_styles.dart';

import '../../../utils/app_images.dart';
import '../../../utils/app_methods.dart';
import '../../../utils/app_route_names.dart';
import '../../../utils/app_strings.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _initialise();
    });
  }

  _initialise() async {
    await ScreenUtil.ensureScreenSize().then((_) {
      setState(() {});
    });
  }

  void loginWithPhone() {
    printDebug('login');
  }

  void createNew() {
    printDebug('create new');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0.1,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.appColor,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // alignment: Alignment.center,
          children: [
            Image.asset(
              AppImages.login,
              width: w,
            ),
            gapH((h * 0.08).h),
            Container(
              width: w, // Adjust the width as needed
              // height: 200.h, // Adjust the height as needed
              padding: EdgeInsets.symmetric(horizontal: 33.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // SizedBox(height: 20.h),
                  AppCommonButton(
                    onPressed: () {
                      AppNavigation.pushNamed(context, AppRoutes.login);
                    },
                    label: AppStrings.loginWithPhoneCaps,
                    suffix: Image.asset(AppImages.arrow),
                  ),
                  SizedBox(height: 20.h),
                  TextButton(
                    onPressed: () {
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
          ],
        ),
      ),
    );
  }
}
