import 'package:dio/dio.dart';

class ServiceConfig {

  String _url = "";
  int timeout = 7500;

  ServiceConfig(this._url, {this.timeout = 7500} );


  Dio create() {
    Dio dio = Dio(
      BaseOptions(
        connectTimeout: timeout,
        baseUrl: _url,
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions request) async {
          //request.headers["token"] = "sa09f0dfkjfkashd";
          return request;
        },
        onResponse: (Response response) async {
          // decript
          return response;
        },
        onError: (DioError error) async {
          return error;
        },
      ),
    );

    return dio;
  }
}
