import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/screens/commons/bottom_button/bottom_button.dart';
import 'package:manchaha/utils/app_images.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/global.dart';
import '../../utils/style/app_styles.dart';
import '../address/widgets/address_textfields_widgets.dart';
import '../commons/appbar/paymensts_appbar.dart';
import 'widgets/dropdown_widget.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;
  String? gender;

  final List<String> days = List.generate(31, (index) => '${index + 1}');
  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec'
  ];
  final List<String> years = List.generate(50, (index) => '${1970 + index}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PaymentsAppBar(
        title: Text(
          AppStrings.myProfile,
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(AppImages.editProfileName),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 45.r,
                  backgroundColor: AppColors.appColor.withOpacity(0.10),
                  child: Stack(
                    children: [
                      Image.asset(
                        AppImages.profileicon,
                        height: (h * 0.11).h,
                        width: (w * 0.24).w,
                      ),
                      Positioned(
                        top: 45.h,
                        left: 45.w,
                        child: Image.asset(
                          AppImages.editProfile,
                          height: 32.h,
                          width: 32.w,
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Lorem Ipsum',
                style: AppStyles.font18.semiBold.colored(AppColors.black44),
              ),
              Text(
                'Lorem Ipsum@gmail.com',
                style: AppStyles.font15.medium.colored(AppColors.grey87),
              ),
              SizedBox(
                height: 11.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: AppColors.greyE6, width: 1.w),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black0.withOpacity(0.12),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(3, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.fullName,
                      style: AppStyles.font12.normal.colored(AppColors.grey87),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    AddressTextFields(
                      width: (w * 0.84).w,
                      height: 45.h,
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    Text(
                      AppStrings.emailAdd,
                      style: AppStyles.font12.normal.colored(AppColors.grey87),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    AddressTextFields(
                      width: (w * 0.84).w,
                      height: 45.h,
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    Text(
                      AppStrings.phoneNumber,
                      style: AppStyles.font12.normal.colored(AppColors.grey87),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    AddressTextFields(
                      width: (w * 0.84).w,
                      height: 45.h,
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    Text(
                      AppStrings.dob,
                      style: AppStyles.font12.normal.colored(AppColors.grey87),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.0.w),
                            child: CustomDropdown(
                              hintText: 'Day',
                              items: days,
                              selectedItem: selectedDay,
                              onChanged: (value) {
                                setState(() {
                                  selectedDay = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                            child: CustomDropdown(
                              hintText: 'Mont',
                              items: months,
                              selectedItem: selectedMonth,
                              onChanged: (value) {
                                setState(() {
                                  selectedMonth = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0.w),
                            child: CustomDropdown(
                              hintText: 'Year',
                              items: years,
                              selectedItem: selectedYear,
                              onChanged: (value) {
                                setState(() {
                                  selectedYear = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    Text(
                      AppStrings.gender,
                      style: AppStyles.font12.normal.colored(AppColors.grey87),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      children: [
                        Radio(
                            value: AppStrings.male,
                            groupValue: gender,
                            fillColor:
                                WidgetStateProperty.all(AppColors.appColor),
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            }),
                        SizedBox(
                          width: 9.w,
                        ),
                        Text(
                          AppStrings.male,
                          style:
                              AppStyles.font15.medium.colored(AppColors.black0),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Radio(
                            value: AppStrings.female,
                            groupValue: gender,
                            fillColor:
                                WidgetStateProperty.all(AppColors.appColor),
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            }),
                        SizedBox(
                          width: 9.w,
                        ),
                        Text(
                          AppStrings.female,
                          style:
                              AppStyles.font15.medium.colored(AppColors.black0),
                        ),
                        SizedBox(
                          height: 26.h,
                        ),
                      ],
                    ),
                    BottomCommonButton(
                      onPressed: () {},
                      label: AppStrings.submitNow,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
