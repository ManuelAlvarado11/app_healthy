import 'package:dio/dio.dart';
import 'package:app_vida_saludable/config/constants/environment.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  late Dio _dio;

  factory ApiService({String? accessToken}) {
    _instance._dio.options.headers['Authorization'] = 'Bearer $accessToken';
    return _instance;
  }

  ApiService._internal() {
    _dio = Dio();
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.baseUrl = Environment.apiUrl;
        return handler.next(options);
      },
      onError: (e, handler) async {
        var error = DioError(
          response: e.response,
          type: e.type,
          requestOptions: e.requestOptions,
        );

        if (e.response?.statusCode == 401) {
          error = error.copyWith(
              message:
                  e.response?.data['err']['description'] ?? 'Token incorrecto');
        }

        if (e.response?.statusCode == 500) {
          error = error.copyWith(
              message:
                  e.response?.data['err']['description'] ?? 'Status code 500');
        }

        if (e.type == DioErrorType.connectionTimeout) {
          error = error.copyWith(message: 'Revisar conexion a internert');
        }

        return handler.reject(error);
      },
    ));
  }

  Dio get dio => _dio;
}
