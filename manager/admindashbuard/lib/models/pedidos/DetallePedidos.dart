class Detalles {
  List<Detalle> dato = [];
  Detalles();

  Detalles.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = new Detalle.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

// $result["rp"]           ='ok';
// $result["id"]           =$registro['id'];
// $result["producto"]        =$registro['producto'];
// $result["cantidad"]        =$registro['cantidad'];
// $result["valorProducto"]       =$registro['valorProducto'];
// $result["impuestoProducto"] =$registro['impuestoProducto'];
// $result["totalProducto"] =$registro['totalProducto'];

class Detalle {
  String? rp;
  String? id;
  String? producto;
  String? cantidad;
  String? valorProducto;
  String? impuestoProducto;
  String? totalProducto;

  Detalle({
    this.rp,
    this.id,
    this.producto,
    this.cantidad,
    this.valorProducto,
    this.impuestoProducto,
    this.totalProducto,
  });

  Detalle.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'];
    id = datos['id'];
    producto = datos['producto'];
    cantidad = datos['cantidad'];
    valorProducto = datos['valorProducto'];
    impuestoProducto = datos['impuestoProducto'];
    totalProducto = datos['totalProducto'];
  }
}
