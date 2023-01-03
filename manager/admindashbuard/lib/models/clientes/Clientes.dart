class Clientes {
  List<Cliente> dato = [];
  Clientes();

  Clientes.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = new Cliente.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class Cliente {
  String? rp;
  String? id;
  String? documento;
  String? nombre;
  String? telefono;
  String? correo;
  String? direccion;
  String? ciudad;
  String? contrasena;
  String? rol;
  String? estado;

  Cliente({
    this.rp,
    this.id,
    this.documento,
    this.nombre,
    this.telefono,
    this.correo,
    this.direccion,
    this.ciudad,
    this.contrasena,
    this.rol,
    this.estado,
  });

  Cliente.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'];
    id = datos['id'];
    documento = datos['documento'];
    nombre = datos['nombre'];
    telefono = datos['telefono'];
    correo = datos['correo'];
    direccion = datos['direccion'];
    ciudad = datos['ciudad'];
    contrasena = datos['contrasena'];
    rol = datos['rol'];
    estado = datos['estado'];
  }
}
