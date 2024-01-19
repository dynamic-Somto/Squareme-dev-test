import 'package:bayfront/view/cubit/auth/index.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../data/services/api/auth/index.dart';
import '../data/services/api/request_helper.dart';
import '../data/services/navigation/index.dart';
import '../data/services/storage/index.dart';

final getItInst = GetIt.I;

Future init() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  getItInst.registerSingleton<SharedPreferences>(sharedPref);

  final http.Client client = http.Client();

  getItInst.registerLazySingleton<http.Client>(() => client);

  //Storage
  getItInst.registerLazySingleton<StorageServiceImpl>(
      () => StorageServiceImpl(prefs: getItInst()));

  // NAVIGATION
  getItInst.registerLazySingleton<NavigationServiceImpl>(
      () => NavigationServiceImpl());

  //APi SERVICE
  getItInst.registerSingleton<RequestHelpersImpl>(RequestHelpersImpl(
      httpClient: getItInst(),
      storageServiceImpl: getItInst(),
      navigationServiceImpl: getItInst()));

  getItInst.registerLazySingleton<AuthApiServiceImpl>(() => AuthApiServiceImpl(
      requestHelpers: getItInst(), storageServiceImpl: getItInst()));

  getItInst.registerFactory(() => AuthCubit(
      authApiServiceImpl: getItInst(), navigationServiceImpl: getItInst()));
}
