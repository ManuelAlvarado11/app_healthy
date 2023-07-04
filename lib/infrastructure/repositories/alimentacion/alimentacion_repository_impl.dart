import 'package:app_vida_saludable/domain/entities/entities.dart';
import 'package:app_vida_saludable/domain/datasources/datasources.dart';
import 'package:app_vida_saludable/domain/repositories/repositories.dart';

class AlimentacionRepositoryImpl extends AlimentacionRepository {
  final AlimentacionDataSource dataSource;

  AlimentacionRepositoryImpl(this.dataSource);

  @override
  Future<List<RecomendacionResponse>> getRecomendaciones(int tipo) {
    return dataSource.getRecomendaciones(tipo);
  }

  @override
  Future<List<ContenidoResponse>> getContenidos(int tipo) {
    return dataSource.getContenidos(tipo);
  }
}
