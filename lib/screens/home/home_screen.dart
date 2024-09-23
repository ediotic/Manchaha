import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:manchaha/provider/base/provider_consumer.dart';
import 'package:manchaha/provider/controllers/home_provider.dart';
import 'package:manchaha/shimmer/shimmer.dart';
import 'package:manchaha/utils/app_colors.dart';
import 'package:manchaha/utils/app_route_names.dart';
import 'package:manchaha/utils/style/app_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../components/elevated_containers.dart';
import '../../components/images.dart';
import '../../components/timer.dart';
import '../../utils/app_images.dart';
import '../../utils/app_methods.dart';
import '../../utils/app_strings.dart';
import '../../utils/banner_round_images.dart';
import '../../utils/bgridviewbar.dart';
import '../../utils/down_banner.dart';
import '../../utils/global.dart';
import '../../utils/grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  bool isTapped = false;
  late TextEditingController searchCntrl;
  late FocusNode searchFocus;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ScreenUtil.ensureScreenSize();
      // Simulate loading time for shimmer effect (3 seconds)
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _isLoading = false; // Stop loading after 3 seconds
        });
      });
    });
    searchCntrl = TextEditingController();
    searchFocus = FocusNode();
  }

  @override
  void dispose() {
    searchCntrl.dispose();
    searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      // Appbar  starts ---->
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 10,
        surfaceTintColor: AppColors.tranparent,
        shadowColor: AppColors.greyC8.withOpacity(0.2),
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            printDebug('ye press');
          },
          icon: const Icon(Icons.dehaze_outlined),
        ),
        title: Text(
          'Home',
          style: AppStyles.font24.medium.colored(AppColors.black1F),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: InkWell(
              onTap: () {
                // Handle image tap
                printDebug('Notification image tapped');
              },
              child: Image.asset(
                AppImages.ubell,
                height: 23.h,
                color: AppColors.black1F,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: InkWell(
              onTap: () {
                printDebug('Bag image tapped');
              },
              child: Image.asset(
                AppImages.ubag,
                height: 23.h,
                color: AppColors.black1F,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),

      // Body start

      body: ProviderConsumer<HomeProvider>(
        defaultView: (context, provider, _) {
          return _defaultView(provider: provider);
        },
      ),
    );
  }

  Widget _defaultView({
    required HomeProvider provider,
  }) {
    return SingleChildScrollView(
      child:   Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: (h * 0.02).h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 19.w, vertical: 13.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyC8.withOpacity(0.5),
                  spreadRadius: 0.r,
                  blurRadius: 13.r,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: TextFormField(
              controller: searchCntrl,
              focusNode: searchFocus,
              onTap: () {
                GoRouter.of(context).pushNamed(AppRoutes.searchBar).then((_) {
                  searchFocus.unfocus();
                });
              },
              onChanged: (value) {
                printDebug('hello search bar');
              },
              decoration: InputDecoration(
                isDense: true,
                contentPadding:
                    EdgeInsets.only(left: 15.w, right: 15.w, top: 13.h),
                hintText: AppStrings.searchByProduct,
                hintStyle: const TextStyle(
                  color: AppColors.greyCF,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 24,
                  color: AppColors.greyCF,
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      // Handle image tap
                      printDebug('Notification image tapped');
                    },
                    child: Image.asset(
                      AppImages.suffixSearchIcon, // Path to your image asset
                      color: AppColors.black19,
                    ),
                  ),
                ),
                border: InputBorder.none,
              ),
            ),
          ),

          //  products -----> Headings --->

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.categories,
                  style: AppStyles.font18.semiBold.colored(AppColors.black1E),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            AppStrings.viewAll,
                            style: AppStyles.font15.normal
                                .colored(AppColors.grey6B),
                          ),
                          SizedBox(width: 5.w),
                          Icon(
                            Icons.arrow_forward,
                            color: AppColors.grey6B,
                            size: 12.sp,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          // top categories container  ---->
          SizedBox(
            height: 10.h,
          ),

          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedContainers(),
              ],
            ),
          ),

          //slider banner

          _isLoading
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 15.h),
                    CustomShimmer(
                      width: w,
                      height: 150.h,
                    ),
                  ],
                )
              : Padding(
                  padding: EdgeInsets.only(
                      bottom: 0.h, top: 30.h, right: 18.w, left: 18.w),
                  child: Column(
                    children: [
                      CarouselSlider(
                        items: const [
                          CRoundImages(
                            imageUrl: Cimages.promoBanner1,
                          ),
                          CRoundImages(
                            imageUrl: Cimages.promoBanner1,
                          ),
                          CRoundImages(
                            imageUrl: Cimages.promoBanner1,
                          ),
                          CRoundImages(
                            imageUrl: Cimages.promoBanner2,
                          ),
                        ],
                        options: CarouselOptions(
                          viewportFraction: 1,
                          enableInfiniteScroll: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          },
                        ),
                      ),

                      // Slider indicators
                      AnimatedSmoothIndicator(
                        activeIndex: _current,
                        count: 4,
                        effect: JumpingDotEffect(
                          dotHeight: 8.h,
                          dotWidth: 8.w,
                          jumpScale: 0.0,
                          verticalOffset: 0.h,
                          activeDotColor: AppColors.blue1C,
                          dotColor: AppColors.greyE5E,
                        ),
                      ),
                    ],
                  ),
                ),

          // collections container

          SizedBox(height: 20.h),

          _isLoading
              ? CustomShimmer(
                  width: w,
                  height: 200.h,
                )
              : Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.greyF7F,
                    borderRadius: BorderRadius.all(Radius.circular(23.r)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: 10.h, left: 23.w, right: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.dealOfTheDay,
                              style: AppStyles.font18.semiBold
                                  .colored(AppColors.black1E),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Text(
                                        AppStrings.viewAll,
                                        style: AppStyles.font15.normal
                                            .colored(AppColors.grey6B),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: AppColors.grey6B,
                                        size: 12.sp,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 7.w),
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 6.h),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.black22),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: const CountdownTimer(),
                          ),
                        ],
                      ),
                      // Grid images
                     _isLoading
              ? CustomShimmer(
                  width: w,
                  height:200.h,
                )
              :    Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        margin: const EdgeInsets.all(18),
                        color: AppColors.white,
                        // height: 470.h,
                        width: 390.w,
                        height: (h * 0.46).h,
                        // width: (w*0.9).w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          child: const GridViewBar(),
                        ),
                      ),
                    ],
                  ),
                ),

          // hot Selling category
          Padding(
            padding: EdgeInsets.only(top: 10.h, left: 18.w, right: 18.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.hotSelling,
                      style:
                          AppStyles.font18.semiBold.colored(AppColors.black1E),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text(
                                AppStrings.viewAll,
                                style: AppStyles.font15.normal
                                    .colored(AppColors.grey6B),
                              ),
                              SizedBox(width: 5.w),
                              Icon(
                                Icons.arrow_forward,
                                color: AppColors.grey6B,
                                size: 12.sp,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 11.h),

                // down grid bar
               _isLoading
              ? CustomShimmer(
                  width: w,
                  height:200.h,
                )
              :    Container(
                  margin: EdgeInsets.only(left: 15.w),
                  color: AppColors.white,
                  height: 200.h,
                  width: 390.w,
                  child: const BGridViewBar(),
                ),
                SizedBox(height: 33.h),

                // recomended category

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.recomendedForYou,
                      style:
                          AppStyles.font18.semiBold.colored(AppColors.black1E),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text(
                                AppStrings.viewAll,
                                style: AppStyles.font15.normal
                                    .colored(AppColors.grey6B),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: AppColors.grey6B,
                                size: 12.sp,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),

               _isLoading
              ? CustomShimmer(
                  width: w,
                  height:200.h,
                )
              :    Container(
                  margin: EdgeInsets.only(left: 15.w),
                  color: AppColors.white,
                  height: 215.h,
                  width: 390.w,
                  child: const BGridViewBar(),
                ),
                SizedBox(
                  height: 33.h,
                ),

                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.newOffers,
                          style: AppStyles.font18.semiBold
                              .colored(AppColors.black1E),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Text(
                                    AppStrings.viewAll,
                                    style: AppStyles.font15.normal
                                        .colored(AppColors.grey6B),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: AppColors.grey6B,
                                    size: 12.sp,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                      child: Column(
                        children: [
                          CarouselSlider(
                            items: [
                              DcImages(
                                imageUrl: Cimages.promoBanner1,
                                row: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'lorem ipsum is simple text',
                                          style: AppStyles.font15.normal
                                              .colored(AppColors.black30),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\u{20B9}850',
                                          style: AppStyles.font18.semiBold
                                              .colored(AppColors.black1E),
                                        ),
                                        SizedBox(
                                            width:
                                                3.w), // ScreenUtil applied here
                                        Text(
                                          '₹900',
                                          style: AppStyles.font15.normal
                                              .colored(AppColors.grey9C)
                                              .copyWith(
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                        ),
                                        SizedBox(width: 3.w),
                                        Text(
                                          '15% OFF',
                                          style: AppStyles.font14.normal
                                              .colored(AppColors.orange),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 3.h),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius:
                                              12.r, // ScreenUtil applied here
                                          backgroundColor: AppColors.yellow,
                                          child: Icon(
                                            Icons.star,
                                            color: AppColors.white,
                                            size: 18
                                                .sp, // ScreenUtil applied here
                                          ),
                                        ),
                                        SizedBox(width: 4.w),
                                        Text('4.5',
                                            style: AppStyles.font15.medium
                                                .colored(AppColors.black1E)),
                                        SizedBox(
                                          width: 4.w, // ScreenUtil applied here
                                        ),
                                        Text('(415)',
                                            style: AppStyles.font13.normal
                                                .colored(AppColors.grey6B)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              DcImages(
                                imageUrl: Cimages.promoBanner2,
                                row: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text('lorem ipsum is simple text',
                                            style: AppStyles.font15.normal
                                                .colored(AppColors.grey30)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\u{20B9}850',
                                          style: AppStyles.font18.semiBold
                                              .colored(AppColors.black1E),
                                        ),
                                        SizedBox(width: 3.w),
                                        Text(
                                          '₹900',
                                          style: AppStyles.font15.normal
                                              .colored(AppColors.grey9C)
                                              .copyWith(
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                        ),
                                        SizedBox(width: 3.w),
                                        Text(
                                          '15% OFF',
                                          style: AppStyles.font14.normal
                                              .colored(AppColors.orange),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 3.h),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius:
                                              12.r, // ScreenUtil applied here
                                          backgroundColor: AppColors.yellow,
                                          child: Icon(
                                            Icons.star,
                                            color: AppColors.white,
                                            size: 18
                                                .sp, // ScreenUtil applied here
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4.w, // ScreenUtil applied here
                                        ),
                                        Text('4.5',
                                            style: AppStyles.font15.medium
                                                .colored(AppColors.black1E)),
                                        SizedBox(
                                          width: 4.w, // ScreenUtil applied here
                                        ),
                                        Text('(415)',
                                            style: AppStyles.font13.normal
                                                .colored(AppColors.grey6B)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            options: CarouselOptions(
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              enlargeCenterPage: false,
                              padEnds: false,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              },
                              pageSnapping: true,
                              scrollPhysics: const PageScrollPhysics(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: (h * 0.12).h,
          ),
        ],
      ),
    );
  }
}
