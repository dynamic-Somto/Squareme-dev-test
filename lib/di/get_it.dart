import 'package:get_it/get_it.dart';
import '../data/services/navigation/index.dart';

//DEPENDENCY INJECTION/INVERSION
final getItInst = GetIt.I;


Future init() async {

  // NAVIGATION
  getItInst.registerLazySingleton<NavigationServiceImpl>(
      () => NavigationServiceImpl());
}
