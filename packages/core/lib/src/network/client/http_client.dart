import 'package:dio/dio.dart';
import 'package:dio/io.dart';

// это клиент для http запросов, сделано для того чтобы не использовать напрямую Dio в коде приложения и иметь возможность легко менять реализацию клиента в будущем
class HttpClient extends DioForNative {
  HttpClient({
    required String baseUrl,
    List<Interceptor> interceptors = const [],
  }) : super(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(
              seconds: 30,
            ),
            receiveTimeout: const Duration(
              seconds: 30,
            ),
          ),
        ) {
    this.interceptors.addAll(
      [
        ...interceptors,
      ],
    );
  }

  Future<Response<T>> execute<T>({
    required String method,
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    dynamic data,
    ResponseType? responseType,
    bool? followRedirects,
    bool Function(int?)? validateStatus,
  }) async {
    try {
      final response = await request<T>(
        url,
        options: Options(
          method: method,
          headers: headers,
          responseType: responseType,
          followRedirects: followRedirects,
          validateStatus: validateStatus,
        ),
        queryParameters: query,
        data: data,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
