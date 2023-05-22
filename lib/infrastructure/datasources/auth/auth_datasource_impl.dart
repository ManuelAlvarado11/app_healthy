import 'package:dio/dio.dart';
import 'package:app_vida_saludable/config/constants/environment.dart';
import 'package:app_vida_saludable/config/utils/errors/auth_errors.dart';

import 'package:app_vida_saludable/infrastructure/mappers/mappers.dart';
import 'package:app_vida_saludable/domain/datasources/datasources.dart';
import 'package:app_vida_saludable/domain/entities/entities.dart';

class AuthDataSourceImpl extends AuthDataSource {
  // Cliente HTTP DIO
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
    ),
  );
  // -------------

  @override
  Future<LoginResponse> login(String dui, String password) async {
    try {
      final response = await dio.post('/mnt-persona/login', data: {
        'dui': dui,
        'password': password,
      });

      final loginResponse =
          LoginResponseMapper.loginResponseJsonToEntity(response.data);
      return loginResponse;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError('Token incorrecto');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<LoginResponse> register(String dui, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<LoginResponse> checkAuthStatus(String token) {
    // TODO: implement checkAuthStatus
    throw UnimplementedError();
  }
}
