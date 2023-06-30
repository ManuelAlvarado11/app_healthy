import 'package:app_vida_saludable/domain/entities/entities.dart';

class RecomendacionResponseMapper {
  static RecomendacionResponse jsonToEntity(Map<String, dynamic> json) =>
      RecomendacionResponse(
        id: json['id'],
        tipo: json['tipo'],
        activo: json['activo'],
        banner: json['banner'],
        titulo: json['titulo'],
        contenido: json['contenido'],
        urlVideo: json['url_video'],
        fechaHoraReg: json['fecha_hora_reg'],
        idRangoTipoRecom: json['id_rango_tipo_recom'],
        idUsuarioCreacion: json['id_usuario_creacion'],
        idTipoRecomendacion: json['id_tipo_recomendacion'],
      );
}
