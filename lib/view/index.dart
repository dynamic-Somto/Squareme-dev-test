import 'package:squareme/data/services/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../di/get_it.dart';
import '../data/constant/colors.dart';
import '../data/services/navigation/index.dart';
import '../data/services/navigation/router.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        child: LayoutBuilder(builder: (context, constraints) {
          return OrientationBuilder(builder: (context, orientation) {
            return ScreenUtilInit(
                designSize: const Size(375, 812),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (context, _) {
                  return MaterialApp(
                    navigatorKey:
                        getItInst<NavigationServiceImpl>().navigationKey,
                    title: 'Xtridelink Rider',
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                        textTheme: GoogleFonts.dmSansTextTheme(
                            Theme.of(context).textTheme),
                        scaffoldBackgroundColor: Colors.white,
                        brightness: Brightness.light,
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        primarySwatch: AppColors.materialColor),
                    initialRoute: Routes.intro,
                    onGenerateRoute: (settings) =>
                        CustomRouter.generateRoutes(settings),
                  );
                });
          });
        }));
  }
}
