import 'package:app_vida_saludable/domain/entities/entities.dart';

abstract class AlimentacionRepository {
  Future<List<RecomendacionResponse>> getRecomendaciones(int tipo);
  Future<List<ContenidoResponse>> getContenidos(int tipo);
  Future<List<CategoriaResponse>> getCategorias();
}
