import 'package:flutter/material.dart';
import 'package:login/pages/Login_page.dart';

class card extends StatelessWidget{

  @override
  //Lo primero que todo desarrollador de Flutter/Dart debe comprender es que en este marco «TODO ES UN WIDGET». 
  //Los widgets son básicamente componentes de la interfaz de usuario utilizados para crear la interfaz de usuario de la aplicación (valga la redondancia)
  Widget build(BuildContext context) {
    //Entonces miremos un ejemplo de uso. Hemos utilizado la AppBar, el body es un widget, puede usar el widget que desees. 
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          title: Text('Cards app'),
        ),
        body: ListView(
          children: <Widget>[
            
          ],
        ));
  }
}
