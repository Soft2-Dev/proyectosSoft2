class Productos {
  List<Producto> dato = [];
  Productos();

  Productos.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = new Producto.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class Producto {
  String rp;
  String id;
  String posicion;
  String plu;
  String producto;
  String cantidad;
  String descripcion;
  String referencia;
  String presentacion;
  String valorMayor;
  String valorDetal;
  String impuesto;
  String fecha;
  String categoria;
  String url;
  String estado;

  Producto({
    this.rp,
    this.id,
    this.posicion,
    this.plu,
    this.producto,
    this.cantidad,
    this.descripcion,
    this.referencia,
    this.presentacion,
    this.valorMayor,
    this.valorDetal,
    this.impuesto,
    this.fecha,
    this.categoria,
    this.url,
    this.estado,
  });

  Producto.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'];
    id = datos['id'];
    posicion = datos['posision'];
    cantidad = datos['cantidad'];
    plu = datos['plu'];
    producto = datos['producto'];
    descripcion = datos['descripcion'];
    referencia = datos['referencia'];
    presentacion = datos['presentacion'];
    valorMayor = datos['valorMayor'];
    valorDetal = datos['valorDetal'];
    impuesto = datos['impuesto'];
    fecha = datos['fecha'];
    categoria = datos['categoria'];
    url = datos['url'];
    estado = datos['estado'];
  }
}
