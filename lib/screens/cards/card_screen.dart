import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../components/my_cards.dart';
import '../../shimmer/shimmer.dart';
import '../../utils/app_navigation.dart';
import '../../utils/app_route_names.dart';
import '../../utils/app_strings.dart';
import '../../utils/global.dart';
import '../../utils/style/app_styles.dart';
import '../commons/appbar/paymensts_appbar.dart';
import '../commons/bottom_button/bottom_button.dart';
import '../commons/bottom_container/bottom_container_widgets.dart';
import 'widgets/payments_modes_buttons.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  int? _selectedIconIndex;
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

  void _selectIcon(int index) {
    setState(() {
      _selectedIconIndex = index;
    });
  }

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PaymentsAppBar(
        title: Text(
          AppStrings.orderBilling,
          style: AppStyles.font24.medium.colored(AppColors.black1F),
        ),
        bgColor: AppColors.white,
        centerTitle: false,
        showBackButton: true,
        elevation: 3,
        shadowColor: AppColors.black0,
        automaticallyImplyLeading: true,
        leadingIconColor: AppColors.black0,
      ), // White background color
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomPaymentIcon(
                  icon: Icons.wallet,
                  isSelected: _selectedIconIndex == 0,
                  onTap: () => _selectIcon(0),
                  height: 70.h,
                  width: 122.w,
                  initialColor: AppColors.white,
                  selectedColor: AppColors.appColor,
                  iconSize: 30.sp,
                  borderWidth: 1.5.w,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                CustomPaymentIcon(
                  icon: Icons.paypal,
                  isSelected: _selectedIconIndex == 1,
                  onTap: () => _selectIcon(1),
                  height: 70.h,
                  width: 122.w,
                  initialColor: AppColors.white,
                  selectedColor: AppColors.appColor,
                  iconSize: 30.sp,
                  borderWidth: 1.5.w,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                CustomPaymentIcon(
                  icon: Icons.account_balance,
                  isSelected: _selectedIconIndex == 2,
                  onTap: () => _selectIcon(2),
                  height: 70.h,
                  width: 122.w,
                  initialColor: AppColors.white,
                  selectedColor: AppColors.appColor,
                  iconSize: 30.sp,
                  borderWidth: 1.5.w,
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ],
            ),
            SizedBox(height: 29.h),
            SizedBox(
              width: double.infinity,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 197.h,
                  // Height of the cards
                  enlargeCenterPage: false,
                  // Enlarge the center card
                  autoPlay: false,
                  // Auto scroll off, if you want to enable auto-scrolling, set it to true
                  enableInfiniteScroll: false,
                  // Infinite scroll enabled
                  viewportFraction: 0.8,
                  // Viewport size fraction for showing partial next/previous card
                  scrollDirection: Axis.horizontal,
                  //optional h ye
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: const [
                  MyCards(
                    cardNumber: 1234567812345678,
                    numb: 1234,
                    expiryMonth: 12,
                    expiryYear: 34,
                    cardHolderName: 'VISHAL SHARMA',
                    color: Colors.deepPurple,
                  ),
                  MyCards(
                    cardNumber: 1234567812345678,
                    numb: 1234,
                    expiryMonth: 12,
                    expiryYear: 34,
                    cardHolderName: 'ATUL SHARMA',
                    color: Colors.green,
                  ),
                  MyCards(
                    cardNumber: 1234567812345678,
                    numb: 1234,
                    expiryMonth: 12,
                    expiryYear: 34,
                    cardHolderName: 'HIMANSHU SHARMA',
                    color: Colors.blueAccent,
                  ),
                  MyCards(
                    cardNumber: 1234567812345678,
                    numb: 1234,
                    expiryMonth: 12,
                    expiryYear: 34,
                    cardHolderName: 'NITIN SHARMA',
                    color: Color.fromARGB(255, 211, 190, 4),
                  ),
                ],
              ),
            ),
            _isLoading
                ? const SizedBox.shrink()
                : AnimatedSmoothIndicator(
                    activeIndex: _current,
                    count: 4,
                    effect: JumpingDotEffect(
                      dotHeight: 8.h,
                      dotWidth: 8.w,
                      jumpScale: 0.0,
                      verticalOffset: 5.h,
                      activeDotColor: const Color(0xFF1C4DD7),
                      dotColor: const Color(0xFFE5E7EB),
                    ),
                  ),
            SizedBox(height: 84.h),
            _isLoading
                ? CustomShimmer(width: w, height: 200.h)
                : Container(
                    decoration: const BoxDecoration(
                      color: Colors.white, // White background color
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.h, horizontal: 15.w),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 17.w),
                            child: Row(
                              children: [
                                Text(AppStrings.orderDetails,
                                    style: AppStyles.font17.medium
                                        .colored(AppColors.black1F)),
                                SizedBox(width: 3.w), // Used space b/w texts
                                Text(
                                  '(3 Items)',
                                  style: AppStyles.font14.medium
                                      .colored(AppColors.grey6B),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),
                          _buildOrderDetailRow(
                              AppStrings.totalPriceColon, '2550.00 \u{20B9}'),
                          _buildOrderDetailRow(
                              AppStrings.discountColon, '- 168.00 \u{20B9}'),
                          _buildOrderDetailRow(
                              AppStrings.deliveryFeeColon, '00.00 \u{20B9}'),
                          Divider(thickness: 0.25.h),
                          SizedBox(height: 10.h),
                          _buildOrderDetailRow(
                              AppStrings.totalAmountCaps, '2382.00 \u{20b9}'),
                          Divider(thickness: 0.25.h),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),

      bottomNavigationBar: CommonBottomContainer(
        child: BottomCommonButton(
          onPressed: () {
            AppNavigation.pushNamed(context, AppRoutes.selectedCards);
          },
          label: AppStrings.checkout,
          labelStyle: AppStyles.font18.medium.colored(AppColors.white),
          height: 60.h,
          width: 395.w,
        ),
      ),
    );
  }

  Widget _buildOrderDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 9.h),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Fixes spacing between text
        children: [
          Text(
            label,
            style: AppStyles.font15.medium.copyWith(color: AppColors.greyA1),
          ),
          SizedBox(width: 3.w), // Space between the label and value
          Text(value, style: AppStyles.font16.medium.colored(AppColors.black0)),
        ],
      ),
    );
  }
}
