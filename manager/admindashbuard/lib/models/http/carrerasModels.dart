class Carreras {
  List<Carrera> dato = [];
  Carreras();

  Carreras.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = new Carrera.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class Carrera {
  String? id;
  String? carrera;
  String? descripcion;
  String? img;
  String? estado;

  Carrera({
    this.id,
    this.carrera,
    this.descripcion,
    this.img,
    this.estado,
  });

  Carrera.fromJsonMap(Map<String, dynamic> datos) {
    id = datos['id'];
    carrera = datos['carrera'];
    descripcion = datos['descripcion'];
    img = datos['img'];
    estado = datos['estado'];
  }
}
