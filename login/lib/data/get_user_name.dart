import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//se crea una clase 
class GetUserName extends StatelessWidget {
  final String documentId;
  GetUserName({required this.documentId});

  @override
  // Los widgets son básicamente componentes de la interfaz de usuario utilizados para crear la interfaz de usuario de la aplicación 
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('cuentas');

    //se crea un retorno
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: ((context, shapshot){
          if(shapshot.connectionState == ConnectionState.done){
            Map<String, dynamic> data =
            shapshot.data!.data() as Map<String, dynamic>;
            return Text('usuarios: ${data['nombre']} ${data['apellido']}, ${data['usuario']}');
          }
          return const Text('cargando..');
        })
    );
  }
}
