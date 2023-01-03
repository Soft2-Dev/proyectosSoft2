import 'package:admin_dashbuard/provider/productos/productosProvider.dart';
import 'package:admin_dashbuard/provider/registerFromProvider.dart';
import 'package:admin_dashbuard/ui/buttons/customOuntlined.dart';
import 'package:admin_dashbuard/ui/inputs/customInpunt.dart';
import 'package:admin_dashbuard/ui/labels/customLabels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/productos/productosFromProvider.dart';
import '../../../../services/navigationService.dart';
import '../../../buttons/customOuntlinedIcon.dart';

class NewProductos extends StatefulWidget {
  const NewProductos({
    Key? key,
  }) : super(key: key);
  @override
  _NewProductosState createState() => _NewProductosState();
}

class _NewProductosState extends State<NewProductos> {
  @override
  void initState() {
    Provider.of<ProductosProvider>(context, listen: false).getCategorias();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductosProvider>(context);
    final categoria = Provider.of<ProductosProvider>(context).categoria;

    final List<Widget> itemMap = categoria
        .map((e) => InkWell(
            onTap: () {
              setState(() {
                Navigator.pop(context);
                provider.isSelectCategoria = e.categoria!;
                provider.isSelectIdCategoria = e.id!;
              });
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5),
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(5)),
              child: Text(e.categoria!),
            )))
        .toList();

    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
        create: (_) => RegisterFromProvider(),
        child: Builder(builder: (context) {
          final registerFromProvider =
              Provider.of<ProductosFormProvider>(context, listen: false);
          return Container(
            color: Colors.black45,
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: size.height * 0.05),
                    padding: EdgeInsets.only(bottom: 20, top: 20),
                    width: size.width * 0.5,
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: Text(
                      'Nuevo Producto',
                      style: CustomLabels.h1,
                    )),
                Container(
                  width: size.width * 0.5,
                  height: size.height * 0.7,
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  //color: Colors.green,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: size.width * 0.5),
                      child: Form(
                          autovalidateMode: AutovalidateMode.always,
                          key: registerFromProvider.fromkey,
                          child: Column(
                            children: [
                              // usuario
                              Row(
                                children: [
                                  Container(
                                    width: size.width * 0.1,
                                    height: 70,
                                    child: TextFormField(
                                      onChanged: (value) =>
                                          registerFromProvider.plu = value,
                                      validator: (value) {
                                        if (value == null || value.isEmpty)
                                          return 'Este campo es obligatorio';
                                        return null; //---> valido
                                      },
                                      style: TextStyle(color: Colors.grey),
                                      decoration:
                                          CustomInputs.formInputDecoration(
                                              hint: 'Código',
                                              label: 'Código',
                                              icon: Icons.pin),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      onChanged: (value) =>
                                          registerFromProvider.producto = value,
                                      validator: (value) {
                                        if (value == null || value.isEmpty)
                                          return 'Este campo es obligatorio';
                                        return null; //---> valido
                                      },
                                      style: TextStyle(color: Colors.grey),
                                      decoration:
                                          CustomInputs.formInputDecoration(
                                              hint:
                                                  'Ingrese Nombre del Producto',
                                              label: 'Nombre Producto',
                                              icon: Icons.inventory_outlined),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 20,
                              ),

                              Row(children: [
                                Expanded(
                                  child: TextFormField(
                                    onChanged: (value) =>
                                        registerFromProvider.cantidad = value,
                                    validator: (value) {
                                      if (value == null || value.isEmpty)
                                        return 'Este campo es obligatorio';
                                      return null; //---> valido
                                    },
                                    style: TextStyle(color: Colors.grey),
                                    decoration:
                                        CustomInputs.formInputDecoration(
                                            hint: 'Cantidad',
                                            label: 'Cantidad de Producto',
                                            icon: Icons.plus_one),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    onChanged: (value) =>
                                        registerFromProvider.referencia = value,
                                    validator: (value) {
                                      if (value == null || value.isEmpty)
                                        return 'Este campo es obligatorio';
                                      return null; //---> valido
                                    },
                                    style: TextStyle(color: Colors.grey),
                                    decoration:
                                        CustomInputs.formInputDecoration(
                                            hint: 'Referencia',
                                            label: 'Referencia del Producto',
                                            icon: Icons.burst_mode),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    onChanged: (value) => registerFromProvider
                                        .presentacion = value,
                                    validator: (value) {
                                      if (value == null || value.isEmpty)
                                        return 'Este campo es obligatorio';
                                      return null; //---> valido
                                    },
                                    style: TextStyle(color: Colors.grey),
                                    decoration:
                                        CustomInputs.formInputDecoration(
                                            hint: 'Presentación',
                                            label: 'Presentación de Producto',
                                            icon: Icons.inventory),
                                  ),
                                ),
                              ]),
                              SizedBox(
                                height: 20,
                              ),

                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        onChanged: (value) =>
                                            registerFromProvider.valorMayor =
                                                value,
                                        validator: (value) {
                                          if (value == null || value.isEmpty)
                                            return 'Este campo es obligatorio';
                                          return null; //---> valido
                                        },
                                        style: TextStyle(color: Colors.grey),
                                        decoration:
                                            CustomInputs.formInputDecoration(
                                                hint: 'Valor',
                                                label: 'Valor del Producto',
                                                icon: Icons.paid_outlined),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        onChanged: (value) =>
                                            registerFromProvider.impuesto =
                                                value,
                                        validator: (value) {
                                          if (value == null || value.isEmpty)
                                            return 'Este campo es obligatorio';
                                          return null; //---> valido
                                        },
                                        style: TextStyle(color: Colors.grey),
                                        decoration:
                                            CustomInputs.formInputDecoration(
                                                hint: 'Impuesto',
                                                label: 'Impuesto del Producto',
                                                icon: Icons.price_check),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: (() {
                                          _buildAlertDialog(itemMap);
                                        }),
                                        child: Container(
                                            padding: EdgeInsets.only(left: 6),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.indigo
                                                      .withOpacity(0.5)),
                                            ),
                                            child: Row(
                                              children: [
                                                Text(provider.isSelectCategoria,
                                                    style: TextStyle(
                                                        color: Colors.grey)),
                                                Expanded(child: Container()),
                                                Icon(
                                                    Icons
                                                        .arrow_drop_down_circle_outlined,
                                                    color: Colors.grey),
                                              ],
                                            )),
                                      ),
                                    ),
                                  ]),

                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                maxLines: 5,
                                onFieldSubmitted: (value) {
                                  // _voidFromSubmit(authprovider,
                                  //     registerFromProvider, context);
                                },
                                onChanged: (value) =>
                                    registerFromProvider.descripcion = value,
                                style: TextStyle(color: Colors.grey),
                                decoration: CustomInputs.formInputDecoration(
                                    hint: 'Ingrese Descripción de Producto',
                                    label: 'Descripción Producto',
                                    icon: Icons.description),
                              ),

                              SizedBox(
                                height: 20,
                              ),

                              //password

                              // TextFormField(
                              //   onFieldSubmitted: (value) {
                              //     // _voidFromSubmit(authprovider,
                              //     //     registerFromProvider, context);
                              //   },
                              //   onChanged: (value) =>
                              //       registerFromProvider.url = value,
                              //   style: TextStyle(color: Colors.grey),
                              //   decoration: CustomInputs.formInputDecoration(
                              //       hint: 'Ingrese Url Imagen',
                              //       label: 'Ingrese Imagen',
                              //       icon: Icons.image_outlined),
                              // ),

                              SizedBox(
                                height: 20,
                              ),

                              OuntlinedButton(
                                text: 'Crear Producto',
                                onPressed: () {
                                  _voidFromSubmit(
                                      provider, registerFromProvider, context);
                                },
                                isFilled: false,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              OuntlinedButtonIcon(
                                text: 'Carga Masiva',
                                color: Colors.green,
                                textColor: Colors.green,
                                onPressed: () {
                                  NavigationService.navigateTo(
                                      '/dashboard/cargarproductos');
                                },
                                isFilled: false,
                                padingHorizontal: size.width * 0.184,
                              ),

                              SizedBox(
                                height: 20,
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }

  _voidFromSubmit(ProductosProvider provider,
      ProductosFormProvider registerFromProvider, BuildContext context) {
    final validFrom = registerFromProvider.validateFrom();
    if (!validFrom) return;
    final provider = Provider.of<ProductosProvider>(context, listen: false);
    String posicion = (registerFromProvider.posicion == '')
        ? '1'
        : registerFromProvider.posicion;
    String plu =
        (registerFromProvider.plu == '') ? '1' : registerFromProvider.plu;

    String producto = (registerFromProvider.producto == '')
        ? '1'
        : registerFromProvider.producto;

    String cantidad = (registerFromProvider.cantidad == '')
        ? '1'
        : registerFromProvider.cantidad;

    String descripcion = (registerFromProvider.descripcion == '')
        ? '1'
        : registerFromProvider.descripcion;

    String referencia = (registerFromProvider.referencia == '')
        ? '1'
        : registerFromProvider.referencia;

    String presentacion = (registerFromProvider.presentacion == '')
        ? '1'
        : registerFromProvider.presentacion;

    String valorMayor = (registerFromProvider.valorMayor == '')
        ? '1'
        : registerFromProvider.valorMayor;

    String valorDetal = (registerFromProvider.valorDetal == '')
        ? '1'
        : registerFromProvider.valorDetal;

    String impuesto = (registerFromProvider.impuesto == '')
        ? '1'
        : registerFromProvider.impuesto;

    String url =
        (registerFromProvider.url == '') ? '1' : registerFromProvider.url;

    String estado =
        (registerFromProvider.estado == '') ? '1' : registerFromProvider.estado;

    provider.registrarProductos(
        posicion,
        plu,
        producto,
        cantidad,
        descripcion,
        referencia,
        presentacion,
        valorMayor,
        valorDetal,
        impuesto,
        url,
        estado,
        context);
  }

  _buildAlertDialog(List<Widget> itemMap) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Notificaciones'),
        content: Container(
          height: 450,
          width: 200,
          child: ListView(children: [...itemMap]),
        ),
      ),
    );
  }
}
