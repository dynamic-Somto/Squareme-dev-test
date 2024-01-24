import 'package:squareme/data/constant/colors.dart';
import 'package:squareme/data/constant/extensions.dart';
import 'package:squareme/data/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpInput extends StatefulWidget {
  final int textFieldNo;
  final void Function(String) onOtpChanged;

  const OtpInput(
      {Key? key, required this.textFieldNo, required this.onOtpChanged})
      : super(key: key);

  @override
  OtpInputState createState() => OtpInputState();
}

class OtpInputState extends State<OtpInput> {
  final _formKey = GlobalKey<FormState>();
  late List<TextEditingController> controllerList;
  late List<FocusNode> focusNodeList;
  List<String> currentOTPState = [];
  String otp = '';
  @override
  void initState() {
    controllerList =
        List.generate(widget.textFieldNo, (index) => TextEditingController());
    focusNodeList = List.generate(widget.textFieldNo, (index) => FocusNode());
    super.initState();
  }

  @override
  void dispose() {
    for (int i = 0; i < widget.textFieldNo; i++) {
      focusNodeList[i].dispose();
      controllerList[i].dispose();
    }
    super.dispose();
  }

  bool validate() {
    return _formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              widget.textFieldNo,
              (index) => RawKeyboardListener(
                  onKey: (event) {
                    if (event.isKeyPressed(LogicalKeyboardKey.backspace)) {
                      if (index == 0) {
                        controllerList[index].clear();
                        return;
                      }
                      controllerList[index].clear();
                      FocusScope.of(context)
                          .requestFocus(focusNodeList[index - 1]);
                    }
                  },
                  focusNode: FocusNode(),
                  child: TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    onChanged: (v) {
                      List<String> newOTPState = [
                        ...List.generate(controllerList.length,
                            (index) => controllerList[index].text)
                      ];
                      if (currentOTPState != newOTPState) {
                        widget.onOtpChanged(newOTPState.join(''));
                        currentOTPState = newOTPState;
                      }
                      if (index == controllerList.length - 1 || v.isEmpty) {
                        return;
                      }
                      FocusScope.of(context)
                          .requestFocus(focusNodeList[index + 1]);
                    },
                    textInputAction: index != controllerList.length - 1
                        ? TextInputAction.next
                        : TextInputAction.done,
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).requestFocus(
                          index != controllerList.length - 1
                              ? focusNodeList[index + 1]
                              : null);
                    },
                    textAlign: TextAlign.center,
                    style: AppTextStyles.regular(fontSize: 15),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 13.h),
                      filled: true,
                      fillColor: AppColors.lightPri,
                      isCollapsed: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.r),
                          borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.r),
                          borderSide: BorderSide.none),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.r),
                          borderSide:
                              const BorderSide(color: AppColors.materialColor)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.r),
                          borderSide: const BorderSide(color: Colors.red)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.r),
                        borderSide:
                            const BorderSide(color: AppColors.materialColor),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    controller: controllerList[index],
                    focusNode: focusNodeList[index],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '';
                      }
                      if (value.length != 1) {
                        return '';
                      }
                      if (value == '') {
                        return '';
                      }
                      return null;
                    },
                  )).pd(EdgeInsets.symmetric(horizontal: 3.w)).EXPANDED),
        )).pd(EdgeInsets.symmetric(horizontal: 40.w));
  }
}
