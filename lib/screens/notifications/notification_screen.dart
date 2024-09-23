import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/utils/app_images.dart';
import 'package:manchaha/utils/app_strings.dart';

import '../../shimmer/shimmer.dart';
import '../../utils/app_colors.dart';
import '../../utils/style/app_styles.dart';
import '../commons/appbar/paymensts_appbar.dart';
import 'widget/noti_container.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
        appBar: PaymentsAppBar(
          title: Text(
            AppStrings.noti,
            style: AppStyles.font24.medium.colored(AppColors.black1F),
          ),
          bgColor: AppColors.white,
          centerTitle: false,
          showBackButton: true,
          elevation: 3,
          shadowColor: AppColors.black0,
          automaticallyImplyLeading: true,
          leadingIconColor: AppColors.black0,
          actions: [
            // Padding(padding: EdgeInsets.symmetric(horizontal: 20.w)),
            Image.asset(
              AppImages.ubell,
              color: AppColors.black1F,
              height: 27.h,
              width: 23.w,
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               _isLoading? CustomShimmer(width: 100.w, height:40.h) : const Text('2 0ct 23'),
                SizedBox(height: 8.h),
                const NotificationContainer(
                  title: "Lorem Ipsum is simply dummy text",
                  subtitle: "Lorem Ipsum is simply dummy text of the printing",
                  iconPath: AppImages.notiBag,
                  iconBackgroundColor: AppColors.whiteF9,
                ),
                const NotificationContainer(
                  title: "Lorem Ipsum is simply dummy text",
                  subtitle: "Lorem Ipsum is simply dummy text of the printing",
                  iconPath: AppImages.notiVan,
                  iconBackgroundColor: AppColors.whiteF9,
                ),
                const NotificationContainer(
                  title: "Lorem Ipsum is simply dummy text",
                  subtitle: "Lorem Ipsum is simply dummy text of the printing",
                  iconPath: AppImages.smallbox,
                  iconBackgroundColor: AppColors.whiteF9,
                ),
                const NotificationContainer(
                  title: "Lorem Ipsum is simply dummy text",
                  subtitle: "Lorem Ipsum is simply dummy text of the printing",
                  iconPath: AppImages.notiPercent,
                  iconBackgroundColor: AppColors.whiteF9,
                ),
              _isLoading? CustomShimmer(width: 100.w, height:40.h) :  const Text('2 0ct 23'),
                SizedBox(height: 8.h),
                const NotificationContainer(
                  title: "Lorem Ipsum is simply dummy text",
                  subtitle: "Lorem Ipsum is simply dummy text of the printing",
                  iconPath: AppImages.notiBag,
                  iconBackgroundColor: AppColors.whiteF9,
                ),
                const NotificationContainer(
                  title: "Lorem Ipsum is simply dummy text",
                  subtitle: "Lorem Ipsum is simply dummy text of the printing",
                  iconPath: AppImages.notiVan,
                  iconBackgroundColor: AppColors.whiteF9,
                ),
                const NotificationContainer(
                  title: "Lorem Ipsum is simply dummy text",
                  subtitle: "Lorem Ipsum is simply dummy text of the printing",
                  iconPath: AppImages.smallbox,
                  iconBackgroundColor: AppColors.whiteF9,
                ),
                const NotificationContainer(
                  title: "Lorem Ipsum is simply dummy text",
                  subtitle: "Lorem Ipsum is simply dummy text of the printing",
                  iconPath: AppImages.notiPercent,
                  iconBackgroundColor: AppColors.whiteF9,
                ),
              ],
            ),
          ),
        ));
  }
}
