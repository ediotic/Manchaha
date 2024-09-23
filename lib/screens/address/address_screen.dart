import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/screens/commons/appbar/paymensts_appbar.dart';
import 'package:manchaha/utils/app_navigation.dart';
import 'package:manchaha/utils/app_route_names.dart';
import 'package:manchaha/utils/app_strings.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/style/app_styles.dart';
import '../commons/bottom_button/bottom_button.dart';
import '../commons/bottom_container/bottom_container_widgets.dart';
import 'widgets/address_container_widgets.dart';

class CustomerAddress extends StatefulWidget {
  const CustomerAddress({super.key});

  @override
  CustomerAddressState createState() => CustomerAddressState();
}

class CustomerAddressState extends State<CustomerAddress> {
  int _selectedAddress = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PaymentsAppBar(
          title: Text(
            AppStrings.addressAppbar,
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
          child: Column(
            children: [
              AddressContainer(
                title: AppStrings.homeAddress,
                address: 'Street no, 20, Building 32, Floor Apar...',
                value: 0,
                groupValue: _selectedAddress,
                onChanged: (int? newValue) {
                  setState(() {
                    _selectedAddress = newValue!;
                  });
                },
              ),
              AddressContainer(
                title: AppStrings.officeAddress,
                address: 'Street no, 15, Building 20, Floor 2...',
                value: 1,
                groupValue: _selectedAddress,
                onChanged: (int? newValue) {
                  setState(() {
                    _selectedAddress = newValue!;
                  });
                },
              ),
              AddressContainer(
                title: AppStrings.apartmentAddress,
                address: 'Street no, 15, Building 20, Floor 2...',
                value: 2,
                groupValue: _selectedAddress,
                onChanged: (int? newValue) {
                  setState(() {
                    _selectedAddress = newValue!;
                  });
                },
              ),
              AddressContainer(
                title: AppStrings.parentsHome,
                address: 'Street no, 15, Building 20, Floor 2...',
                value: 3,
                groupValue: _selectedAddress,
                onChanged: (int? newValue) {
                  setState(() {
                    _selectedAddress = newValue!;
                  });
                },
              ),
              SizedBox(
                height: 17.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SizedBox(
                  width: double.infinity,
                  height: 55.h,
                  child: OutlinedButton(
                    onPressed: () {
                      AppNavigation.pushNamed(context, AppRoutes.newAddress);
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: AppColors.greyD1,
                          width: 1.0.w), // Border color and width
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.r), // Rounded corners
                      ),
                    ),
                    child: Text(
                      '+ ${AppStrings.addNewAddress}',
                      style: AppStyles.font16.medium.colored(AppColors.black1F),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 151.h,
              ),
            ],
          ),
        ),
        bottomNavigationBar: CommonBottomContainer(
          child: BottomCommonButton(
            onPressed: () {
              AppNavigation.pushNamed(context, AppRoutes.myCards);
            },
            label: AppStrings.applyNow,
            labelStyle: AppStyles.font18.medium.colored(AppColors.white),
            height: 60.h,
            width: 395.w,
          ),
        ),
      ),
    );
  }
}
