import 'package:flutter/material.dart';
import 'package:manchaha/utils/app_colors.dart';
import 'package:manchaha/utils/global.dart';
import 'package:manchaha/utils/style/app_styles.dart';

class UnderDevelopmentScreen extends StatelessWidget {
  const UnderDevelopmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: h,
        width: w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Under Development",
              style: AppStyles.font18.semiBold.colored(AppColors.black19),
            )
          ],
        ),
      ),
    );
  }
}









  // bool _isLoading = true; 

  // @override
  // void initState() {
  //   super.initState();
  //   phoneController = TextEditingController();

    // // Simulate loading time for shimmer effect (3 seconds)
    // Future.delayed(const Duration(seconds: 3), () {
    //   setState(() {
    //     _isLoading = false; 
    //   });
    // });
  // }