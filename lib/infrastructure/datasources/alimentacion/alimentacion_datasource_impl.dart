import 'package:dio/dio.dart';
import 'package:app_vida_saludable/config/utils/errors/auth_errors.dart';
import 'package:app_vida_saludable/domain/entities/entities.dart';
import 'package:app_vida_saludable/domain/datasources/datasources.dart';
import 'package:app_vida_saludable/infrastructure/mappers/mappers.dart';
import 'package:app_vida_saludable/infrastructure/services/services.dart';

class AlimentacionDataSourceImpl extends AlimentacionDataSource {
  final String accessToken;

  AlimentacionDataSourceImpl({required this.accessToken});

  @override
  Future<List<RecomendacionResponse>> getRecomendaciones(int tipo) async {
    try {
      final List<RecomendacionResponse> recomendaciones = [];

      final response = await ApiService(accessToken: accessToken).dio.get<List>(
        '/recomendacion/recomendacionesPersona',
        queryParameters: {'tipo': tipo},
      );

      for (var recomendacion in response.data ?? []) {
        recomendaciones
            .add(RecomendacionResponseMapper.jsonToEntity(recomendacion));
      }
      return recomendaciones;
    } on DioError catch (e) {
      throw CustomError(e.message);
    }
  }

  @override
  Future<List<ContenidoResponse>> getContenidos(int tipo) async {
    try {
      final List<ContenidoResponse> contenidos = [];

      final response = await ApiService(accessToken: accessToken).dio.get<List>(
        '/recomendacion',
        queryParameters: {'tipo': tipo},
      );

      for (var contenido in response.data ?? []) {
        contenidos.add(ContenidoResponseMapper.jsonToEntity(contenido));
      }
      return contenidos;
    } on DioError catch (e) {
      throw CustomError(e.message);
    }
  }
}
