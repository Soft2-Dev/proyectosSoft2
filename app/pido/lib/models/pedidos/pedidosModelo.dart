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




class Pedido {
  String rp;
  String id;
  String orden;
  String fecha;
  String idCliente;
  String subTotal;
  String descuento;
  String netoPedido;
  String impueto;
  String totalPedido;
  String direcPedido;
  String telePedido;
  String obsPedido;
  String estadoPedido;
  String cantidad;

 

  Pedido({
    this.rp,
    this.id,
    this.orden,
    this.fecha,
    this.idCliente,
    this.subTotal,
    this.descuento,
    this.netoPedido,
    this.impueto,
    this.totalPedido,
    this.direcPedido,
    this.telePedido,
    this.obsPedido,
    this.estadoPedido,
    this.cantidad,

   
  });

  Pedido.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'];
    id = datos['id'];
    orden = datos['orden'];
    fecha = datos['fecha'];
    idCliente = datos['idCliente'];
    subTotal = datos['subTotal'];
    descuento = datos['descuento'];
    netoPedido = datos['netoPedido'];
    impueto = datos['impueto'];
    totalPedido = datos['totalPedido'];
    direcPedido = datos['direcPedido'];
    telePedido = datos['telePedido'];
    obsPedido = datos['obsPedido'];
    estadoPedido = datos['estadoPedido'];
    cantidad = datos['cantidad'];

    
  }
}
