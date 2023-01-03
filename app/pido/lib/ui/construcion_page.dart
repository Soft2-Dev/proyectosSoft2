import 'package:flutter/material.dart';

class Construccion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Seccion en Construcción', style: TextStyle(fontSize: 25)),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back_ios),
          backgroundColor: Colors.yellow[900],
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}
