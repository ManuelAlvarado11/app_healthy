import 'package:app_vida_saludable/domain/entities/entities.dart';

abstract class SharedRepository {
  Future<List<DepartamentoResponse>> getDepartamentos();
  Future<List<MunicipioResponse>> getMunicipios(int idDepartamento);
}
