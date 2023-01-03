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


// $result["rp"]='ok';
// $result["id"]=$registro['id'];
// $result["plu"]=$registro['plu'];
// $result["presentacion"]=$registro['presentacion'];
// $result["cantExiste"]=$registro['cantExiste'];
// $result["producto"]=$registro['producto'];
// $result["valorMayor"]=$registro['valorMayor'];
// $result["url"]=$registro['url'];
// $result["idDetalle"]=$registro['idDetalle'];
// $result["cantidad"]=$registro['cantidad'];
// $result["totalProducto"]=$registro['totalProducto'];

class Detalle {
  String rp;
  String id;
  String plu;
  String presentacion;
  String cantExiste;
  String producto;
  String valorMayor;
  String url;
  String idDetalle;
  String cantidad;
  String totalProducto;



  Detalle({
    this.rp,
    this.id,
    this.plu,
    this.presentacion,
    this.cantExiste,
    this.producto,
    this.valorMayor,
    this.url,
    this.idDetalle,
    this.cantidad,
    this.totalProducto,

    

   
  });

  Detalle.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'];
    id = datos['id'];
    plu = datos['plu'];
    presentacion = datos['presentacion'];
    cantExiste = datos['cantExiste'];
    producto = datos['producto'];
    valorMayor = datos['valorMayor'];
    url = datos['url'];
    idDetalle = datos['idDetalle'];
    cantidad = datos['cantidad'];
    totalProducto = datos['totalProducto'];

    

    
  }
}
