import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../services/navigation/index.dart';

class HelperFunc {
  HelperFunc._();

  static SizedBox sb(double value) => SizedBox(height: value, width: value);

  static void showLoader() {
    AlertDialog alert = AlertDialog(
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CupertinoActivityIndicator(),
          SizedBox(width: 10.w),
          const Text('Loading...'),
        ],
      ),
    );
    showCupertinoDialog(
      barrierDismissible: false,
      context: buildContext,
      builder: (context) {
        return WillPopScope(onWillPop: () async => true, child: alert);
      },
    );
  }


  static void logger(String msg) => log(msg);

  static void copyToClipboard(String text, {String? toastMsg}) {
    Clipboard.setData(ClipboardData(text: text));
  }

  static void showCustomBottomSheet(
      {required BuildContext context,
        double? height,
        EdgeInsetsGeometry? padding,
        bool showBackButton = true,
        required Widget child}) async {
    await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            padding: padding ?? EdgeInsets.fromLTRB(0, 15.h, 0, 0),
            height: height ?? (MediaQuery.of(context).size.height * 0.94),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(40.r)),
            ),
            child:
            const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // if (showBackButton) const AppBackButton(),
              // child.pd(EdgeInsets.symmetric(horizontal: 20.w)).EXPANDED
            ]),
          );
        });
  }

  static void showFittedBottomSheet(
      {required BuildContext context,
        EdgeInsetsGeometry? padding,
        bool showBackButton = true,
        required Widget child}) async {
    await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            padding: padding ?? EdgeInsets.fromLTRB(0, 15.h, 0, 10.h),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(40.r))),
            // child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [if (showBackButton) const AppBackButton(), child]),
          );
        });
  }

  static void showPopUpDialog(
      {required BuildContext context,
        required Widget child,
        EdgeInsetsGeometry? padding,
        double? size,
        AlignmentGeometry alignment = Alignment.center,
        bool barrierDismissible = true}) async {
    await showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return Align(
            alignment: alignment,
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.r))),
              // insetPadding:
              // EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.widthAdjusted),
              child: Container(
                height: size,
                width: size,
                padding: padding ?? EdgeInsets.all(12.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.white),
                child: child,
              ),
            ),
          );
        });
  }

  static void showFittedPopUp(
      {required BuildContext context,
        required Widget child,
        EdgeInsetsGeometry? padding,
        AlignmentGeometry alignment = Alignment.center,
        bool barrierDismissible = true}) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return Align(
          alignment: alignment,
          child: Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r)),
            child: Padding(padding: padding ?? EdgeInsets.zero, child: child),
          ),
        );
      },
    );
  }
}
