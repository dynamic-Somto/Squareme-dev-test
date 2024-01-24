import 'package:squareme/data/constant/assets.dart';
import 'package:squareme/data/constant/helpers.dart';
import 'package:squareme/data/constant/text_styles.dart';
import 'package:squareme/data/services/navigation/index.dart';
import 'package:squareme/data/services/navigation/routes.dart';
import 'package:squareme/view/components/button.dart';
import 'package:squareme/view/components/squareme_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/constant/colors.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late ValueNotifier<int> idx;
  late PageController pageController;
  final List<String> assets = [Assets.intro1, Assets.intro2, Assets.intro3];
  final List<String> headerText = [
    'Fast and easy payments to anyone.',
    'A super secure way to pay your bills',
    'Spend your money easily without any complications'
  ];
  final List<String> subText = [
    'Receive funds sent to you in seconds.',
    'Pay your bills with the cheapest rates in town.',
    ''
  ];
  @override
  void initState() {
    idx = ValueNotifier(0);
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    idx.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: idx,
          builder: (context, i, _) {
            return Stack(
              fit: StackFit.expand,
              children: [
                PageView.builder(
                  controller: pageController,
                  padEnds: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: assets.length,
                  itemBuilder: (context, i) =>
                      Image.asset(assets[i], fit: BoxFit.cover),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 20.h),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.black, Colors.transparent],
                          stops: [0.05, 1])),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SquareMeLogo(
                            color: i == 1
                                ? AppColors.materialColor
                                : Colors.white),
                        const Spacer(),
                        Row(
                            children: List.generate(
                                3,
                                (index) => Container(
                                    margin: EdgeInsets.only(right: 8.w),
                                    height: 5.h,
                                    width: 30.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.r),
                                      color: Colors.white
                                          .withOpacity(index == i ? 1 : .3),
                                    )))),
                        HelperFunc.sb(30.h),
                        Text(headerText[i],
                            style: AppTextStyles.bold(
                                fontSize: 24, color: Colors.white)),
                        HelperFunc.sb(12.h),
                        Text(subText[i],
                            style: AppTextStyles.regular(
                                fontSize: 14, color: Colors.white)),
                        HelperFunc.sb(60.h),
                        i < 2
                            ? Row(
                                children: [
                                  TextButton(
                                      onPressed: () => globalNavigateTo(
                                          route: Routes.authBase),
                                      child: Text('Skip',
                                          style: AppTextStyles.medium(
                                              fontSize: 15,
                                              color: Colors.white))),
                                  const Spacer(),
                                  AppButton(
                                      onTap: () {
                                        idx.value = i + 1;
                                        pageController.animateToPage(idx.value,
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve:
                                                Curves.fastLinearToSlowEaseIn);
                                      },
                                      btnText: 'Next',
                                      width: 90.w,
                                      color: Colors.white,
                                      txtColor: AppColors.materialColor)
                                ],
                              )
                            : AppButton(
                                onTap: () =>
                                    globalNavigateTo(route: Routes.authBase),
                                btnText: 'Get Started',
                                color: Colors.white,
                                txtColor: AppColors.materialColor)
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
