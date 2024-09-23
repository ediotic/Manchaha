import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/utils/app_colors.dart';
import 'package:manchaha/utils/style/app_styles.dart';

class DcImages extends StatefulWidget {
  const DcImages({
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
    required this.row,
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
  final Widget row;

  @override
  DcImagesState createState() => DcImagesState();
}

class DcImagesState extends State<DcImages> {
  bool isLiked = false;

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: _toggleLike,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                margin: EdgeInsets.only(
                  right: 15.w,
                ),
                height: widget.height ?? 120.h,
                width: widget.width ?? 282.w,
                padding: widget.padding,
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  border: widget.border,
                  borderRadius: BorderRadius.circular(widget.borderRadius.r),
                ),
                child: ClipRRect(
                  borderRadius: widget.applyImageRadius
                      ? BorderRadius.circular(widget.borderRadius.r)
                      : BorderRadius.zero,
                  child: Image(
                    image: widget.isNetworkImage
                        ? NetworkImage(widget.imageUrl) as ImageProvider
                        : AssetImage(widget.imageUrl),
                    fit: widget.fit,
                    height: widget.height ?? 110.h,
                    width: widget.width ?? 160.w,
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
                top: 6.h,
                right: 23.w,
                child: CircleAvatar(
                  radius: 12.r,
                  backgroundColor: AppColors.white.withOpacity(0.64),
                  child: Icon(
                    Icons.favorite_border_outlined,
                    size: 15.sp,
                    color: isLiked ? AppColors.favouriteRed : AppColors.grey6B,
                  ),
                ),
              ),
              Positioned(
                top: 10.h,
                left: 10.w,
                child: Container(
                  width: 56.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: AppColors
                        .appColor, 
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Center(
                    child: Text('25% off',
                        style: AppStyles.font12.normal.colored(
                          AppColors.white,
                        )),
                  ),
                ),
              ),
            ],
          ),
          widget.row
        ],
      ),
    );
  }
}
