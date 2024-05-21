import 'package:dio/dio.dart';
import 'package:dio/browser.dart';
import 'package:dio/io.dart';
import 'package:fe_lab_clinicas_core/src/restClient/interceptors/auth_interceptor.dart';

final class RestClient extends DioForNative {
  RestClient(String baseUrl)
      : super(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
      AuthInterceptor(),
    ]);
  }
  RestClient get auth {
    options.extra['DIO_AUTH_KEY'] = true;
    return this;
  }

  RestClient get unAuth {
    options.extra['DIO_AUTH_KEY'] = false;
    return this;
  }
}

final class RestClientWeb extends DioForBrowser {
  RestClientWeb(String baseUrl)
      : super(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
      AuthInterceptor(),
    ]);
  }

  RestClientWeb get auth {
    options.extra['DIO_AUTH_KEY'] = true;
    return this;
  }

  RestClientWeb get unauth {
    options.extra['DIO_AUTH_KEY'] = false;
    return this;
  }
}
