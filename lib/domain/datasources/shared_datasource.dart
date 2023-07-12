import 'package:app_vida_saludable/domain/entities/entities.dart';

abstract class SharedDataSource {
  Future<List<DepartamentoResponse>> getDepartamentos();
  Future<List<MunicipioResponse>> getMunicipios(int idDepartamento);
}
