class Categorias {
  List<Categoria> dato = [];
  Categorias();

  Categorias.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = new Categoria.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class Categoria {
  String rp;
  String id;
  String categoria;
  String url;
  String estado;

  Categoria({
    this.rp,
    this.id,
    this.categoria,
    this.url,
    this.estado,
  });

  Categoria.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'];
    id = datos['id'];
    categoria = datos['categoria'];
    url = datos['url'];
    estado = datos['estado'];
  }
}
