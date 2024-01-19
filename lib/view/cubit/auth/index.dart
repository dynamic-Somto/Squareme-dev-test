import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/services/api/auth/index.dart';
import '../../../data/services/navigation/index.dart';
import '../../../data/services/navigation/routes.dart';

class AuthState {
  bool isLoading;
  String? email, otp, phoneNumber, countryCode;
  AuthState(
      {required this.isLoading,
        required this.email,
        required this.phoneNumber,
        required this.countryCode,
        required this.otp});
}

class AuthCubit extends Cubit<AuthState> {
  AuthApiServiceImpl authApiServiceImpl;
  NavigationServiceImpl navigationServiceImpl;

  AuthCubit(
      {required this.authApiServiceImpl, required this.navigationServiceImpl})
      : super(AuthState(
      isLoading: false,
      email: null,
      otp: null,
      phoneNumber: null,
      countryCode: null));

  // void signIn({required String email, required String password}) async {
  //   HelperFunc.showLoader();
  //   UserData? userData =
  //   await authApiServiceImpl.signIn(email: email, password: password);
  //   navigationServiceImpl.pop();
  //   if (userData != null) {
  //     navigationServiceImpl.replaceWith(
  //         userData.location.isEmpty ? Routes.setUserLocation : Routes.base);
  //     _setAuthDetails(email: email, password: password, userData: userData);
  //   }
  // }
  //
  // void signUp(
  //     {required String password,
  //       required String firstName,
  //       required String lastName,
  //       required String email}) async {
  //   HelperFunc.showLoader();
  //   UserData? userData = await authApiServiceImpl.signUp(
  //       email: email,
  //       password: password,
  //       firstName: firstName,
  //       lastName: lastName,
  //       phoneNumber: state.phoneNumber ?? '',
  //       countryCode: state.countryCode ?? '+234');
  //   navigationServiceImpl.pop();
  //   if (userData != null) {
  //     // navigationServiceImpl.replaceWith(
  //     //     getItInst<BiometricsService>().canAuthenticate.value
  //     //         ? Routes.enableBiometrics
  //     //         : Routes.setUserLocation);
  //     navigationServiceImpl.replaceWith(Routes.completeKYC);
  //     _setAuthDetails(email: email, password: password, userData: userData);
  //   }
  // }

  // void _setAuthDetails(
  //     {required String email,
  //       required String password,
  //       required UserData userData}) {
  //   navigationServiceImpl.navigationKey.currentContext!
  //       .read<SettingsCubit>()
  //       .saveLoginDet(email: email, password: password);
  //   navigationServiceImpl.navigationKey.currentContext!
  //       .read<ProfileCubit>()
  //       .setUserDetails(userData);
  // }

  // void forgotPassword({required String email}) async {
  //   HelperFunc.showLoader();
  //   bool success = await authApiServiceImpl.forgotPassword(email: email);
  //   navigationServiceImpl.pop();
  //   if (success) {
  //     state.email = email;
  //     navigationServiceImpl.replaceWith(Routes.verifyMail,
  //         arguments: VerifyType.resetPwd);
  //   }
  // }

  // void resetPassword({required String newPassword}) async {
  //   HelperFunc.showLoader();
  //   UserData? userData = await authApiServiceImpl.resetPassword(
  //       email: state.email ?? '',
  //       code: state.otp ?? '',
  //       newPassword: newPassword);
  //   navigationServiceImpl.pop();
  //   if (userData != null) {
  //     navigationServiceImpl.replaceWith(Routes.login,
  //         arguments: VerifyType.changePwd);
  //     _setAuthDetails(
  //         email: state.email ?? '', password: newPassword, userData: userData);
  //   }
  // }

  // void verifyOtp({required String otp, required VerifyType verifyType}) async {
  //   HelperFunc.showLoader();
  //   bool success = await authApiServiceImpl.verifyEmail(
  //       isEmail: verifyType != VerifyType.signup,
  //       userId: (verifyType == VerifyType.signup
  //           ? '${state.countryCode}${state.phoneNumber}'
  //           : state.email) ??
  //           '',
  //       otp: otp);
  //   navigationServiceImpl.pop();
  //   if (success) {
  //     navigationServiceImpl.replaceWith(Routes.signUp);
  //   }
  // }

  // void sendOtp({required String email}) async {
  //   HelperFunc.showLoader();
  //   bool success = await authApiServiceImpl.sendOtp(email: email);
  //   navigationServiceImpl.pop();
  //   if (success) {
  //     navigationServiceImpl.replaceWith(Routes.verifyMail,
  //         arguments: VerifyType.signup);
  //     state.email = email;
  //   }
  // }

  // Future<bool> resendOtp(VerifyType verifyType) async {
  //   HelperFunc.showLoader();
  //   bool success = verifyType == VerifyType.signup
  //       ? await authApiServiceImpl.sendOtpToNumber(
  //       phoneNo: state.phoneNumber ?? '')
  //       : await authApiServiceImpl.sendOtp(email: state.email ?? '');
  //   navigationServiceImpl.pop();
  //   return success;
  // }
}
