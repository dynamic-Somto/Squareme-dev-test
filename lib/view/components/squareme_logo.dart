import 'package:squareme/data/constant/assets.dart';
import 'package:squareme/data/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SquareMeLogo extends StatelessWidget {
  final Color color;
  final double? size;
  const SquareMeLogo(
      {super.key, this.color = AppColors.materialColor, this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(Assets.squareme, color: color, height: size),
          SvgPicture.asset(Assets.send, height: size),
          SvgPicture.asset(Assets.tm,
              color: color, height: size == null ? null : size! * .25),
        ]);
  }
}
