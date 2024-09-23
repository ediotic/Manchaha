import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/screens/commons/appbar/paymensts_appbar.dart';
import 'package:manchaha/screens/commons/bottom_button/bottom_button.dart';
import 'package:manchaha/utils/app_colors.dart';
import 'package:manchaha/utils/style/app_styles.dart';

import '../../shimmer/shimmer.dart';
import '../../utils/app_navigation.dart';
import '../../utils/app_route_names.dart';
import '../../utils/global.dart';
import 'widgets/cart_items_widgets.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  int _count = 1; // Initial value for the item count
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

  void _increaseCount() {
    setState(() {
      _count++;
    });
  }

  void _decreaseCount() {
    setState(() {
      if (_count > 0) {
        _count--;
      }
    });
  }

  void _deleteItem() {
    // Implement delete functionality
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PaymentsAppBar(
        title: Text(
          'My Cart',
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
          padding: const EdgeInsets.only(right: 17, left: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 32.h,
              ),
              CartItemWidget(
                imageUrl: 'assets/collection1/cartitem1.png',
                description: 'lorem ipsum is simple text ',
                price: '\u{20B9}850',
                originalPrice: '₹900',
                discount: '15% OFF',
                size: 'L',
                count: _count,
                onIncrease: _increaseCount,
                onDecrease: _decreaseCount,
                onDelete: _deleteItem,
              ),
              SizedBox(
                height: 16.h,
              ),
              CartItemWidget(
                imageUrl: 'assets/collection1/cartitem2.png',
                description: 'lorem ipsum is simple text',
                price: '\u{20B9}850',
                originalPrice: '₹900',
                discount: '15% OFF',
                size: 'L',
                count: _count,
                onIncrease: _increaseCount,
                onDecrease: _decreaseCount,
                onDelete: _deleteItem,
              ),
              SizedBox(
                height: 16.h,
              ),
              CartItemWidget(
                imageUrl: 'assets/collection1/cartitem3.png',
                description: 'lorem ipsum is simple text',
                price: '\u{20B9}850',
                originalPrice: '₹900',
                discount: '15% OFF',
                size: 'L',
                count: _count,
                onIncrease: _increaseCount,
                onDecrease: _decreaseCount,
                onDelete: _deleteItem,
              ),
              SizedBox(height: 22.h),
              _isLoading
                  ? CustomShimmer(
                      width: w,
                      height: 40.h,
                    )
                  : Text(
                      'Shipping Address',
                      style: AppStyles.font18.medium.colored(AppColors.black1F),
                    ),
              SizedBox(height: 22.h),
              _isLoading
                  ? CustomShimmer(
                      width: w,
                      height: 80.h,
                    )
                  : Container(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 10.h, right: 11.w),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'Add New Address',
                                    style: AppStyles.font12.normal
                                        .colored(AppColors.appColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12.w),
                            child: Row(
                              children: [
                                Image.asset('assets/images/addressicon.png'),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  'Aman Chouhan',
                                  style: AppStyles.font16.medium
                                      .colored(AppColors.black1F),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 2.39.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 38.w),
                            child: Text(
                              'Street no, 20, Building 32, Floor 3 Apartment 534 Dokki, Jiza Pin 477456',
                              style: AppStyles.font14.normal
                                  .colored(AppColors.grey93),
                            ),
                          ),
                          SizedBox(
                            height: 22.h,
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                height: 22.h,
              ),
              _isLoading
                  ? CustomShimmer(
                      width: w,
                      height: 70.h,
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 52.h,
                            padding: EdgeInsets.symmetric(horizontal: 12.34.w),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(
                                  color: const Color(0xFF9EA8B2), width: 1.w),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter Promo Code',
                                hintStyle: AppStyles.font15.normal
                                    .colored(AppColors.grey9C),
                                border: InputBorder.none,
                                prefixIcon:
                                    Image.asset('assets/images/coupon.png'),
                              ),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 13.w,
                        ),
                        BottomCommonButton(
                          onPressed: () {},
                          label: 'ADD',
                          labelStyle:
                              AppStyles.font14.medium.colored(AppColors.white),
                          backgroundColor: AppColors.black1F,
                          height: 52.h,
                          width: 84.w,
                          borderRadius: BorderRadius.circular(20.r),
                        )
                      ],
                    ),
              SizedBox(
                height: 39.5.h,
              ),
              _isLoading
                  ? CustomShimmer(
                      width: w,
                      height: 70.h,
                    )
                  : Padding(
                      padding: EdgeInsets.only(left: 18.w),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Price Details',
                              style: AppStyles.font17.medium
                                  .colored(AppColors.black1F),
                            ),
                            TextSpan(
                              text: '(3 Items)',
                              style: AppStyles.font14.medium
                                  .colored(AppColors.grey6B),
                            ),
                          ],
                        ),
                      ),
                    ),
              SizedBox(
                height: 9.h,
              ),
              _isLoading
                  ? CustomShimmer(
                      width: w,
                      height: 30.h,
                    )
                  : _buildOrderDetailRow('Total Price:', '2550.00 \u{20B9}'),
              _isLoading
                  ? CustomShimmer(
                      width: w,
                      height: 30.h,
                    )
                  : _buildOrderDetailRow('Discount:', '- 168.00 \u{20B9}'),
              _isLoading
                  ? CustomShimmer(
                      width: w,
                      height: 30.h,
                    )
                  : _buildOrderDetailRow('Delivery Fee:', '00.00 \u{20B9}'),
              Divider(
                thickness: 0.25.h,
                indent: 18.w,
                endIndent: 17.w,
              ),
              SizedBox(height: 10.h),
              _isLoading
                  ? CustomShimmer(
                      width: w,
                      height: 35.h,
                    )
                  : _buildOrderDetailRow('TOTAL AMOUNT', '2382.00 \u{20B9}'),
              Divider(thickness: 0.25.h, indent: 18.w, endIndent: 17.w),
              SizedBox(
                height: 36.h,
              ),
              _isLoading
                  ? CustomShimmer(
                      width: w,
                      height: 100.h,
                    )
                  : Container(
                      height: 130.h,
                      width: 430.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16.r), // ScreenUtil applied here
                        ),
                        color: AppColors.white.withOpacity(0),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.greyC8.withOpacity(0.13),
                            spreadRadius: 15.r, // ScreenUtil applied here
                            blurRadius: 2.r, // ScreenUtil applied here
                            offset: Offset(0, 2.h), // ScreenUtil applied here
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 32.h),
                      // ScreenUtil applied here
                      child: Container(
                        height: 00.h,
                        width: 395.w,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEDF1F6),
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment
                                    .center, // Center the text horizontally
                                children: [
                                  Text(
                                    'Total Price',
                                    style: AppStyles.font12.normal
                                        .colored(AppColors.grey6B),
                                  ),
                                  Text(
                                    '2382.00\u{20B9}',
                                    style: AppStyles.font20.semiBold
                                        .colored(AppColors.black1F),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    AppNavigation.pushNamed(
                                        context, AppRoutes.address);
                                  },
                                  child: Container(
                                    height: 60.h,
                                    width: 200.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.appColor,
                                      borderRadius: BorderRadius.circular(30.r),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(width: 8.w),
                                        Text(
                                          'Confirm Order',
                                          style: AppStyles.font18.medium
                                              .colored(AppColors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
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

  Widget _buildOrderDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 9.h),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Fixes spacing between text
        children: [
          Text(
            label,
            style: AppStyles.font15.medium
                .copyWith(color: const Color(0xFFA1A1A1)),
          ),
          SizedBox(width: 3.w), // Space between the label and value
          Text(value, style: AppStyles.font16.medium.colored(AppColors.black0)),
        ],
      ),
    );
  }
}
