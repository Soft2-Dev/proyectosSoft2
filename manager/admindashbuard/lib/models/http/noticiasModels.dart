class Noticias {
  List<Noticia> dato = [];
  Noticias();

  Noticias.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = new Noticia.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class Noticia {
  String? id;
  String? titulo;
  String? descripcion;
  String? urlImagen;
  String? urlnota;
  String? estado;

  Noticia({
    this.id,
    this.titulo,
    this.descripcion,
    this.urlImagen,
    this.urlnota,
    this.estado,
  });

  Noticia.fromJsonMap(Map<String, dynamic> datos) {
    id = datos['id'];
    titulo = datos['titulo'];
    descripcion = datos['descripcion'];
    urlImagen = datos['urlImagen'];
    urlnota = datos['urlnota'];
    estado = datos['estado'];
  }
}
