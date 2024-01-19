import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../di/get_it.dart';
import '../data/constant/colors.dart';
import '../data/services/navigation/index.dart';
import '../data/services/navigation/router.dart';
import '../data/services/navigation/routes.dart';
import '../data/services/storage/index.dart';
import 'cubit/auth/index.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  late AuthCubit _authCubit;

  @override
  void initState() {
    _authCubit = getItInst<AuthCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _authCubit.close();
    super.dispose();
  }

  String get getRoute => getItInst<StorageServiceImpl>().getToken().isEmpty
      ? Routes.intro
      : Routes.intro;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        child: LayoutBuilder(builder: (context, constraints) {
          return OrientationBuilder(builder: (context, orientation) {
            return MultiBlocProvider(
              providers: [
                BlocProvider.value(value: _authCubit),
              ],
              child: ScreenUtilInit(
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
                          scaffoldBackgroundColor: Colors.white,
                          brightness: Brightness.light,
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                          primarySwatch: AppColors.materialColor),
                      initialRoute: getRoute,
                      onGenerateRoute: (settings) =>
                          CustomRouter.generateRoutes(settings),
                    );
                  }),
            );
          });
        }));
  }
}
