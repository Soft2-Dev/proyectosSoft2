class Pedidos {
  List<Pedido> dato = [];
  Pedidos();

  Pedidos.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = new Pedido.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

// $isRpta=true;
// $result["rp"]           ='ok';
// $result["id"]           =$registro['id'];
// $result["orden"]        =$registro['orden'];
// $result["fecha"]        =$registro['fecha'];
// $result["nombre"]       =$registro['nombre'];
// $result["totalPedido"]  =$registro['totalPedido'];
// $result["idParametro"] =$registro['idParametro'];
// $result["estado"] =$registro['estado'];
// $json['rpta'][]         =$result;

class Pedido {
  String? rp;
  String? id;
  String? orden;
  String? fecha;
  String? nombre;
  String? totalPedido;
  String? idParametro;
  String? estado;
  int? confi;

  Pedido({
    this.rp,
    this.id,
    this.orden,
    this.fecha,
    this.nombre,
    this.totalPedido,
    this.idParametro,
    this.estado,
    this.confi,
  });

  Pedido.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'];
    id = datos['id'];
    orden = datos['orden'];
    fecha = datos['fecha'];
    nombre = datos['nombre'];
    totalPedido = datos['totalPedido'];
    idParametro = datos['idParametro'];
    estado = datos['estado'];
    String color = '0xff' + datos['confi'];
    print('******   ' + color);
    confi = int.parse(color);
  }
}
