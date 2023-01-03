class MisPedidos {
  List<MiPedido> dato = [];
  MisPedidos();

  MisPedidos.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = new MiPedido.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}
//     $result["rp"]           ='ok';
//     $result["id"]           =$registro['id'];
//     $result["orden"]    =$registro['orden'];
//     $result["fecha"]       =$registro['fecha'];//confi
//     $result["idCliente"]     =$registro['idCliente'];
//     $result["nombre"]       =$registro['nombre'];
//     $result["totalPedido"]    =$registro['totalPedido'];
//     $result["estado"]    =$registro['estado'];
//     $result["confi"]   =$registro['confi'];

class MiPedido {
  String rp;
  String id;
  String orden;
  String fecha;
  String idCliente;
  String nombre;
  String totalPedido;
  String estado;
  String confi;

  MiPedido({
    this.rp,
    this.id,
    this.orden,
    this.fecha,
    this.idCliente,
    this.nombre,
    this.totalPedido,
    this.estado,
    this.confi,
  });

  MiPedido.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'];
    id = datos['id'];
    orden = datos['orden'];
    fecha = datos['fecha'];
    idCliente = datos['idCliente'];
    nombre = datos['nombre'];
    totalPedido = datos['totalPedido'];
    estado = datos['estado'];
    confi = datos['confi'];
  }
}
