import 'package:flutter/material.dart';


var myDefaultBackground = Colors.grey[300];

var myAppBar = AppBar(
  backgroundColor: Colors.grey[900],
  title: const Text('Maqueta'),
  actions: const [
    Image(image: AssetImage('assens/RPC-JP_Logo.png'),width: 100, height: 200,)
  ],
);

var myDrawer = Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
        decoration: const BoxDecoration(
          color: Colors.deepOrange,
        ),
        child: Column(
          children: const [
            Text(
              'usuario',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
              size: 70.0,
            )
          ],
        ),
      ),
      const ListTile(
        leading: Icon(
          Icons.home,
          color: Colors.black,
          size: 30.0,
        ),
        title: Text('principal'),
      ),
      const ListTile(
        leading: Icon(
          Icons.chat,
          color: Colors.black,
          size: 30.0,
        ),
        title: Text('mensaje'),
      ),
      const ListTile(
        leading: Icon(
          Icons.settings,
          color: Colors.black,
          size: 30.0,
        ),
        title: Text('configuracion'),
      ),
      const ListTile(
        leading: Icon(
          Icons.face_outlined,
          color: Colors.black,
          size: 30.0,
        ),
        title: Text('cara'),
      ),
      const ListTile(
        leading: Icon(
          Icons.phone,
          color: Colors.black,
          size: 30.0,
        ),
        title: Text('llamar'),
      ),
      const ListTile(
        leading: Icon(
          Icons.favorite,
          color: Colors.black,
          size: 30.0,
        ),
        title: Text('favoritos'),
      ),
      const ListTile(
        leading: Icon(
          Icons.logout,
          color: Colors.black,
          size: 30.0,
        ),
        title: Text('Salir'),
      ),
    ],
  ),
);
