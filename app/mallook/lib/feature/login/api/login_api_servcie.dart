import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:mallook/constants/http_status.dart';
import 'package:mallook/feature/login/models/auth_token_model.dart';

class LoginApiService {
  static Future<AuthTokenModel> getAuthToken(OAuthToken oAuthToken) async {
    final Dio dio = Dio(BaseOptions(baseUrl: "https://j10a606.p.ssafy.io"));
    final response = await dio.post(
      "/api/auth/login/kakao",
      data: jsonEncode(<String, String>{'accessToken': oAuthToken.accessToken}),
    );

    if (response.statusCode == HttpStatus.SELECT_SUCCESS) {
      final baseResponse = response.data;
      final int status = baseResponse['status'];
      final String message = baseResponse['message'];
      final result = baseResponse['result'];

      if (!(status == HttpStatus.SELECT_SUCCESS ||
          status == HttpStatus.INSERT_SUCCESS)) {
        throw Error();
      }

      return AuthTokenModel.fromJson(result);
    }
    throw Error();
  }
}
