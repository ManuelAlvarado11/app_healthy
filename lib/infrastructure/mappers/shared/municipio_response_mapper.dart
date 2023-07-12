import 'package:app_vida_saludable/domain/entities/entities.dart';

class MunicipioResponseMapper {
  static MunicipioResponse jsonToEntity(Map<String, dynamic> json) =>
      MunicipioResponse(
        id: json['id'],
        nombre: json['nombre'],
        idDepartamento: json['id_departamento'],
      );
}
