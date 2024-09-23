import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/my_cards.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_navigation.dart';
import '../../utils/app_route_names.dart';
import '../../utils/app_strings.dart';
import '../../utils/style/app_styles.dart';
import '../commons/appbar/paymensts_appbar.dart';
import '../commons/bottom_button/bottom_button.dart';
import '../commons/bottom_container/bottom_container_widgets.dart';
import 'widgets/cards_details_fields.dart';

class SelectedCardScreen extends StatelessWidget {
  final MyCards? selectedCard;

  const SelectedCardScreen({
    super.key,
    this.selectedCard,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PaymentsAppBar(
        title: Text(
          AppStrings.paymentMode,
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
          padding: EdgeInsets.only(left: 18.w, right: 17.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 39.h),
              SizedBox(
                height: 244.h,
                width: double.infinity,
                child: const Align(
                  alignment: Alignment.center,
                  child: MyCards(
                    cardNumber: 1234567812345678,
                    numb: 1234,
                    expiryMonth: 12,
                    expiryYear: 34,
                    cardHolderName: 'VISHAL SHARMA',
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              SizedBox(
                height: 28.h,
              ),
              Text(
                '1234567812345678',
                style: AppStyles.font18.bold.colored(AppColors.black47),
              ),
              SizedBox(
                height: 15.h,
              ),
              Divider(
                thickness: 1.h,
                color: AppColors.greyE4,
              ),
              SizedBox(
                height: 17.h,
              ),
              const CardDetailsFields(
                hintText: AppStrings.mMyy,
                borderColor: AppColors.greyE4,
                focusedBorderColor: AppColors.greyE4,
                enabledBorderColor: AppColors.greyE4,
              ),
              SizedBox(
                height: 17.h,
              ),
              const CardDetailsFields(
                hintText: AppStrings.cvv,
                borderColor: AppColors.greyE4,
                focusedBorderColor: AppColors.greyE4,
                enabledBorderColor: AppColors.greyE4,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CommonBottomContainer(
        child: BottomCommonButton(
          onPressed: () {
            AppNavigation.pushNamed(context, AppRoutes.otpPayments);
          },
          label: AppStrings.proceedNow,
          labelStyle: AppStyles.font18.medium.colored(AppColors.white),
          height: 60.h,
          width: 395.w,
        ),
      ),
    );
  }
}
