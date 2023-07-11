class CategoriaResponse {
  final int id;
  final int tipo;
  final String nombre;
  final String banner;
  final bool activo;
  final String fechaHoraReg;
  final int creadoPor;
  final int idCategoria;

  CategoriaResponse({
    required this.id,
    required this.tipo,
    required this.nombre,
    required this.banner,
    required this.activo,
    required this.fechaHoraReg,
    required this.creadoPor,
    required this.idCategoria,
  });
}
