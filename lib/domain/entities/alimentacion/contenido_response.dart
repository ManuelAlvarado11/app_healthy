class ContenidoResponse {
  final int id;
  final int tipo;
  final bool activo;
  final String banner;
  final String titulo;
  final String contenido;
  final dynamic urlVideo;
  final String fechaHoraReg;
  final dynamic idRangoTipoRecom;
  final int idUsuarioCreacion;

  ContenidoResponse({
    required this.id,
    required this.tipo,
    required this.activo,
    required this.banner,
    required this.titulo,
    required this.contenido,
    required this.urlVideo,
    required this.fechaHoraReg,
    required this.idRangoTipoRecom,
    required this.idUsuarioCreacion,
  });
}
