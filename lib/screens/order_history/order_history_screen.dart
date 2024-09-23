import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/screens/commons/appbar/paymensts_appbar.dart';
import 'package:manchaha/utils/app_images.dart';
import 'package:manchaha/utils/app_strings.dart';
import '../../utils/app_colors.dart';
import '../../utils/global.dart';
import '../../utils/style/app_styles.dart';
import 'widgets/ongoing_product_container.dart';
import 'widgets/top_buttons_widgets.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  int _selectedIndex = 1;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  void handleButtonTap(int index) {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    setState(() {
      _selectedIndex = index; // Update the selected index on tap
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(ctx).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: PaymentsAppBar(
          title: Padding(
            padding: EdgeInsets.only(left: 17.0.w),
            child: Text(
              AppStrings.orderhistory,
              style: AppStyles.font24.medium.colored(AppColors.black1F),
            ),
          ),
          centerTitle: false,
          elevation: 2,
          actions: [
            Image.asset(
              AppImages.ubell,
              color: AppColors.black1F,
              height: 20.h,
              width: 19.w,
            ),
            SizedBox(width: 20.w),
            Image.asset(
              AppImages.ubag,
              color: AppColors.black1F,
              height: 20.h,
              width: 19.w,
            ),
            SizedBox(width: 20.w),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              SizedBox(
                height: (h * 0.03).h,
              ),
              Container(
                padding: const EdgeInsets.all(11),
                decoration: BoxDecoration(
                  color: AppColors.greyF5,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OrderTypeButton(
                      text: AppStrings.ongoing,
                      isSelected: _selectedIndex == 1,
                      onTap: () {
                        handleButtonTap(1);
                      },
                    ),
                    OrderTypeButton(
                      text: AppStrings.completed,
                      isSelected: _selectedIndex == 2,
                      onTap: () {
                        handleButtonTap(2);
                      },
                    ),
                    OrderTypeButton(
                      text: AppStrings.cancel,
                      isSelected: _selectedIndex == 3,
                      onTap: () {
                        handleButtonTap(3);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: (h * 0.03).h),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      /// ongoing history
                      if (_selectedIndex == 1) ...[
                        CustomProductContainerWidget(
                          imageUrl: 'assets/collection1/cartitem1.png',
                          description: 'loren ispum lorem',
                          price: '\u{20B9}850',
                          size: 'L',
                          quantity: '1',
                          orderStatus: 'Pending',
                          showTrackOrderButton: true,
                          showCancelOrderButton: true,
                          trackOrderButtonText: AppStrings.trackOrder,
                          cancelOrderButtonText: AppStrings.cancelOrder,
                          trackOrderButtonColor: AppColors.appColor,
                          cancelOrderButtonColor: AppColors.redFC,
                          onTrackOrderPressed: () {
                            // Navigate to Track Order screen
                          },
                          onCancelOrderPressed: () {
                            // Handle cancel order
                          },
                        ),
                        SizedBox(height: 15.h),
                        CustomProductContainerWidget(
                          imageUrl: 'assets/collection1/cartitem2.png',
                          description: 'loren ispum lorem',
                          price: '\u{20B9}850',
                          size: 'L',
                          quantity: '1',
                          orderStatus: 'Pending',
                          showTrackOrderButton: true,
                          showCancelOrderButton: true,
                          trackOrderButtonText: AppStrings.trackOrder,
                          cancelOrderButtonText: AppStrings.cancelOrder,
                          trackOrderButtonColor: AppColors.appColor,
                          cancelOrderButtonColor: AppColors.redFC,
                          onTrackOrderPressed: () {
                            // Navigate to Track Order screen
                          },
                          onCancelOrderPressed: () {
                            // Handle cancel order
                          },
                        ),
                        SizedBox(height: 15.h),
                        CustomProductContainerWidget(
                          imageUrl: 'assets/collection1/cartitem3.png',
                          description: 'loren ispum lorem',
                          price: '\u{20B9}850',
                          size: 'L',
                          quantity: '1',
                          orderStatus: 'Pending',
                          showTrackOrderButton: true,
                          showCancelOrderButton: true,
                          trackOrderButtonText: AppStrings.trackOrder,
                          cancelOrderButtonText: AppStrings.cancelOrder,
                          trackOrderButtonColor: AppColors.appColor,
                          cancelOrderButtonColor: AppColors.redFC,
                          onTrackOrderPressed: () {
                            // Navigate to Track Order screen
                          },
                          onCancelOrderPressed: () {
                            // Handle cancel order
                          },
                        ),
                      ],

                      ///completed history
                      if (_selectedIndex == 2) ...[
                        CustomProductContainerWidget(
                          imageUrl: 'assets/collection1/cartitem1.png',
                          description: 'loren ispum lorem',
                          price: '\u{20B9}850',
                          size: 'L',
                          quantity: '1',
                          orderStatus: 'completed',
                          showTrackOrderButton: true,
                          showCancelOrderButton: true,
                          trackOrderButtonText: AppStrings.exchange,
                          cancelOrderButtonText: AppStrings.returns,
                          trackOrderButtonColor: AppColors.appColor,
                          cancelOrderButtonColor: AppColors.appColor,
                          onTrackOrderPressed: () {
                            // Navigate to Track Order screen
                          },
                          onCancelOrderPressed: () {
                            // Handle cancel order
                          },
                        ),
                        SizedBox(height: 15.h),
                        CustomProductContainerWidget(
                          imageUrl: 'assets/collection1/cartitem2.png',
                          description: 'loren ispum lorem',
                          price: '\u{20B9}850',
                          size: 'L',
                          quantity: '1',
                          orderStatus: 'completed',
                          showTrackOrderButton: true,
                          showCancelOrderButton: true,
                          trackOrderButtonText: AppStrings.exchange,
                          cancelOrderButtonText: AppStrings.returns,
                          trackOrderButtonColor: AppColors.appColor,
                          cancelOrderButtonColor: AppColors.appColor,
                          onTrackOrderPressed: () {
                            // Navigate to Track Order screen
                          },
                          onCancelOrderPressed: () {
                            // Handle cancel order
                          },
                        ),
                        SizedBox(height: 15.h),
                        CustomProductContainerWidget(
                          imageUrl: 'assets/collection1/cartitem3.png',
                          description: 'loren ispum lorem',
                          price: '\u{20B9}850',
                          size: 'L',
                          quantity: '1',
                          orderStatus: 'completed',
                          showTrackOrderButton: true,
                          showCancelOrderButton: true,
                          trackOrderButtonText: AppStrings.exchange,
                          cancelOrderButtonText: AppStrings.returns,
                          trackOrderButtonColor: AppColors.appColor,
                          cancelOrderButtonColor: AppColors.appColor,
                          onTrackOrderPressed: () {
                            // Navigate to Track Order screen
                          },
                          onCancelOrderPressed: () {
                            // Handle cancel order
                          },
                        ),
                      ],

                      ///canceled history
                      if (_selectedIndex == 3) ...[
                        const CustomProductContainerWidget(
                          imageUrl: 'assets/collection1/cartitem1.png',
                          description: 'loren ispum lorem',
                          price: '\u{20B9}850',
                          size: 'L',
                          quantity: '1',
                          orderStatus: 'cancel',
                          showDivider: false,
                          showTrackOrderButton: false,
                          showCancelOrderButton: false,
                        ),
                        SizedBox(height: 15.h),
                        const CustomProductContainerWidget(
                          imageUrl: 'assets/collection1/cartitem2.png',
                          description: 'loren ispum lorem',
                          price: '\u{20B9}850',
                          size: 'L',
                          quantity: '1',
                          orderStatus: 'cancel',
                          showDivider: false,
                          showTrackOrderButton: false,
                          showCancelOrderButton: false,
                        ),
                        SizedBox(height: 15.h),
                        const CustomProductContainerWidget(
                          imageUrl: 'assets/collection1/cartitem3.png',
                          description: 'loren ispum lorem',
                          price: '\u{20B9}850',
                          size: 'L',
                          quantity: '1',
                          orderStatus: 'cancel',
                          showDivider: false,
                          showTrackOrderButton: false,
                          showCancelOrderButton: false,
                        ),
                      ],
                      SizedBox(height: 20.h),
                      const Divider(
                        thickness: 0.5,
                        color: AppColors.greyE6,
                      ),
                      SizedBox(height: (h * 0.15).h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
