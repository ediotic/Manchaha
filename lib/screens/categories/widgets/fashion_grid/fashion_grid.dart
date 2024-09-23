// // ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/style/app_styles.dart';
import '../../../../utils/global.dart';

class FashionGrid extends StatelessWidget {
  final List<FashionData> fashionDataList;
  // final double containerWidthFactor;
  // final double containerHeightFactor;

  const FashionGrid({
    super.key,
    required this.fashionDataList,
    // this.containerWidthFactor = 0.19,
    // this.containerHeightFactor = 0.08,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 8.w,
      children: List.generate(
        fashionDataList.length,
        (index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: (w * 0.195).w,
                height: (h * 0.082).h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: DecorationImage(
                    image: AssetImage(fashionDataList[index].image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                fashionDataList[index].productName,
                style: AppStyles.font10.medium.colored(AppColors.black0),
              ),
              SizedBox(height: 5.h),
            ],
          );
        },
      ),
    );

    // GridView.builder(
    //   physics: const NeverScrollableScrollPhysics(),
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: crossAxisCount,
    //     crossAxisSpacing: crossAxisSpacing.w,
    //     mainAxisSpacing: mainAxisSpacing.h,
    //     mainAxisExtent: (h * 0.10).h,
    //   ),
    //   itemCount: fashionDataList.length,
    //   itemBuilder: (context, index) {
    //     return Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Container(
    //           width: (w * containerWidthFactor).w,
    //           height: (h * containerHeightFactor).h,
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(12.r),
    //             image: DecorationImage(
    //               image: AssetImage(fashionDataList[index].image),
    //               fit: BoxFit.cover,
    //             ),
    //           ),
    //         ),
    //         SizedBox(height: 5.h),
    //         Text(
    //           fashionDataList[index].productName,
    //           style: AppStyles.font10.medium.colored(AppColors.black0),
    //         ),
    //         SizedBox(height: 5.h),
    //       ],
    //     );
    //   },
    // );
  }
}

class FashionData {
  final String image;
  final String productName;

  FashionData({
    required this.image,
    required this.productName,
  });
}






































































// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../utils/app_colors.dart';
// import '../../../../utils/app_images.dart';
// import '../../../../utils/gird_modal.dart';
// import '../../../../utils/global.dart';
// import '../../../../utils/style/app_styles.dart';
// import '../fashion_data/fashion_data.dart';

// class MensFashion extends StatefulWidget {
//   const MensFashion({super.key});

//   @override
//   State<MensFashion> createState() => _MensFashionState();
// }

// List<FashionData> _photos = [
//   FashionData(
//     image: AppImages.m1, 
//     productName: "Fashion 01",
    
//   ),
//   FashionData(
//     image: AppImages.m2,
//     productName: "Fashion 02",
 
//   ),
//   FashionData(
//     image: AppImages.m3,
//     productName: "Fashion 03",
  
//   ),
//   FashionData(
//     image: AppImages.m4,
//     productName: "Fashion 04",
  
//   ),
//   FashionData(
//     image: AppImages.m5,
//     productName: "Fashion 05",
  
//   ),
//   FashionData(
//     image: AppImages.m5,
//     productName: "Fashion 06",
  
//   ),
// ];

// class _MensFashionState extends State<MensFashion> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GridView.builder(
//         physics: const NeverScrollableScrollPhysics(),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           crossAxisSpacing:6.w, 
//           mainAxisSpacing: 10.h,  
//         ),
//         itemCount: _photos.length,
//         itemBuilder: (context, index) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.start, 
//             crossAxisAlignment: CrossAxisAlignment.center, 
//             children: [
//               Container(
//                 width: (w*0.19).w,   //0.19  84
//                 height: (h*0.08).h,     // 77
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12.r),
//                   image: DecorationImage(
//                     image: AssetImage(_photos[index].image),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 5.h), 
//               Text(
//                 _photos[index].productName,
//                 style: AppStyles.font10.medium.colored(AppColors.black0),
//               ),
//               SizedBox(height: 5.h), 
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
