import 'package:dio/dio.dart';

import 'exceptions.dart';

class DataService {
  final String apiUrl;

  final Dio dio;

  DataService(this.apiUrl, this.dio) {
    this.dio.interceptors.add(
          InterceptorsWrapper(
            onError: (error, e) => catchError(error, e),
          ),
        );
  }

  void catchError(DioError e, ErrorInterceptorHandler error) {
    print(e.error);
    switch (e.response?.statusCode) {
      case 400:
        throw BadInput(e.message);
      case 404:
        throw NotFound(e.message);
      default:
        throw AppError(e.message);
    }
  }
}
