import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squareme/data/constant/assets.dart';
import 'package:squareme/data/constant/colors.dart';
import 'package:squareme/data/constant/extensions.dart';
import 'package:squareme/data/constant/helpers.dart';
import 'package:squareme/data/constant/text_styles.dart';
import 'package:squareme/view/components/form_field.dart';

class PhoneInput extends StatelessWidget {
  final TextEditingController phoneController;
  const PhoneInput({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(13.w, 11.5.h, 10.w, 11.5.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.grey)),
            child: Row(
              children: [
                Image.asset(Assets.nigeria, height: 20.h),
                HelperFunc.sb(5.w),
                Text('+234',
                    style: AppTextStyles.regular(color: AppColors.ash.withOpacity(.8), fontSize: 13.5)),
                const Icon(Icons.keyboard_arrow_down, color: AppColors.grey)
              ],
            )),
        HelperFunc.sb(10.w),
        AppFormField(hintText: 'Phone number', controller: phoneController).EXPANDED
      ],
    );
  }
}
