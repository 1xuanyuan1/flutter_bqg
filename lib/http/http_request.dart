import 'dart:convert';

import 'package:bqg/http/http_error.dart';
import 'package:bqg/model/baseResponse.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

class HttpRequest {
  static HttpRequest _sInstance;
  Dio _dio;

  static HttpRequest getInstance () {
    if (_sInstance == null) {
      _sInstance = new HttpRequest();
    }
    return _sInstance;
  }

  HttpRequest () {
    this._dio = Dio();
  }

  Future<Map<String, dynamic>> get (String url) async {
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      throw new HttpError(HttpError.NETWORK_ERROR, '请求网络异常，请稍后重试！');
    }
    try {
      Response response = await this._dio.get(url);
      BaseResponse baseResponse = BaseResponse.fromJson(jsonDecode(response.toString()));
      if (baseResponse.status == 1) {
        if (baseResponse.data == null || !(baseResponse.data is Map)) {
          throw new HttpError(HttpError.PARSE_ERROR, '返回结果有问题');
        } else {
          return baseResponse.data;
        }
      } else {
        throw new HttpError(baseResponse.status, baseResponse.info);
      }
    } on DioError catch (error) {
      throw HttpError.dioError(error);
    }
  }
}