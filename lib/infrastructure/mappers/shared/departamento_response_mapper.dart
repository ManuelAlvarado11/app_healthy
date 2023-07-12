import 'package:app_vida_saludable/domain/entities/entities.dart';

class DepartamentoResponseMapper {
  static DepartamentoResponse jsonToEntity(Map<String, dynamic> json) =>
      DepartamentoResponse(
        id: json['id'],
        nombre: json['nombre'],
        abreviatura: json['abreviatura'],
      );
}
