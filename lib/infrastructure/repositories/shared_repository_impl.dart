import 'package:app_vida_saludable/domain/entities/entities.dart';
import 'package:app_vida_saludable/domain/datasources/datasources.dart';
import 'package:app_vida_saludable/domain/repositories/repositories.dart';

class SharedRepositoryImpl extends SharedRepository {
  final SharedDataSource dataSource;

  SharedRepositoryImpl(this.dataSource);

  @override
  Future<List<DepartamentoResponse>> getDepartamentos() {
    return dataSource.getDepartamentos();
  }

  @override
  Future<List<MunicipioResponse>> getMunicipios(int idDepartamento) {
    return dataSource.getMunicipios(idDepartamento);
  }
}
