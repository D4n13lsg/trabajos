import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetUserName extends StatelessWidget {
  final String documentId;
  GetUserName({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('cuentas');

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