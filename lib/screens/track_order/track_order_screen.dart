import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../../utils/global.dart';
import '../../utils/style/app_styles.dart';
import '../commons/appbar/paymensts_appbar.dart';
import 'widgets/time_line.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PaymentsAppBar(
        title: Text(
          AppStrings.trackOrder,
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
            height: 20.h,
            width: 19.w,
          ),
          SizedBox(
            width: 20.w,
          ),
          Image.asset(
            AppImages.ubag,
            color: AppColors.black1F,
            height: 20.h,
            width: 19.w,
          ),
          SizedBox(
            width: 20.w,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: (w * 0.8).h,
              child: const Center(child: Text('MAP')),
            ),
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r)),
                  color: AppColors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //  mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.orderStatus,
                    style: AppStyles.font22.medium.colored(AppColors.black1F),
                  ),
                  const Divider(
                    thickness: 0.6,
                    color: AppColors.greyE5E,
                  ),
                  Text(
                    AppStrings.deliveryTime,
                    style: AppStyles.font14.normal.colored(AppColors.grey9C),
                  ),
                  Row(
                    children: [
                      Container(
                        color: Colors.amber,
                        height: 16.h,
                        width: 16.h,
                        child: Image.asset(AppImages.clock),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        '30 Min',
                        style:
                            AppStyles.font18.medium.colored(AppColors.black1F),
                      )
                      //
                    ],
                  ),
                  const OrderTimelineTile(
                    title: AppStrings.order,
                    subtitle: 'Sun, 04th August 2024',
                    isFirst: true,
                    isCompleted: true,
                  ),
                  const OrderTimelineTile(
                    title: AppStrings.packed,
                    subtitle: 'Expected by Sun, 04th August 2024',
                    isCompleted: true,
                  ),
                  const OrderTimelineTile(
                    title: AppStrings.shipped,
                    subtitle: 'Expected by Sun, 04th August 2024',
                    isCompleted: false,
                  ),
                  const OrderTimelineTile(
                    title: AppStrings.delivery,
                    subtitle: 'Expected by Sun, 04th August 2024',
                    isLast: true,
                    isCompleted: false,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          // height: (h*0.06).h,
                          // width: (w*0.04).w,
                          height: 58.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            color: AppColors.appColor,
                          ),
                          child: Center(
                              child: Text(
                            AppStrings.needHelp,
                            style: AppStyles.font16.medium
                                .colored(AppColors.white),
                          )),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: AppColors.redFC,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          AppStrings.cancelOrder,
                          style:
                              AppStyles.font16.medium.colored(AppColors.redFC),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
