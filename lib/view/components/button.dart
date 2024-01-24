import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/constant/colors.dart';
import '../../data/constant/text_styles.dart';

class AppButton extends StatelessWidget {
  final double? width, radius, textFont;
  final Color? color, txtColor;
  final String? btnText;
  final Widget? child;
  final bool isOutlined, isPadding;
  final EdgeInsetsGeometry? padding, margin;
  final void Function()? onTap;

  const AppButton({
    Key? key,
    this.width,
    this.radius,
    this.textFont,
    this.color,
    this.txtColor,
    this.onTap,
    this.padding,
    this.margin,
    this.child,
    this.isOutlined = false,
    this.isPadding = false,
    required this.btnText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: margin,
          padding: padding ??
              EdgeInsets.symmetric(
                  vertical: 15.h, horizontal: isPadding ? 15.w : 0),
          width: isPadding ? null : (width ?? double.infinity),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isOutlined ? null : (color ?? AppColors.materialColor),
              border: isOutlined
                  ? Border.all(color: (color ?? AppColors.materialColor))
                  : null,
              borderRadius: BorderRadius.circular(radius ?? 8.r)),
          child: Material(
            color: (color ?? Colors.transparent).withOpacity(0),
            child: child ??
                Text(btnText ?? '',
                    style: AppTextStyles.medium(
                        color: txtColor ??
                            (isOutlined
                                ? (color ?? AppColors.materialColor)
                                : Colors.white),
                        fontSize: textFont ?? 13.5)),
          )),
    );
  }
}
