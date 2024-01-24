import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squareme/data/constant/assets.dart';
import 'package:squareme/data/constant/colors.dart';
import 'package:squareme/data/constant/extensions.dart';
import 'package:squareme/data/constant/strings.dart';
import 'package:squareme/data/constant/text_styles.dart';
import 'package:squareme/view/components/button.dart';

import '../../../data/constant/helpers.dart';
import '../../components/pin_keyboard.dart';

class KeypadTab extends StatefulWidget {
  const KeypadTab({super.key});

  @override
  State<KeypadTab> createState() => _KeypadTabState();
}

class _KeypadTabState extends State<KeypadTab> {
  late ValueNotifier<String> amount;
  @override
  void initState() {
    amount = ValueNotifier('0');
    super.initState();
  }

  @override
  void dispose() {
    amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkPurple,
      body: SafeArea(
          child: Column(
        children: [
          HelperFunc.sb(10.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(Assets.scan),
              Container(
                padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 25.w),
                decoration: BoxDecoration(
                    color: AppColors.purple.withOpacity(.1),
                    borderRadius: BorderRadius.circular(12.r)),
                child: Column(
                  children: [
                    Text('Wallet Balance',
                        style: AppTextStyles.regular(color: AppColors.grey)),
                    HelperFunc.sb(5.h),
                    Text('${GlobalStrings.naira} 5,200',
                        style: GoogleFonts.workSans(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 17.sp))
                  ],
                ),
              ),
              SvgPicture.asset(Assets.clock),
            ],
          ).pd(EdgeInsets.symmetric(horizontal: 10.w)),
          ValueListenableBuilder(
              valueListenable: amount,
              builder: (context, value, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text('${GlobalStrings.naira} ',
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontSize: 40.sp)),
                  Text(value,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 60.sp))
                ]);
              }).EXPANDED,
          PinKeyBoard(
              inputColor: AppColors.grey2,
              onChange: (pinList) => amount.value = pinList.join(),
              pinNumber: 20),
          HelperFunc.sb(10.h),
          Row(
            children: [
              HelperFunc.sb(30.w),
              AppButton(
                      txtColor: AppColors.grey2,
                      color: AppColors.grey2.withOpacity(.3),
                      btnText: 'Request')
                  .EXPANDED,
              HelperFunc.sb(20.w),
              AppButton(
                      txtColor: AppColors.grey2,
                      color: AppColors.grey2.withOpacity(.3),
                      btnText: 'Send')
                  .EXPANDED,
              HelperFunc.sb(30.w),
            ],
          ),
          HelperFunc.sb(80.h)
        ],
      ).pd(EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h))),
    );
  }
}
