import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CRoundImages extends StatelessWidget {
  const CRoundImages({
    super.key,
    this.height,
    this.width,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor = Colors.transparent,
    this.fit = BoxFit.cover,
    this.padding = EdgeInsets.zero,
    this.onPressed,
    this.borderRadius = 19,
    this.isNetworkImage = false,
  });

  final double? height, width;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit fit;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onPressed;
  final double borderRadius;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height?.h,
          // Applied ScreenUtil here
          width: width?.w,
          // Applied ScreenUtil here
          padding: padding,
          // You can apply ScreenUtil to padding if required
          decoration: BoxDecoration(
            color: backgroundColor,
            border: border,
            borderRadius: BorderRadius.circular(
                borderRadius.r), // Applied ScreenUtil here
          ),
          child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(
                    borderRadius.r) // Applied ScreenUtil here
                : BorderRadius.zero,
            child: Image(
              image: isNetworkImage
                  ? NetworkImage(imageUrl) as ImageProvider
                  : AssetImage(imageUrl),
              fit: fit,
              height: height?.h,
              // Applied ScreenUtil here
              width: width?.w,
              // Applied ScreenUtil here
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.broken_image,
                    color: Colors.grey,
                    size: 30,
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          top: 35.h, // Applied ScreenUtil here
          left: 18.w, // Applied ScreenUtil here
          child: Image.asset(
            'assets/images/disimage.png',
            height: 92.h, // Applied ScreenUtil here
            width: 136.w, // Applied ScreenUtil here
          ),
        ),
      ],
    );
  }
}
