import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../../storage/index.dart';
import '../request_helper.dart';


sealed class AuthApiService {
  // Future<UserData?> signIn({required String email, required String password});

  // Future<UserData?> signUp(
  //     {required email,
  //       required password,
  //       required firstName,
  //       required lastName,
  //       required phoneNumber,
  //       required countryCode});
  //
  // Future<bool> forgotPassword({required String email});
  //
  // Future<bool> verifyEmail({required String userId, required String otp, required bool isEmail});
  //
  // Future<bool> sendOtp({required String email});
  //
  // Future<UserData?> resetPassword(
  //     {required String code,
  //       required String newPassword,
  //       bool isReset = true,
  //       required String email});
  Future<void> updateDeviceToken({required String token});

}

class AuthApiServiceImpl extends AuthApiService {
  RequestHelpersImpl requestHelpers;
  StorageServiceImpl storageServiceImpl;

  AuthApiServiceImpl(
      {required this.requestHelpers, required this.storageServiceImpl});

  // @override
  // Future<UserData?> signIn(
  //     {required String email, required String password}) async {
  //   String url = '/v1/auth/rider/signin';
  //   try {
  //     http.Response? res = await requestHelpers.post(
  //         useToken: false,
  //         url: url,
  //         body: {'email': email, 'password': password});
  //     if (res == null) return null;
  //     var body = jsonDecode(res.body);
  //     if (res.statusCode == 200 || res.statusCode == 201) {
  //       AuthResModel authResModel = AuthResModel.fromJson(body);
  //       await storageServiceImpl.setUserToken(authResModel.data.token);
  //       await storageServiceImpl.setUserId(authResModel.data.user.id);
  //       HelperFunc.toast('Signed in successfully');
  //       return authResModel.data.user;
  //     } else {
  //       HelperFunc.toast(body['message']?.toString() ?? 'Failed to sign in.');
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     HelperFunc.toast('Failed to sign in');
  //   }
  //   return null;
  // }
  //
  // @override
  // Future<UserData?> signUp(
  //     {required email,
  //       required password,
  //       required firstName,
  //       required lastName,
  //       required phoneNumber,
  //       required countryCode}) async {
  //   String url = '/v1/auth/rider/signup';
  //   try {
  //     http.Response? res =
  //     await requestHelpers.post(useToken: false, url: url, body: {
  //       'firstName': firstName,
  //       'lastName': lastName,
  //       'email': email,
  //       'phone': phoneNumber,
  //       'countryCode': countryCode,
  //       'password': password
  //     });
  //     if (res == null) return null;
  //     var body = jsonDecode(res.body);
  //     if (res.statusCode == 200 || res.statusCode == 201) {
  //       AuthResModel authResModel = AuthResModel.fromJson(body);
  //       await storageServiceImpl.setUserToken(authResModel.data.token);
  //       await storageServiceImpl.setUserId(authResModel.data.user.id);
  //       HelperFunc.toast('Account created successfully');
  //       return authResModel.data.user;
  //     } else {
  //       HelperFunc.toast(
  //           body['message']?.toString() ?? 'Failed to create account.');
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     HelperFunc.toast('Failed to create account');
  //   }
  //   return null;
  // }
  //
  // @override
  // Future<bool> forgotPassword({required String email}) async {
  //   try {
  //     String url = '/v1/auth/password-forgot';
  //     http.Response? response = await requestHelpers.post(
  //         useToken: false,
  //         url: url,
  //         body: {
  //           'email': email,
  //           'url': 'https://${GlobalStrings.webUrl}/reset-password'
  //         });
  //     if (response == null) return false;
  //     var body = jsonDecode(response.body);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       HelperFunc.toast(body['message']?.toString() ??
  //           'A code has been sent to your email.');
  //       return true;
  //     } else {
  //       HelperFunc.toast(
  //           body['message']?.toString() ?? 'Failed to reset password.');
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     HelperFunc.toast('Failed to reset password');
  //   }
  //   return false;
  // }
  //
  // @override
  // Future<bool> verifyEmail({required String userId, required String otp, required bool isEmail}) async {
  //   try {
  //     String url = isEmail ? '/v1/auth/verify-email' : '/v1/auth/verify-number';
  //     http.Response? response = await requestHelpers
  //         .post(useToken: false, url: url, body: {'otp': otp, 'userId': userId});
  //     if (response == null) return false;
  //     var body = jsonDecode(response.body);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       HelperFunc.toast('${isEmail ? 'Email' : 'Number'} has been verified.');
  //       return true;
  //     } else {
  //       HelperFunc.toast(
  //           body['message']?.toString() ?? 'Failed to verify ${isEmail ? 'email' : 'number'}.');
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     HelperFunc.toast('Failed to verify ${isEmail ? 'email' : 'number'}.');
  //   }
  //   return false;
  // }
  //
  // @override
  // Future<bool> sendOtp({required String email}) async {
  //   try {
  //     String url = '/v1/auth/send-otp';
  //     http.Response? response = await requestHelpers
  //         .post(useToken: false, url: url, body: {'email': email});
  //     if (response == null) return false;
  //     var body = jsonDecode(response.body);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       HelperFunc.toast('An otp has been sent to your email.');
  //       return true;
  //     } else {
  //       HelperFunc.toast(body['message']?.toString() ?? 'Failed to send otp.');
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     HelperFunc.toast('Failed to send otp.');
  //   }
  //   return false;
  // }
  //
  // @override
  // Future<UserData?> resetPassword(
  //     {required String code,
  //       required String newPassword,
  //       bool isReset = true,
  //       required String email}) async {
  //   try {
  //     String url = '/v1/auth/password-reset';
  //     http.Response? response = await requestHelpers.post(
  //         useToken: false,
  //         url: url,
  //         body: {'password': newPassword, 'code': code, 'email': email});
  //     if (response == null) return null;
  //     var body = jsonDecode(response.body);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       HelperFunc.toast(
  //           'Password ${isReset ? 'reset' : 'change'} successful.');
  //       AuthResModel authResModel = AuthResModel.fromJson(body);
  //       await storageServiceImpl.setUserToken(authResModel.data.token);
  //       return authResModel.data.user;
  //     } else {
  //       HelperFunc.toast(body['message']?.toString() ??
  //           'Failed to ${isReset ? 'reset' : 'change'} password.');
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     HelperFunc.toast('Failed to ${isReset ? 'reset' : 'change'} password');
  //   }
  //   return null;
  // }
  //
  @override
  Future<void> updateDeviceToken({required String token}) async {
    try {
      String url = '/v1/user/deviceToken/update';
      await requestHelpers.post(url: url, body: {'deviceToken': token});
    } catch (e) {
      log(e.toString());
    }
  }
}
