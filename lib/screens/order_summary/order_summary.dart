import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/screens/order_summary/widget/summary_container_widget.dart';
import 'package:manchaha/utils/app_images.dart';

import '../../components/my_cards.dart';
import '../../shimmer/shimmer.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/global.dart';
import '../../utils/style/app_styles.dart';
import '../commons/appbar/paymensts_appbar.dart';
import 'widget/bottom_container.dart';

class OrderSummaryScreen extends StatefulWidget {
  final MyCards? selectedCard;

  const OrderSummaryScreen({
    super.key,
    this.selectedCard,
  });

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
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
        backgroundColor: AppColors.white,
        appBar: PaymentsAppBar(
          title: Text(
            AppStrings.ordersummary,
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
                SizedBox(height: (h * 0.03).h),
                const OrderSummaryWidget(
                  imageUrl: 'assets/collection1/cartitem1.png',
                  description: 'lorem ipsum is simple text',
                  price: '\u{20B9}850',
                  originalPrice: '₹900',
                  discount: '15% OFF',
                  size: 'L',
                  quantity: '1',
                ),
                SizedBox(height: 15.h),
                const OrderSummaryWidget(
                  imageUrl: 'assets/collection1/cartitem1.png',
                  description: 'lorem ipsum is simple text',
                  price: '\u{20B9}850',
                  originalPrice: '₹900',
                  discount: '15% OFF',
                  size: 'L',
                  quantity: '1',
                ),
                SizedBox(height: 15.h),
                const OrderSummaryWidget(
                  imageUrl: 'assets/collection1/cartitem1.png',
                  description: 'lorem ipsum is simple text',
                  price: '\u{20B9}850',
                  originalPrice: '₹900',
                  discount: '15% OFF',
                  size: 'L',
                  quantity: '1',
                ),
                SizedBox(height: (h * 0.03).h),
               _isLoading? CustomShimmer(width: 100.w, height: 40.h) :  Text(
                  AppStrings.deliverTo,
                  style: AppStyles.font18.medium.colored(AppColors.black1F),
                ),
                SizedBox(
                  height: 12.h,
                ),
               _isLoading? CustomShimmer(width: w-80, height:200.h) : Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.greyC8.withOpacity(0.9),
                        offset: Offset(0, 1.h),
                        blurRadius: 13.r,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(13.r),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'Aman Chouhan',
                            style: AppStyles.font18.medium
                                .colored(AppColors.black1F),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.39.h,
                      ),
                      Text(
                        'Street no, 20, Building 32, Floor 3 Apartment 534 Dokki, Jiza Pin 477456',
                        style:
                            AppStyles.font14.normal.colored(AppColors.grey93),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            AppImages.scooter,
                            width: (w * 0.06).h,
                            height: (h * 0.03).h,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            'Delivery by Wed, Feb 02-Feb 4, 2024',
                            style: AppStyles.font14.medium
                                .colored(AppColors.black1F),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: (h * 0.03).h,
                ),
                _isLoading? CustomShimmer(width: w-40, height: 40.h) :Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.greyC8.withOpacity(0.9),
                          offset: Offset(0, 1.h),
                          blurRadius: 13.r,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(13.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${AppStrings.totalAmountCaps}:',
                          style: AppStyles.font15.semiBold
                              .colored(AppColors.grey6B),
                        ),
                        Text(
                          '2,550.00 ₹',
                          style: AppStyles.font16.semiBold
                              .colored(AppColors.black1F),
                        )
                      ],
                    )),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar:  _isLoading? CustomShimmer(width: w-80, height:100.h) : const BottomContainer());
  }
}
