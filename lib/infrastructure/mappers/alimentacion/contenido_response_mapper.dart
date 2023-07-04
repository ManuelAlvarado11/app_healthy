import 'package:app_vida_saludable/domain/entities/entities.dart';

class ContenidoResponseMapper {
  static ContenidoResponse jsonToEntity(Map<String, dynamic> json) =>
      ContenidoResponse(
        id: json['id'],
        tipo: json['tipo'],
        activo: json['activo'],
        banner: json['banner'],
        titulo: json['titulo'],
        contenido: json['contenido'],
        urlVideo: json['urlVideo'],
        fechaHoraReg: json['fechaHoraReg'],
        idRangoTipoRecom: json['idRangoTipoRecom'],
        idUsuarioCreacion: json['idUsuarioCreacion'],
      );
}
