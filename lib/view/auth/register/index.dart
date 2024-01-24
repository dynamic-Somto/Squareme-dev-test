import 'package:flutter/gestures.dart';
import 'package:squareme/data/constant/assets.dart';
import 'package:squareme/data/constant/colors.dart';
import 'package:squareme/data/constant/extensions.dart';
import 'package:squareme/data/constant/helpers.dart';
import 'package:squareme/data/constant/text_styles.dart';
import 'package:squareme/data/services/navigation/index.dart';
import 'package:squareme/data/services/navigation/routes.dart';
import 'package:squareme/view/components/button.dart';
import 'package:squareme/view/components/form_field.dart';
import 'package:squareme/view/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squareme/view/components/phone_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController phoneController;
  late TextEditingController refController;

  @override
  void initState() {
    phoneController = TextEditingController();
    refController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    refController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          HelperFunc.sb(10.h),
          const Header(headerText: 'Enter Your Phone Number'),
          Column(
            children: [
              Column(
                children: [
                  Text(
                      'We’ll send an SMS with a code to\nverify your phone number',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.regular(
                          color: AppColors.ash, fontSize: 13)),
                  HelperFunc.sb(50.h),
                  PhoneInput(phoneController: phoneController),
                  HelperFunc.sb(10.h),
                  AppFormField(
                      hintText: 'Have a referral ID?',
                      controller: refController,
                      suffixIcon: Assets.referral,
                      suffixColor: AppColors.purple,
                      hintStyle: AppTextStyles.medium(
                          color: AppColors.purple, fontSize: 13))
                ],
              ).SCROLLVIEW.EXPANDED,
              AppButton(
                onTap: ()=> globalNavigateTo(route: Routes.verifyOtp),
                  btnText: 'Proceed'),
              HelperFunc.sb(10.h),
              RichText(
                  text: TextSpan(
                      text: 'Already have an account? ',
                      style: AppTextStyles.regular(
                          fontSize: 12.5, color: Colors.black),
                      children: [
                    TextSpan(
                        text: 'Login here',
                        style: AppTextStyles.medium(
                            fontSize: 12.5, color: AppColors.purple),
                        recognizer: TapGestureRecognizer()..onTap = (() {})),
                  ]))
            ],
          ).pd(EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h)).EXPANDED,
        ],
      )),
    );
  }
}
