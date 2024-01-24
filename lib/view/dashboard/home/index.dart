import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squareme/data/constant/extensions.dart';
import 'package:squareme/data/constant/text_styles.dart';
import '../../../data/constant/assets.dart';
import '../../../data/constant/colors.dart';
import '../../../data/constant/helpers.dart';
import '../../../data/constant/strings.dart';
import '../../components/button.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final List<String> quickAccess = [Assets.bill, Assets.referral, Assets.card];
  final List<String> quickAccessName = ['Pay Bills', 'Giftcards', 'Card'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 20.h),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.white, AppColors.skyBlue.withOpacity(.01)],
              stops: const [0.8, 1.2])),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 16.r,
                  backgroundColor: AppColors.materialColor,
                  backgroundImage: const AssetImage(Assets.avatar),
                ),
                HelperFunc.sb(10.w),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Hello,',
                      style: AppTextStyles.regular(color: AppColors.grey2)),
                  HelperFunc.sb(2.h),
                  Text('David Oloye', style: AppTextStyles.regular())
                ]).EXPANDED,
                CircleAvatar(
                    radius: 16.r,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(Assets.scan, color: Colors.black)),
                HelperFunc.sb(10.w),
                CircleAvatar(
                    radius: 16.r,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(Assets.bell))
              ],
            ),
            HelperFunc.sb(25.h),
            Column(children: [
              Text('Wallet Balance',
                  style: AppTextStyles.regular(
                      color: AppColors.materialColor.withOpacity(.3))),
              HelperFunc.sb(5.h),
              SizedBox(
                height: 80.h,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(GlobalStrings.naira,
                          style: GoogleFonts.poppins(
                              color: AppColors.materialColor, fontSize: 24.sp)),
                      Text('XXXXX',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: AppColors.materialColor,
                              fontSize: 35.sp))
                    ]),
                    Positioned.fill(
                      child: ClipRect(
                          child: BackdropFilter(
                              blendMode: BlendMode.srcATop,
                              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                              child: SizedBox(
                                  height: 80.h, width: double.infinity))),
                    ),
                  ],
                ),
              ),
            ]),
            HelperFunc.sb(25.h),
            Row(
              children: [
                HelperFunc.sb(30.w),
                const AppButton(btnText: 'Fund').EXPANDED,
                HelperFunc.sb(20.w),
                AppButton(
                        txtColor: AppColors.grey2,
                        color: AppColors.grey2.withOpacity(.3),
                        btnText: 'Withdraw')
                    .EXPANDED,
                HelperFunc.sb(30.w),
              ],
            ),
            HelperFunc.sb(35.h),
            Text('Quick Access',
                style: AppTextStyles.medium(
                    color: AppColors.ash.withOpacity(.8), fontSize: 15)),
            HelperFunc.sb(15.h),
            Row(
                children: List.generate(
                    quickAccess.length,
                    (index) => Column(
                          children: [
                            CircleAvatar(
                                backgroundColor:
                                    AppColors.purple.withOpacity(.15),
                                radius: 20.r,
                                child: SvgPicture.asset(quickAccess[index])),
                            HelperFunc.sb(10.h),
                            Text(quickAccessName[index],
                                style: AppTextStyles.medium(
                                    fontSize: 13, color: AppColors.ash))
                          ],
                        ).pd(EdgeInsets.only(right: 30.w)))),
            HelperFunc.sb(40.h),
            Text('Recent Transactions',
                style: AppTextStyles.medium(
                    color: AppColors.ash.withOpacity(.8), fontSize: 15)),
            HelperFunc.sb(25.h),
            Column(
              children: [
                SvgPicture.asset(Assets.transactions),
                HelperFunc.sb(15.h),
                Text('No recent transaction',
                    style: AppTextStyles.medium(color: AppColors.ash)),
                HelperFunc.sb(10.h),
                Text('You have not performed any transaction, you can start sending and requesting money from your contacts.',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.regular(color: AppColors.grey2))
                    .pd(EdgeInsets.symmetric(horizontal: 30.w)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
