import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/screens/commons/appbar/paymensts_appbar.dart';
import 'package:manchaha/utils/app_strings.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/style/app_styles.dart';
import '../../utils/app_navigation.dart';
import '../../utils/app_route_names.dart';
import '../commons/bottom_button/bottom_button.dart';
import '../commons/bottom_container/bottom_container_widgets.dart';
import 'widgets/address_textfields_widgets.dart';
import 'widgets/current_location_button.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  @override
  AddNewAddressState createState() => AddNewAddressState();
}

class AddNewAddressState extends State<AddNewAddress> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PaymentsAppBar(
          title: Text(
            AppStrings.addNewAddress,
            style: AppStyles.font24.medium.colored(AppColors.black1F),
          ),
          bgColor: AppColors.white,
          centerTitle: false,
          showBackButton: true,
          elevation: 3,
          shadowColor: AppColors.black0,
          automaticallyImplyLeading: true,
          leadingIconColor: AppColors.black0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 32.h,
                ),
                const CurrentLocationButton(),
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  AppStrings.name,
                  style: AppStyles.font13.normal.colored(AppColors.grey87),
                ),
                SizedBox(
                  height: 3.h,
                ),
                const AddressTextFields(),
                SizedBox(
                  height: 13.h,
                ),
                Text(
                  AppStrings.phoneNo,
                  style: AppStyles.font13.normal.colored(AppColors.grey87),
                ),
                SizedBox(
                  height: 3.h,
                ),
                const AddressTextFields(),
                SizedBox(
                  height: 13.h,
                ),
                Text(
                  AppStrings.flatNo,
                  style: AppStyles.font13.normal.colored(AppColors.grey87),
                ),
                SizedBox(
                  height: 3.h,
                ),
                const AddressTextFields(),
                SizedBox(
                  height: 13.h,
                ),
                Text(
                  AppStrings.areaStreet,
                  style: AppStyles.font13.normal.colored(AppColors.grey87),
                ),
                SizedBox(
                  height: 3.h,
                ),
                const AddressTextFields(),
                SizedBox(
                  height: 13.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.areaStreet,
                          style:
                              AppStyles.font13.normal.colored(AppColors.grey87),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        AddressTextFields(
                          width: 192.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.state,
                          style:
                              AppStyles.font13.normal.colored(AppColors.grey87),
                        ),
                        AddressTextFields(
                          width: 192.w,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 13.h,
                ),
                Text(
                  AppStrings.landmark,
                  style: AppStyles.font13.normal.colored(AppColors.grey87),
                ),
                SizedBox(
                  height: 3.h,
                ),
                const AddressTextFields(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CommonBottomContainer(
          child: BottomCommonButton(
            onPressed: () {
              AppNavigation.pushNamed(context, AppRoutes.address);
            },
            label: AppStrings.saveNow,
            labelStyle: AppStyles.font18.medium.colored(AppColors.white),
            height: 60.h,
            width: 395.w,
          ),
        ),
      ),
    );
  }
}
