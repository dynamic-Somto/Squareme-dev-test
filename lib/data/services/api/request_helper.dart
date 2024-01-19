import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../constant/debouncer.dart';
import '../../constant/helpers.dart';
import '../../constant/strings.dart';
import '../navigation/index.dart';
import '../navigation/routes.dart';
import '../storage/index.dart';

abstract class RequestHelpers {
  Future<http.Response?> post(
      {required String url,
        String? host,
        required Map<String, dynamic> body,
        Map<String, dynamic>? queryParameters,
        bool useToken = true});

  Future<http.Response?> get(
      {required String url,
        String? host,
        bool useToken = true,
        Map<String, dynamic>? queryParameters});
  Future<http.Response?> delete(
      {required String url,
        String? host,
        bool useToken = true,
        Map<String, dynamic>? queryParameters});
}

class RequestHelpersImpl extends RequestHelpers {
  final http.Client httpClient;
  final StorageServiceImpl storageServiceImpl;
  final NavigationServiceImpl navigationServiceImpl;
  final _debouncer = Debouncer();

  RequestHelpersImpl(
      {required this.storageServiceImpl,
        required this.httpClient,
        required this.navigationServiceImpl});

  @override
  Future<http.Response?> post({
    required String url,
    String? host,
    required Map<String, dynamic> body,
    bool useToken = true,
    Map<String, dynamic>? queryParameters,
  }) async {
    http.Response res;
    log('Url: $url');
    log('Payload: ${jsonEncode(body)}');
    try {
      res = await httpClient
          .post(Uri.https(host ?? GlobalStrings.host, url, queryParameters),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            ...(useToken
                ? {
              HttpHeaders.authorizationHeader:
              'Bearer ${storageServiceImpl.getToken()}'
            }
                : {})
          },
          body: jsonEncode(body))
          .timeout(const Duration(seconds: 50), onTimeout: () {
        HelperFunc.toast('Connection Timeout.');
        return Future.error('Connection Timeout.');
      });
      log('Response Code: ${res.statusCode}');
      log('Response Body: ${res.body}');
      if (res.statusCode == 502) {
        HelperFunc.toast('502 Server error');
        return null;
      }
      if (res.statusCode == 401 &&
          jsonDecode(res.body)['message']?.toString().toLowerCase() ==
              'unauthorized') {
        _debouncer(() {
          HelperFunc.toast('Please sign in to continue using app.');
          navigationServiceImpl.replaceWith(Routes.intro);
        });
        return null;
      }
      return res;
    } on SocketException {
      HelperFunc.toast('No internet connection.');
      return null;
    } catch (e) {
      HelperFunc.toast('An error occurred.\nTry again.');
    }
    return null;
  }

  @override
  Future<http.Response?> get(
      {required String url,
        String? host,
        bool useToken = true,
        Map<String, dynamic>? queryParameters}) async {
    http.Response res;
    log('Url: $url');
    if (queryParameters != null) log('Query Parameters: $queryParameters');
    try {
      res = await httpClient.get(
          Uri.https(host ?? GlobalStrings.host, url, queryParameters),
          headers: {
            HttpHeaders.acceptHeader: 'application/json',
            'Content-Type': 'application/json; charset=UTF-8',
            ...(useToken
                ? {
              HttpHeaders.authorizationHeader:
              'Bearer ${storageServiceImpl.getToken()}'
            }
                : {})
          }).timeout(const Duration(seconds: 50), onTimeout: () {
        HelperFunc.toast('Connection Timeout.');
        return Future.error('Connection Timeout.');
      });

      log('Response Code: ${res.statusCode}');
      log('Response Body: ${res.body}');
      if (res.statusCode == 502) {
        HelperFunc.toast('502 Server error');
        return null;
      }
      if (res.statusCode == 401 &&
          jsonDecode(res.body)['message']?.toString().toLowerCase() ==
              'unauthorized') {
        _debouncer(() {
          HelperFunc.toast('Please sign in to continue using app.');
          navigationServiceImpl.replaceWith(Routes.intro);
        });
        return null;
      }
      return res;
    } on SocketException {
      HelperFunc.toast('No internet connection.');
      return null;
    } catch (e) {
      HelperFunc.toast('An error occurred.\nTry again.');
    }
    return null;
  }

  @override
  Future<http.Response?> delete(
      {required String url,
        String? host,
        bool useToken = true,
        Map<String, dynamic>? queryParameters}) async {
    http.Response res;
    log('Url: $url');
    try {
      res = await httpClient.delete(
          Uri.https(host ?? GlobalStrings.host, url, queryParameters),
          headers: {
            HttpHeaders.acceptHeader: 'application/json',
            'Content-Type': 'application/json; charset=UTF-8',
            ...(useToken
                ? {
              HttpHeaders.authorizationHeader:
              'Bearer ${storageServiceImpl.getToken()}'
            }
                : {})
          }).timeout(const Duration(seconds: 50), onTimeout: () {
        HelperFunc.toast('Connection Timeout.');
        return Future.error('Connection Timeout.');
      });

      log('Response Code: ${res.statusCode}');
      log('Response Body: ${res.body}');
      if (res.statusCode == 502) {
        HelperFunc.toast('502 Server error');
        return null;
      }
      if (res.statusCode == 401 &&
          jsonDecode(res.body)['message']?.toString().toLowerCase() ==
              'unauthorized') {
        _debouncer(() {
          HelperFunc.toast('Please sign in to continue using app.');
          navigationServiceImpl.popUntil(Routes.base);
          navigationServiceImpl.replaceWith(Routes.intro);
        });
        return null;
      }
      return res;
    } on SocketException {
      HelperFunc.toast('No internet connection.');
      return null;
    } catch (e) {
      HelperFunc.toast('An error occurred.\nTry again.');
    }
    return null;
  }
}
