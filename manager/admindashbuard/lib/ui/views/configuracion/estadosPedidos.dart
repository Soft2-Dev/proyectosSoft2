import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/configuracion/estadosFromProvider.dart';
import '../../../provider/configuracion/estadosPedidosProvider.dart';
import '../../buttons/customOuntlined.dart';
import '../../inputs/customInpunt.dart';
import '../../labels/customLabels.dart';

class EstadosPedidosView extends StatefulWidget {
  EstadosPedidosView({Key? key}) : super(key: key);

  @override
  State<EstadosPedidosView> createState() => _EstadosPedidosViewState();
}

class _EstadosPedidosViewState extends State<EstadosPedidosView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final registerFromProvider =
        Provider.of<EstadosPedidosFormProvider>(context);

    final providerEstado =
        Provider.of<EstadosPedidosProvider>(context, listen: false);
    print('*****' + color.toString());
    return Container(
      color: Colors.black45,
      padding: EdgeInsets.only(
        top: size.height * 0.01,
        bottom: size.height * 0.01,
      ),
      child: ListView(
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.25),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Color(int.parse('0xff' + color))),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.only(bottom: 10, top: 10),
              width: size.width * 0.3,
              alignment: Alignment.center,
              child: Text(
                'Estado de Pedido',
                style: CustomLabels.h1,
              )),
          Container(
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.25, vertical: 20),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Color(int.parse('0xff' + color))),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.only(bottom: 10, top: 10),
              width: size.width * 0.3,
              height: size.height * 0.2,
              alignment: Alignment.center,
              child: Form(
                key: registerFromProvider.fromkey,
                child: Container(
                  width: size.width * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              onChanged: (value) =>
                                  registerFromProvider.parametro = value,
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Este campo es obligatorio';
                                return null; //---> valido
                              },
                              style: TextStyle(color: Colors.grey),
                              decoration: CustomInputs.formInputDecoration(
                                  hint: 'Ingrese Nombre de Estado',
                                  label: 'Nombre Estado',
                                  icon: Icons.task_alt),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                buildAlertDialog(context, size);
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(2),
                              alignment: Alignment.center,
                              width: size.width * 0.1,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.5,
                                      color: Color(int.parse('0xff' + color))),
                                  borderRadius: BorderRadius.circular(2)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.palette_outlined,
                                    color: Color(int.parse('0xff' + color)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Paleta de Colores',
                                    style: TextStyle(
                                        color:
                                            Color(int.parse('0xff' + color))),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      OuntlinedButton(
                        text: 'Crear Estado',
                        onPressed: () {
                          providerEstado.guardarEstados(
                              registerFromProvider.parametro, color);
                        },
                        isFilled: false,
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  String color = 'C2185B';
  buildAlertDialog(BuildContext context, Size size) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Notificaciones'),
        content: Container(
          height: size.width * 0.25,
          width: size.width * 0.25,
          child: GridView.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 4,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    color = 'f44336';
                    Navigator.pop(context);
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Color(0xfff44336),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    color = '7B1FA2';
                    Navigator.pop(context);
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Color(0xff7B1FA2),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    color = '1E88E5';
                    Navigator.pop(context);
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Color(0xff1E88E5),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    color = '43A047';
                    Navigator.pop(context);
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Color(0xff43A047),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    color = 'FDD835';
                    Navigator.pop(context);
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Color(0xffFDD835),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    color = 'FF9800';
                    Navigator.pop(context);
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Color(0xffFF9800),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    color = 'cddc39';
                    Navigator.pop(context);
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Color(0xffcddc39),
                ),
              ),
              //////
              GestureDetector(
                onTap: () {
                  setState(() {
                    color = '6D4C41';
                    Navigator.pop(context);
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Color(0xff6D4C41),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    color = '81D4FA';
                    Navigator.pop(context);
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Color(0xff81D4FA),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    color = '33FF00';
                    Navigator.pop(context);
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Color(0xff33FF00),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    color = '0000FF';
                    Navigator.pop(context);
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Color(0xff0000FF),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    color = 'FF00CC';
                    Navigator.pop(context);
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Color(0xffFF00CC),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    color = 'CCFFCC';

                    Navigator.pop(context);
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Color(0xffCCFFCC),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
