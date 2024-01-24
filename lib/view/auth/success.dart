import 'package:flutter_svg/flutter_svg.dart';
import 'package:squareme/data/constant/assets.dart';
import 'package:squareme/data/constant/colors.dart';
import 'package:squareme/data/constant/text_styles.dart';
import 'package:squareme/view/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/constant/helpers.dart';

class SuccessData {
  final String header, subText;
  final VoidCallback onContinue;
  SuccessData(
      {required this.header, required this.subText, required this.onContinue});
}

class SuccessPage extends StatelessWidget {
  final SuccessData successData;
  const SuccessPage({super.key, required this.successData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Column(
          children: [
            HelperFunc.sb(100.h),
            SvgPicture.asset(Assets.success),
            Text(successData.header,
                style: AppTextStyles.semiBold(fontSize: 16)),
            HelperFunc.sb(10.h),
            Text(successData.subText,
                style: AppTextStyles.regular(fontSize: 13)),
            const Spacer(),
            AppButton(onTap: successData.onContinue, btnText: 'Okay!'),
          ],
        ),
      )),
    );
  }
}
