import 'package:dio/dio.dart';
import 'package:app_vida_saludable/config/utils/errors/custom_errors.dart';
import 'package:app_vida_saludable/domain/entities/entities.dart';
import 'package:app_vida_saludable/domain/datasources/datasources.dart';
import 'package:app_vida_saludable/infrastructure/mappers/mappers.dart';
import 'package:app_vida_saludable/infrastructure/services/services.dart';

class SharedDataSourceImpl extends SharedDataSource {
  final String accessToken;

  SharedDataSourceImpl({required this.accessToken});

  @override
  Future<List<DepartamentoResponse>> getDepartamentos() async {
    try {
      final List<DepartamentoResponse> recomendaciones = [];

      final response = await ApiService(accessToken: accessToken).dio.get<List>(
            '/ctl-departamento/departamento',
          );

      for (var recomendacion in response.data ?? []) {
        recomendaciones
            .add(DepartamentoResponseMapper.jsonToEntity(recomendacion));
      }
      return recomendaciones;
    } on DioError catch (e) {
      throw CustomError(e.message);
    }
  }

  @override
  Future<List<MunicipioResponse>> getMunicipios(int idDepartamento) async {
    try {
      final List<MunicipioResponse> recomendaciones = [];

      final response = await ApiService(accessToken: accessToken).dio.get<List>(
        '/ctl-departamento/municipio',
        queryParameters: {'idDepartamento': idDepartamento},
      );

      for (var recomendacion in response.data ?? []) {
        recomendaciones
            .add(MunicipioResponseMapper.jsonToEntity(recomendacion));
      }
      return recomendaciones;
    } on DioError catch (e) {
      throw CustomError(e.message);
    }
  }
}
