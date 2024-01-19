import 'package:bayfront/data/constant/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageService {
  void saveToken({required String userToken});
  String getToken();
  void setDeviceToken(String token);
  String getDeviceToken();
}

class StorageServiceImpl extends StorageService {
  SharedPreferences prefs;

  StorageServiceImpl({required this.prefs});

  @override
  void saveToken({required String userToken}) async {
    prefs.setString(StorageConstants.userToken, userToken);
  }

  @override
  String getToken() {
    return prefs.getString(StorageConstants.userToken) ?? '';
  }

  @override
  void setDeviceToken(String token) async {
    await prefs.setString(StorageConstants.deviceToken, token);
  }

  @override
  String getDeviceToken() {
    return prefs.getString(StorageConstants.deviceToken) ?? '';
  }
}
