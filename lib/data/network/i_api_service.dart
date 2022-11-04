import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:neeraj_flutter_app/constants/api_constants.dart';

import 'response_listener.dart';

///Created by Naman Gupta on 19/4/21.

abstract class IApiService {
  late Dio _dio;

  Future<Response<T>> get<T>(
    String url,
    Map<String, dynamic> params,
  );

  postRowData<T>(String url, String data, ResponseListener<T> listener);

  postData<T>(
      String url, Map<String, dynamic> data, ResponseListener<T> listener);

  postFormData<T>(String url, FormData data, ResponseListener<T> listener);

  downloadFile<T>(
      String url, Map<String, dynamic> data, ResponseListener<T> listener);

  Dio getDio(bool formUrlEncodedContent) {
    BaseOptions options = BaseOptions(
      connectTimeout: 1000 * 120,
      receiveTimeout: 8000,
    );
    _dio = Dio(options);
    if (!kReleaseMode)
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));

    // TODO can use this interceptor too
    // _dio.interceptors.add(InterceptorsWrapper(
    //     onRequest: (options){
    //       print('Interceptor request data >>> ${options.data}');
    //     },
    // onResponse: (response){
    //       print('Interceptor response data >>> ${response.data}');
    // }
    // ));
    if (formUrlEncodedContent) {}

    _dio.options.headers = {"X-ApiKey": ApiConstants.APITOKEN};
    // _dio.options.headers = {"authorization" : ""};
    return _dio;
  }
}
