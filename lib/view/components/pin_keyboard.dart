import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squareme/data/constant/colors.dart';
import 'package:squareme/data/constant/extensions.dart';
import 'package:squareme/data/constant/text_styles.dart';

class PinKeyBoard extends StatefulWidget {
  final int pinNumber;
  final Color? inputColor;
  final void Function(List<int>) onChange;

  const PinKeyBoard(
      {Key? key,
      required this.pinNumber,
      this.inputColor,
      required this.onChange})
      : super(key: key);

  @override
  State<PinKeyBoard> createState() => _PinKeyBoardState();
}

class _PinKeyBoardState extends State<PinKeyBoard> {
  List<List<String>> pins = [
    ["1", "2", "3"],
    ["4", "5", "6"],
    ["7", "8", "9"],
    ["0"]
  ];
  List<int> selectedPin = [];
  void _handleTap(String value) {
    if (selectedPin.length != widget.pinNumber) {
      List<int> newPinList = List.from(selectedPin);
      newPinList.add(int.parse(value));
      selectedPin = newPinList;
      widget.onChange(selectedPin);
    }
  }

  void _handleDelete() {
    if (selectedPin.isNotEmpty) {
      List<int> newPinList = List.from(selectedPin);
      newPinList.removeLast();
      selectedPin = newPinList;
      widget.onChange(selectedPin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      child: Column(
          children: List.generate(pins.length, (index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (index == 3)
              Text('.',
                      style: AppTextStyles.bold(
                          color: widget.inputColor ??
                              AppColors.ash.withOpacity(.5),
                          fontSize: 40))
                  .align(Alignment.center)
                  .pd(EdgeInsets.only(bottom: 15.h))
                  .EXPANDED,
            ...List.generate(pins[index].length, (idx) {
              return TextButton(
                child: Container(
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    pins[index][idx],
                    style: AppTextStyles.medium(
                        fontSize: 21.sp, color: widget.inputColor),
                  ),
                ),
                onPressed: () => _handleTap(pins[index][idx]),
              ).EXPANDED;
            }),
            if (index == 3)
              IconButton(
                      onPressed: () => _handleDelete(),
                      icon: Icon(Icons.keyboard_arrow_left,
                          color: widget.inputColor ??
                              AppColors.ash.withOpacity(.5)))
                  .EXPANDED,
          ],
        ).EXPANDED;
      })),
    );
  }
}
