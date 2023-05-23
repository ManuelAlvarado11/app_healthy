import 'package:dio/dio.dart';
import 'package:app_vida_saludable/config/utils/errors/auth_errors.dart';

import 'package:app_vida_saludable/infrastructure/datasources/datasources.dart';
import 'package:app_vida_saludable/infrastructure/mappers/mappers.dart';
import 'package:app_vida_saludable/domain/datasources/datasources.dart';
import 'package:app_vida_saludable/domain/entities/entities.dart';

class AuthDataSourceImpl extends AuthDataSource {
  @override
  Future<LoginResponse> login(String dui, String password) async {
    try {
      final response = await ApiClient().dio.post('/mnt-persona/login', data: {
        'documento': dui,
        'password': password,
      });

      final loginResponse =
          LoginResponseMapper.loginResponseJsonToEntity(response.data);
      return loginResponse;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError(e.response?.data['err']['description'] ??
            'Credenciales incorrectas');
      }
      if (e.type == DioErrorType.connectionTimeout) {
        throw CustomError('Revisar conexion a internert');
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
