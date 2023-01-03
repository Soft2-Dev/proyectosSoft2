import 'package:admin_dashbuard/api/AllApi.dart';
import 'package:admin_dashbuard/models/http/carrerasModels.dart';
import 'package:admin_dashbuard/provider/carrerasProvider.dart';
import 'package:admin_dashbuard/services/notificationService.dart';
import 'package:admin_dashbuard/ui/buttons/customOuntlined.dart';
import 'package:admin_dashbuard/ui/inputs/customInpunt.dart';
import 'package:admin_dashbuard/ui/labels/customLabels.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CarreraModals extends StatefulWidget {
  final Carrera? carrera;

  const CarreraModals({Key? key, this.carrera}) : super(key: key);

  @override
  _CarreraModalsState createState() => _CarreraModalsState();
}

class _CarreraModalsState extends State<CarreraModals> {
  String id = '';
  String carrera = '';
  String descripcion = '';
  String url = '';

  @override
  void initState() {
    super.initState();
    id = widget.carrera?.id ?? '';
    carrera = widget.carrera?.carrera ?? '';
    url = widget.carrera?.img ?? 'img/notfound.png';
    descripcion = widget.carrera?.descripcion ?? '';
  }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    //final carreras = Provider.of<CarrerasProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      decoration: buildBoxDecoration(),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.carrera?.carrera ?? 'Nueva Carrera',
                style: CustomLabels.h1.copyWith(color: Colors.white),
              ),
              IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop())
            ],
          ),
          Divider(
            color: Colors.white.withOpacity(0.3),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(child: _textFromFiels()),
                SizedBox(
                  width: 20,
                ),
                Container(
                    color: Colors.red,
                    child: Image(
                      image: AssetImage('img/notfound.png'),
                      fit: BoxFit.contain,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _textFromFiels() {
    return Container(
      child: Column(
        children: [
          TextFormField(
            initialValue: widget.carrera?.carrera ?? '',
            onChanged: (value) => carrera = value,
            decoration: CustomInputs.loginInputDecoration(
                hint: 'Nombre',
                label: 'Nombre de la Carrera',
                icon: Icons.new_releases_outlined),
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            maxLines: 15,
            initialValue: widget.carrera?.descripcion ?? '',
            onChanged: (value) => descripcion = value,
            decoration: CustomInputs.loginInputDecoration(
                hint: 'Descripción',
                label: 'Descripción de la Carrera',
                icon: Icons.new_releases_outlined),
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.center,
            child: OuntlinedButton(
              onPressed: () async {
                final carreraProvider =
                    Provider.of<CarrerasProvider>(context, listen: false);
                if (widget.carrera == null) {
                  // crear
                  await carreraProvider.newCarrera(carrera, descripcion, url);
                  NotificationService.showSnackBarExito(
                      'Carrera Creada Exitosamente');
                } else {
                  //print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
                  await carreraProvider.editardesCarrera(
                      id, carrera, descripcion, url);
                  NotificationService.showSnackBarExito(
                      'Carrera Editada Exitosamente');
                }

                Navigator.of(context).pop();
              },
              text: (widget.carrera == null)
                  ? 'Guardar Carrera'
                  : 'Editar Carrera',
              color: Colors.white,
              textColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        color: Color(0xff092043),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(10)),
        boxShadow: [BoxShadow(color: Colors.black26)]);
  }

  _launchURL(
      {required String tipo, required String uid, required String text}) async {
    text = text.replaceAll('%', '');
    final base = AllApi.url;
    String url = base +
        '/documentos/datos.php?tipo=' +
        tipo +
        '&token=' +
        uid +
        '&label=' +
        text;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
