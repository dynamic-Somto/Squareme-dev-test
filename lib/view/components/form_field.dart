import 'package:squareme/data/constant/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/constant/colors.dart';
import '../../data/constant/separator.dart';
import '../../data/constant/text_styles.dart';

class AppFormField extends StatefulWidget {
  final TextInputType keyBoardType;
  final String? prefixIcon, suffixIcon, counterText, hintText, labelText;
  final TextEditingController controller;
  final int maxLength, textLength, maxLines;
  final bool isAutoFocus;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixWidget, suffixWidget;
  final Color? fillColor, suffixColor;
  final void Function(String)? onChanged, onFieldSubmitted;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autoValidateMode;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final Color? borderColor;
  final double? radius;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;

  const AppFormField(
      {Key? key,
      required this.hintText,
      this.labelText,
      this.keyBoardType = TextInputType.text,
      required this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.contentPadding,
      this.counterText,
      this.focusNode,
      this.hintStyle,
      this.maxLines = 1,
      this.prefixWidget,
      this.suffixWidget,
      this.validator,
      this.onFieldSubmitted,
      this.textInputAction,
      this.autoValidateMode,
      this.suffixColor,
      this.fillColor,
      this.borderColor,
      this.inputFormatters,
      this.onChanged,
      this.textAlign = TextAlign.start,
      this.radius,
      this.isAutoFocus = false,
      this.textLength = 100,
      this.maxLength = 35})
      : super(key: key);

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  late bool obscureText;

  @override
  void initState() {
    obscureText = widget.keyBoardType == TextInputType.visiblePassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
      focusNode: widget.focusNode,
      controller: widget.controller,
      obscureText: obscureText,
      obscuringCharacter: '*',
      maxLines: widget.maxLines,
      keyboardType: widget.keyBoardType,
      autofocus: widget.isAutoFocus,
      autovalidateMode:
          widget.autoValidateMode ?? AutovalidateMode.onUserInteraction,
      inputFormatters: widget.inputFormatters ??
          (widget.keyBoardType == TextInputType.phone
              ? [
                  LengthLimitingTextInputFormatter(widget.maxLength),
                  FilteringTextInputFormatter.digitsOnly
                ]
              : widget.keyBoardType == TextInputType.name
                  ? [FilteringTextInputFormatter.deny(RegExp(r'\s'))]
                  : widget.keyBoardType == TextInputType.number
                      ? [
                          SeparatorFormatter(),
                          FilteringTextInputFormatter.deny(
                              RegExp(r'[A-Z]', caseSensitive: false))
                        ]
                      : [LengthLimitingTextInputFormatter(widget.textLength)]),
      textAlign: widget.textAlign,
      style: AppTextStyles.regular(fontSize: 13),
      decoration: InputDecoration(
        alignLabelWithHint: true,
        // labelText: widget.labelText,
        counterText: widget.counterText,
        prefixIcon: widget.prefixWidget ??
            (widget.prefixIcon == null
                ? null
                : Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                    child: SvgPicture.asset(widget.prefixIcon!,
                        color: AppColors.grey.withOpacity(.8)))),
        suffixIcon: widget.suffixWidget ??
            (widget.keyBoardType == TextInputType.visiblePassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey.shade400,
                    ))
                : widget.suffixIcon == null
                    ? null
                    : SvgPicture.asset(widget.suffixIcon!,
                            color: widget.suffixColor ??
                                AppColors.grey.withOpacity(.8))
                        .pd(EdgeInsets.fromLTRB(0, 12.5.h, 18.w, 12.5.h))),
        hintText: widget.hintText,
        hintStyle: widget.hintStyle??
            AppTextStyles.regular(color: AppColors.grey),
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius ?? 8.r),
            borderSide:
                BorderSide(color: widget.borderColor ?? AppColors.grey)),
        fillColor: widget.fillColor ?? Colors.transparent,
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius ?? 8.r),
            borderSide:
                BorderSide(color: widget.borderColor ?? AppColors.grey)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius ?? 8.r),
            borderSide: BorderSide(
                color: widget.borderColor ?? AppColors.materialColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius ?? 8.r),
            borderSide: BorderSide(color: widget.borderColor ?? Colors.red)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? 8.r),
          borderSide:
              BorderSide(color: widget.borderColor ?? AppColors.materialColor),
        ),
      ),
      validator: widget.validator ??
          (value) {
            if (value!.isEmpty) {
              return 'This input is empty';
            } else if (widget.keyBoardType == TextInputType.emailAddress) {
              if (!value.isValidEmail) {
                return 'Not a valid email';
              }
            } else if (widget.keyBoardType == TextInputType.name) {
              if (value.length < 3) {
                return 'Not a valid name';
              }
            } else if (widget.keyBoardType == TextInputType.visiblePassword) {
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
            } else if (widget.keyBoardType == TextInputType.number) {
              String newValue = value.replaceAll(',', '');
              if (num.tryParse(newValue) == null) {
                return 'Not a valid number';
              }
            }
            return null;
          },
    );
  }
}
