import 'package:dio/dio.dart';
import 'package:app_vida_saludable/infrastructure/services/api_service.dart';
import 'package:app_vida_saludable/config/utils/errors/custom_errors.dart';

import 'package:app_vida_saludable/infrastructure/mappers/mappers.dart';
import 'package:app_vida_saludable/domain/datasources/datasources.dart';
import 'package:app_vida_saludable/domain/entities/entities.dart';

class AuthDataSourceImpl extends AuthDataSource {
  @override
  Future<LoginResponse> login(String dui, String password) async {
    try {
      final response = await ApiService().dio.post('/mnt-persona/login', data: {
        'documento': dui,
        'password': password,
      });

      final loginResponse = LoginResponseMapper.jsonToEntity(response.data);
      return loginResponse;
    } on DioError catch (e) {
      throw CustomError(e.message);
    }
  }

  @override
  Future<LoginResponse> register(String dui, String password) {
    throw UnimplementedError();
  }

  @override
  Future<LoginResponse> checkAuthStatus(String refreshToken) async {
    try {
      final response = await ApiService()
          .dio
          .post('/refresh', data: {'refresh_token': refreshToken});
      final loginResponse = LoginResponseMapper.jsonToEntity(response.data);
      return loginResponse;
    } on DioError catch (e) {
      throw CustomError(e.message);
    }
  }
}
