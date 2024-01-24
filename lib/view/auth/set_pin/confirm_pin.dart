import 'package:squareme/data/constant/colors.dart';
import 'package:squareme/data/constant/extensions.dart';
import 'package:squareme/data/constant/helpers.dart';
import 'package:squareme/data/constant/text_styles.dart';
import 'package:squareme/view/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squareme/view/components/pin_keyboard.dart';

import '../../../data/services/navigation/index.dart';
import '../../../data/services/navigation/routes.dart';
import '../success.dart';

class ConfirmPinPage extends StatefulWidget {
  const ConfirmPinPage({super.key});

  @override
  State<ConfirmPinPage> createState() => _ConfirmPinPageState();
}

class _ConfirmPinPageState extends State<ConfirmPinPage> {
  late ValueNotifier<List<int>> pin;
  @override
  void initState() {
    pin = ValueNotifier([]);
    super.initState();
  }

  @override
  void dispose() {
    pin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              HelperFunc.sb(10.h),
              const Header(headerText: 'Confirm PIN'),
              Column(
                children: [
                  Text(
                      'Input your six digit PIN again',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.regular(
                          color: AppColors.ash, fontSize: 13)),
                  HelperFunc.sb(50.h),
                  ValueListenableBuilder(
                      valueListenable: pin,
                      builder: (context, value, _) {
                        return Row(
                          children: [
                            ...List.generate(
                                3,
                                    (index) => Container(
                                  height: 45.h,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                                  decoration: BoxDecoration(
                                      color: AppColors.lightPri,
                                      borderRadius: BorderRadius.circular(8.r)),
                                  child: Text(
                                      value.length < (index + 1)
                                          ? ''
                                          : value[index].toString(),
                                      style: AppTextStyles.medium(fontSize: 15)),
                                ).EXPANDED),
                            Text(' - ',
                                style: AppTextStyles.medium(color: AppColors.grey)),
                            ...List.generate(
                                3,
                                    (index) => Container(
                                  height: 45.h,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                                  decoration: BoxDecoration(
                                      color: AppColors.lightPri,
                                      borderRadius: BorderRadius.circular(8.r)),
                                  child: Text(
                                      value.length < (index + 4)
                                          ? ''
                                          : value[index+3].toString(),
                                      style: AppTextStyles.medium(fontSize: 15)),
                                ).EXPANDED),
                          ],
                        ).pd(EdgeInsets.symmetric(horizontal: 40.w));
                      }),
                  const Spacer(),
                  PinKeyBoard(
                      onChange: (pinList) {
                        pin.value = pinList;
                        if(pinList.length==6){
                          globalNavigateTo(route: Routes.success,
                              arguments: SuccessData(
                                  header: 'PIN Set Successfully!',
                                  subText:
                                  'Your security pin has been set successfully.',
                                  onContinue: () =>
                                      globalNavigateTo(route: Routes.base)));
                        }
                      }, pinNumber: 6),
                  HelperFunc.sb(20.h)
                ],
              ).pd(EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h)).EXPANDED,
            ],
          )),
    );
  }
}
