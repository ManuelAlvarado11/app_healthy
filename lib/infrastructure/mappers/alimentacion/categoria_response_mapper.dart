import 'package:app_vida_saludable/domain/entities/entities.dart';

class CategoriaResponseMapper {
  static CategoriaResponse jsonToEntity(Map<String, dynamic> json) =>
      CategoriaResponse(
        id: json['id'],
        tipo: json['tipo'],
        nombre: json['nombre'],
        banner: json['banner'],
        activo: json['activo'],
        fechaHoraReg: json['fechaHoraReg'],
        creadoPor: json['creadoPor'],
        idCategoria: json['idCategoria'],
      );
}
