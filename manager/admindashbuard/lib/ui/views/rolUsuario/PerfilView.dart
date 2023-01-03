import 'package:admin_dashbuard/api/AllApi.dart';
import 'package:admin_dashbuard/models/http/usuarios.dart';
import 'package:admin_dashbuard/provider/studentsProvider.dart';
import 'package:admin_dashbuard/provider/userFromProvider.dart';
import 'package:admin_dashbuard/ui/cards/whiteCard.dart';
import 'package:admin_dashbuard/ui/inputs/customInpunt.dart';
import 'package:admin_dashbuard/ui/labels/customLabels.dart';
import 'package:admin_dashbuard/ui/shared/widgets/documents.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PerfilView extends StatefulWidget {
  final String uid;

  const PerfilView({Key? key, required this.uid}) : super(key: key);

  @override
  _PerfilViewState createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  Usuario? user;
  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<StudentsProvider>(context, listen: false);
    final userFromProvider =
        Provider.of<UserFormProvider>(context, listen: false);

    userProvider.getEstudiante(widget.uid).then((userDB) {
      userFromProvider.user = userDB[0];
      setState(() {
        this.user = userDB[0];
      });
    });
    userProvider.getdocuments(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Mi Perfil',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          if (user == null)
            WhiteCard(
                child: Container(
              alignment: Alignment.center,
              height: 400,
              child: CircularProgressIndicator(),
            )),
          if (user != null)
            _UserViewBody(
              uid: widget.uid,
              user: user,
            )
        ],
      ),
    );
  }
}

class _UserViewBody extends StatelessWidget {
  final String uid;
  final Usuario? user;
  const _UserViewBody({Key? key, required this.uid, this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final documents = Provider.of<StudentsProvider>(context);
    return (user == null)
        ? CircularProgressIndicator()
        : Container(
            child: Column(
              children: [
                Table(
                  columnWidths: {0: FixedColumnWidth(300)},
                  children: [
                    TableRow(children: [
                      _AvatarContainer(user: user),
                      _UserViewForm(uid: uid),
                    ])
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                if (documents.documents[0].id != 'NoExiste')
                  WhiteCard(
                      title: 'Documentos',
                      child: Column(
                        children: [
                          DocumentsWidget(
                            text: 'Documento de identidad ampliado 150%',
                            documento: documents.documents[0].documento!,
                            url: (documents.documents[0].urldocumento != null)
                                ? documents.documents[0].urldocumento!
                                : '',
                            uid: uid,
                            tipo: 'd',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DocumentsWidget(
                            text:
                                'Certificado de Estudio (diploma bachillerato/acta de grado) 9° / 11',
                            documento: documents.documents[0].cestudios!,
                            url: (documents.documents[0].urlestudios != null)
                                ? documents.documents[0].urlestudios!
                                : '',
                            uid: uid,
                            tipo: 'e',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DocumentsWidget(
                            text: 'Fotografia tamaño 3x4 fondo blanco',
                            documento: documents.documents[0].foto!,
                            url: (documents.documents[0].urlfoto != null)
                                ? documents.documents[0].urlfoto!
                                : '',
                            uid: uid,
                            tipo: 'f',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DocumentsWidget(
                            text:
                                'Certificado médico en el cual conste que puede vivir en comunidad',
                            documento: documents.documents[0].cMedico!,
                            url: (documents.documents[0].urlmedico != null)
                                ? documents.documents[0].urlmedico!
                                : 'null',
                            uid: uid,
                            tipo: 'm',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DocumentsWidget(
                            text: 'VACUNAS Tétanos - Hepatitis B - Influenza',
                            documento: documents.documents[0].cvacunas!,
                            url: (documents.documents[0].urlvacunas != null)
                                ? documents.documents[0].urlvacunas!
                                : '',
                            uid: uid,
                            tipo: 'v',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DocumentsWidget(
                            text: 'Legajador Celuguia y carpeta colgante',
                            documento: documents.documents[0].legajador!,
                            url: (documents.documents[0].urllegajador != null)
                                ? documents.documents[0].urllegajador!
                                : '',
                            uid: uid,
                            tipo: 'l',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DocumentsWidget(
                            text: 'Formato de condiciones de matricula firmado',
                            documento: documents.documents[0].fcondiciones!,
                            url: (documents.documents[0].urlcondiciones != null)
                                ? documents.documents[0].urlcondiciones!
                                : '',
                            uid: uid,
                            tipo: 'c',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DocumentsWidget(
                            text:
                                'Formulario de matricula diligenciado con datos personales',
                            documento: documents.documents[0].fmatricula!,
                            url: (documents.documents[0].urlmatricula != null)
                                ? documents.documents[0].urlmatricula!
                                : '',
                            uid: uid,
                            tipo: 'p',
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ))
              ],
            ),
          );
  }
}

class _UserViewForm extends StatelessWidget {
  final uid;

  const _UserViewForm({Key? key, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;

    return WhiteCard(
      title: 'Información de Usuario',
      child: Form(
        key: userFormProvider.fromkeyUsuario,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) =>
                  userFormProvider.copyUserWith(nombre: value),
              initialValue: user.nombre,
              decoration: CustomInputs.formInputDecoration(
                  hint: 'Nombre de Usuario',
                  label: 'Nombre',
                  icon: Icons.supervised_user_circle_outlined),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Ingrese Un Nombre';
                if (value.length < 3) return 'El nombre es Demaciado Corto';
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (value) =>
                  userFormProvider.copyUserWith(direccion: value),
              initialValue: user.direccion,
              decoration: CustomInputs.formInputDecoration(
                  hint: 'Dirreción de Recidencia',
                  label: 'Dirreción',
                  icon: Icons.place_outlined),
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Ingrese Una Dirección';
                if (value.length < 10) return 'Ingrese una dirección valida';
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                onChanged: (value) =>
                    userFormProvider.copyUserWith(telefono: value),
                initialValue: user.telefono,
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Télefono de Usuario',
                    label: 'Télefono/Celular',
                    icon: Icons.smartphone_outlined),
                validator: (value) {
                  if (value == null) return 'Ingrese un Nuemro de Celular';
                  if (value.length < 7)
                    return 'Ingrese un Numero de Celular valido';
                  return null; //---> valido
                }),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (value) =>
                  userFormProvider.copyUserWith(correo: value),
              initialValue: user.correo,
              decoration: CustomInputs.formInputDecoration(
                  hint: 'Correo Electrónico de Usuario',
                  label: 'Correo',
                  icon: Icons.mark_email_read_outlined),
              validator: (value) {
                if (!EmailValidator.validate(value ?? ''))
                  return 'Email no Valido ';
              },
            ),
            SizedBox(
              height: 20,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 100),
              child: ElevatedButton(
                onPressed: () {
                  userFormProvider.updateUser(uid);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    shadowColor: MaterialStateProperty.all(Colors.transparent)),
                child: Row(
                  children: [Icon(Icons.save_outlined), Text('  Guardar')],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AvatarContainer extends StatelessWidget {
  final Usuario? user;

  const _AvatarContainer({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;
    final url = AllApi.url;
    return WhiteCard(
        child: Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Foto',
            style: CustomLabels.h2,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 150,
            height: 160,
            child: Stack(
              children: [
                // ClipOval(
                //     child: (user.img == null)
                //         ? Image(image: AssetImage('img/no-image.jpg'))
                //         : Image.network(url + '/documentos/' + user.img!)),
                Positioned(
                  right: 5,
                  bottom: 5,
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white, width: 5)),
                    child: FloatingActionButton(
                      backgroundColor: Colors.indigo,
                      onPressed: () {},
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            user.nombre!,
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ));
  }
}
