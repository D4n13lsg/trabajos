import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../data/get_user_name.dart';

//se crea una pagina principal 
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  List<String> docIds = [];

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('cuentas')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
      print(document.reference);
      docIds.add(document.reference.id);
    }));
  }

  @override
  void initState() {
    getDocId();
    super.initState();
  }
//widgets son básicamente componentes de la interfaz de usuario utilizados para crear la interfaz de usuario de la aplicación
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Text(
            'Inicio Sesión ${user.email!}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        //Un widget que establece un ActionDispatcher y un mapa de Intent to Action para ser utilizado por sus descendientes al invocar una Acción.
        actions: [
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: FutureBuilder(
                    future: getDocId(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                        itemCount: docIds.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: GetUserName(documentId: docIds[index]),
                              tileColor: Colors.grey[200],
                            ),
                          );
                        },
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
  /*
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.deepPurple[200],
              child: const Text(
                'cerrar Sesion',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(
                child: FutureBuilder(
              future: getDocId(),
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: docIds.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: GetUserName(
                          documentId: docIds[index],
                        ),
                      );
                    });
              },
            ))
          ],
        ),
      ),
    );
  }
}
   */
