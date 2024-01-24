import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:squareme/view/dashboard/home/index.dart';
import 'package:squareme/view/dashboard/keypad/index.dart';
import '../../data/constant/assets.dart';
import '../../data/constant/colors.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late ValueNotifier<int> tabIdx;
  final List<Widget> tabs = const [
    HomeTab(),
    KeypadTab(),
    SizedBox(),
  ];

  @override
  void initState() {
    tabIdx = ValueNotifier(0);
    super.initState();
  }

  @override
  void dispose() {
    tabIdx.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              ValueListenableBuilder(
                  valueListenable: tabIdx,
                  builder: (context, value, _) {
                    return
                      IndexedStack(index: value, children: const [
                      HomeTab(),
                      KeypadTab(),
                      SizedBox(),
                    ]);
                  }),
              Positioned(
                  left: 20.w,
                  right: 20.w,
                  bottom: 5.h,
                  child: BottomNavigationBar(tabIdx: tabIdx))
            ],
          ),
        ));
  }
}

/// Bottom navigation widget
class BottomNavigationBar extends StatelessWidget {
  final ValueNotifier<int> tabIdx;
  const BottomNavigationBar({super.key, required this.tabIdx});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: ValueListenableBuilder(
          valueListenable: tabIdx,
          builder: (context, int value, _) {
            return Row(
              children: [
                BottomNavItem(
                    svg: Assets.home,
                    color: value == 0
                        ? AppColors.materialColor
                        : AppColors.grey.withOpacity(value == 1 ? .5 : 1),
                    onTap: () => tabIdx.value = 0),
                BottomNavItem(
                    svg: Assets.keypad,
                    color: value == 1 ? Colors.white : AppColors.grey,
                    onTap: () => tabIdx.value = 1),
                BottomNavItem(
                    svg: Assets.profile,
                    color: value == 2
                        ? AppColors.materialColor
                        : AppColors.grey.withOpacity(value == 1 ? .5 : 1),
                    onTap: () => tabIdx.value = 2),
              ],
            );
          }),
    );
  }
}

/// Single bottom navigation item widget
class BottomNavItem extends StatelessWidget {
  final String svg;
  final Color color;
  final void Function() onTap;
  const BottomNavItem(
      {super.key, required this.svg, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onTap,
        child: Container(
          color: Colors.transparent,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: SvgPicture.asset(svg, color: color),
        ),
      ),
    );
  }
}
