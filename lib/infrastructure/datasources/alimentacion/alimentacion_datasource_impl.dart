import 'package:app_vida_saludable/config/utils/errors/auth_errors.dart';
import 'package:app_vida_saludable/domain/entities/entities.dart';
import 'package:app_vida_saludable/domain/datasources/datasources.dart';

import 'package:app_vida_saludable/infrastructure/mappers/mappers.dart';
import 'package:app_vida_saludable/infrastructure/services/services.dart';
import 'package:dio/dio.dart';

class AlimentacionDataSourceImpl extends AlimentacionDataSource {
  final String accessToken;

  AlimentacionDataSourceImpl({required this.accessToken});

  @override
  Future<List<RecomendacionResponse>> getRecomendaciones(int tipo) async {
    try {
      final List<RecomendacionResponse> recomendaciones = [];

      final response = await ApiService(accessToken: accessToken).dio.get<List>(
            '/recomendacion/recomendacionesPersona',
          );

      for (var recomendacion in response.data ?? []) {
        recomendaciones
            .add(RecomendacionResponseMapper.jsonToEntity(recomendacion));
      }
      return recomendaciones;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError(
            e.response?.data['err']['description'] ?? 'Token incorrecto');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }
}
