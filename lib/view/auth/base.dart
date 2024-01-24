import 'package:squareme/data/constant/colors.dart';
import 'package:squareme/data/services/navigation/index.dart';
import 'package:squareme/data/services/navigation/routes.dart';
import 'package:squareme/view/components/button.dart';
import 'package:squareme/view/components/squareme_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/constant/helpers.dart';

class AuthBasePage extends StatelessWidget {
  const AuthBasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.materialColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Column(
          children: [
            Expanded(
                child: Center(
                    child: SquareMeLogo(color: Colors.white, size: 28.h))),
            AppButton(
              onTap: ()=> globalNavigateTo(route: Routes.register),
                btnText: 'Create an account',
                color: Colors.white,
                txtColor: AppColors.materialColor),
            HelperFunc.sb(15.h),
            AppButton(
                onTap: ()=> globalNavigateTo(route: Routes.login),
                btnText: 'I have an account',
                color: Colors.white,
                isOutlined: true)
          ],
        ),
      )),
    );
  }
}
