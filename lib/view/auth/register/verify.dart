import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squareme/data/constant/extensions.dart';
import 'package:squareme/data/services/navigation/index.dart';
import 'package:squareme/data/services/navigation/routes.dart';
import 'package:squareme/view/auth/success.dart';
import '../../../data/constant/colors.dart';
import '../../../data/constant/helpers.dart';
import '../../../data/constant/text_styles.dart';
import '../../components/button.dart';
import '../../components/header.dart';
import '../../components/otp.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key});

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  late ValueNotifier<String> otp;
  late ValueNotifier<Duration> oneMin;
  late Timer? timer;

  void setTimer() {
    oneMin.value = const Duration(minutes: 1);
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      oneMin.value = Duration(seconds: oneMin.value.inSeconds - 1);
      if (oneMin.value.inSeconds <= 0) {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    oneMin = ValueNotifier(const Duration(minutes: 1));
    setTimer();
    otp = ValueNotifier('');
    super.initState();
  }

  @override
  void dispose() {
    otp.dispose();
    oneMin.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          HelperFunc.sb(10.h),
          const Header(headerText: 'Verify Phone Number'),
          Column(
            children: [
              Column(
                children: [
                  Text(
                      'Please input the five digit code that was sent\nto your phone number below',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.regular(
                          color: AppColors.ash, fontSize: 13)),
                  HelperFunc.sb(50.h),
                  OtpInput(
                      textFieldNo: 5,
                      onOtpChanged: (v) {
                        otp.value = v;
                        if (v.length == 5) {
                          globalNavigateTo(
                              route: Routes.success,
                              arguments: SuccessData(
                                  header: 'Verification sucessful!',
                                  subText:
                                      'Your phone number has been verified successfully.',
                                  onContinue: () =>
                                      globalNavigateTo(route: Routes.setPin)));
                        }
                      }),
                  HelperFunc.sb(20.h),
                  ValueListenableBuilder(
                      valueListenable: oneMin,
                      builder: (context, value, _) {
                        return Text(
                            '${value.inMinutes.toString()}:${value.inSeconds.remainder(60).toString().padLeft(2, '0')}',
                            style: AppTextStyles.medium(
                                fontSize: 11.5, color: AppColors.purple));
                      }),
                  HelperFunc.sb(20.h),
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'Having trouble receiving SMS? ',
                          style: AppTextStyles.medium(
                              fontSize: 12.5, color: AppColors.ash),
                          children: [
                            TextSpan(
                                text: 'Resend',
                                style: AppTextStyles.medium(
                                    fontSize: 12.5, color: AppColors.purple),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = (() {
                                    setTimer();
                                  })),
                            TextSpan(
                                text: '\nOr try other options below',
                                style: AppTextStyles.medium(
                                    fontSize: 12.5, color: AppColors.ash)),
                          ]))
                ],
              ).SCROLLVIEW.EXPANDED,
              ValueListenableBuilder(
                  valueListenable: oneMin,
                  builder: (context, value, _) {
                    return Row(
                      children: [
                        AppButton(
                                color: value.inSeconds > 0
                                    ? AppColors.ash.withOpacity(.3)
                                    : null,
                                btnText: 'Call me',
                                isOutlined: true)
                            .EXPANDED,
                        HelperFunc.sb(15.w),
                        AppButton(
                                color: value.inSeconds > 0
                                    ? AppColors.ash.withOpacity(.3)
                                    : null,
                                btnText: 'Whatsapp')
                            .EXPANDED,
                      ],
                    );
                  }),
            ],
          ).pd(EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h)).EXPANDED,
        ],
      )),
    );
  }
}
