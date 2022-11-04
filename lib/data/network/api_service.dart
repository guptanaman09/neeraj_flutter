import 'package:dio/dio.dart';
import 'package:neeraj_flutter_app/locale/languages/app_localizations.dart';
import 'package:neeraj_flutter_app/utils/internet_connectivity.dart';
import 'package:neeraj_flutter_app/utils/logger.dart';

import 'i_api_service.dart';
import 'response_listener.dart';

///Created by Naman Gupta on 19/4/21.

class ApiService extends IApiService {
  @override
  Future<Response<T>> get<T>(
    String url,
    Map<String, dynamic> params,
  ) async {
    if (await InternetConnectivity().checkConnection()) {
      Dio dio = getDio(false);
      Response<T> response = await dio.get<T>(url, queryParameters: params);
      try {
        if (response != null &&
            response.statusCode == 200 &&
            response.data != null) {
          Logger.logd('response get >>> ${response.data}');
          // listener.updateIfLive(response.data!);
          return response;
        } else
          // listener.onErrorGet(
          //     AppLocalizations.strings!.something_went_wrong_try_agin!);
          return response;
      } catch (err) {
        Logger.logd('exception got >>> ${err}');
        // listener.onErrorGet(
        //     AppLocalizations.strings!.something_went_wrong_try_agin!);
        return response;
      }
    } else {
      // listener.onErrorGet(
      //     AppLocalizations.strings!.please_check_your_internt_connection!);
      return Future.value();
    }
  }

  @override
  postData<T>(String url, Map<String, dynamic> data,
      ResponseListener<T> listener) async {
    if (await InternetConnectivity().checkConnection()) {
      try {
        Dio dio = getDio(false);
        Response<T> response = await dio.post<T>(url, data: data);
        if (response != null &&
            response.statusCode == 200 &&
            response.data != null) {
          Logger.logd('response get >>> ${response.data}');
          listener.updateIfLive(response.data!);
        } else
          listener.onErrorGet(
              AppLocalizations.strings.something_went_wrong_try_agin!);
      } catch (err) {
        Logger.logd('exception got >>> ${err}');
        listener.onErrorGet(
            AppLocalizations.strings.something_went_wrong_try_agin!);
      }
    } else {
      listener.onErrorGet(
          AppLocalizations.strings.please_check_your_internt_connection!);
    }
  }

  @override
  postFormData<T>(
      String url, FormData data, ResponseListener<T> listener) async {
    try {
      Dio dio = getDio(false);
      dio.options.contentType = Headers.formUrlEncodedContentType;
      Response<T> response = await dio.post<T>(
        url,
        data: data,
      );
      if (response != null &&
          response.statusCode == 200 &&
          response.data != null) {
        Logger.logd('response get >>> ${response.data}');
        listener.updateIfLive(response.data!);
      } else
        listener.onErrorGet(
            AppLocalizations.strings.something_went_wrong_try_agin!);
    } catch (err) {
      Logger.logd('Exception found >>> ${err}');
      listener
          .onErrorGet(AppLocalizations.strings.something_went_wrong_try_agin!);
    }
  }

  @override
  postRowData<T>(String url, String data, ResponseListener<T> listener) async {
    Dio dio = getDio(false);
    Response<T> response = await dio.post<T>(url, data: data);
    if (response != null &&
        response.statusCode == 200 &&
        response.data != null) {
      Logger.logd('response get >>> ${response.data}');
      listener.updateIfLive(response.data!);
    } else
      listener
          .onErrorGet(AppLocalizations.strings.something_went_wrong_try_agin!);
  }

  @override
  postQueryData<T>(String url, Map<String, dynamic> data,
      ResponseListener<T> listener) async {
    Dio dio = getDio(false);
    Response<T> response = await dio.post<T>(url, queryParameters: data);
    if (response != null &&
        response.statusCode == 200 &&
        response.data != null) {
      Logger.logd('response get >>> ${response.data}');
      listener.updateIfLive(response.data!);
    } else
      listener
          .onErrorGet(AppLocalizations.strings.something_went_wrong_try_agin!);
  }

  @override
  downloadFile<T>(String url, Map<String, dynamic> data,
      ResponseListener<T> listener) async {
    try {
      Dio dio = getDio(false);
      Response<T> response = await dio.post<T>(url,
          data: data,
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
          ));
      if (response != null &&
          response.statusCode == 200 &&
          response.data != null) {
        Logger.logd('response get >>> ${response.data}');
        listener.updateIfLive(response.data!);
      } else
        listener.onErrorGet(
            AppLocalizations.strings.something_went_wrong_try_agin!);
    } catch (err) {
      Logger.logd('exception got >>> ${err}');
      listener
          .onErrorGet(AppLocalizations.strings.something_went_wrong_try_agin!);
    }
  }
}
