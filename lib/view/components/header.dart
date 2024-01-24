import 'package:squareme/data/constant/colors.dart';
import 'package:squareme/data/constant/extensions.dart';
import 'package:squareme/data/constant/text_styles.dart';
import 'package:squareme/data/services/navigation/index.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String headerText;
  const Header({super.key, required this.headerText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
                onPressed: () => globalPop(),
                icon: const Icon(Icons.arrow_back_rounded,
                    color: AppColors.materialColor))
            .align(Alignment.centerLeft)
            .EXPANDED,
        Text(headerText,
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold(color: AppColors.materialColor)),
        Visibility(
                visible: false,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_rounded,
                        color: AppColors.materialColor)))
            .EXPANDED
      ],
    );
  }
}
