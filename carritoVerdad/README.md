# carrito_v3

Este proyecto se muestra como realizar un carrito de compras que guarda lo que compren 
 

  

#main codigo 

import 'package:flutter/material.dart'; 

  

import 'package:carrito_v3/carrito.dart'; 

  

import 'package:carrito_v3/variables_globales.dart'; 

  

import 'package:flutter/services.dart'; 

  

void main() { 

  

  runApp(const MyApp()); 

   

} 

  

class MyApp extends StatelessWidget { 

  

  const MyApp({Key? key}) : super(key: key); 

   

  

  @override 

   

  Widget build(BuildContext context) { 

   

    return MaterialApp( 

     

      debugShowCheckedModeBanner: false, 

       

      title: 'el pollo feliz', 

       

      theme: ThemeData( 

        primarySwatch: Colors.purple, 

      ), 

      home: const principal(), 

    ); 

  } 

} 

  

class principal extends StatefulWidget { 

  const principal({Key? key}) : super(key: key); 

  

  @override 

  State<principal> createState() => _principalState(); 

} 

  

class _principalState extends State<principal> { 

  List<ListaProductos> _lista = <ListaProductos>[]; 

  

  final List<ListaProductos> _listacarrito = <ListaProductos>[]; 

  

  

  @override 

  void initState() { 

    super.initState(); 

    _productos(); 

  } 

  

  @override 

  Widget build(BuildContext context) { 

    return Scaffold( 

      appBar: AppBar( 

        title: const Text("Restaurante"), 

        actions: [ 

          Row( 

            children: [ 

              IconButton( 

                  icon: const Icon(Icons.shopping_cart), 

                  onPressed: () { 

                    if (_listacarrito.isNotEmpty) { 

                      Navigator.of(context).push( 

                        MaterialPageRoute( 

                          builder: (context) => carrito(_listacarrito), 

                        ), 

                      ); 

                    } 

                  }), 

            ], 

          ) 

        ], 

      ), 

      body: 

      //creamos el listview  es una lista lineal deslizable de elementos. 

      ListView.builder( 

          itemCount: _lista.length, 

          itemBuilder: (context, index) { 

            //se crea una card para la empresa 

            return Card( 

              elevation: 5, 

              child: Container( 

                padding: EdgeInsets.all(8), 

                child: Row( 

                  mainAxisAlignment: MainAxisAlignment.center, 

                  crossAxisAlignment: CrossAxisAlignment.center, 

                  children: [ 

                    //creamos algo para que contenga las imagenes 

                    Container( 

                      width: 75, 

                      height: 75, 

                      child: Image( 

                        image: NetworkImage( 

                          _lista[index].imagen.toString(), 

                        ), 

                        fit: BoxFit.fill, 

                      ), 

                    ), 

                    //Un widget que expande un hijo de una Fila, Columna o Flex para que el hijo llene el espacio disponible. 

                    Expanded( 

                      child: Container( 

                        padding: EdgeInsets.only(bottom: 1), 

                        child: Column( 

                          mainAxisAlignment: MainAxisAlignment.center, 

                          crossAxisAlignment: CrossAxisAlignment.start, 

                          children: [ 

                            Padding( 

                              padding: EdgeInsets.only(left: 8, right: 8), 

                              child: Text( 

                                _lista[index].nombre.toString(), 

                                style: const TextStyle( 

                                  fontSize: 18, 

                                  fontWeight: FontWeight.bold, 

                                ), 

                              ), 

                            ), 

                          ], 

                        ), 

                      ), 

                    ), 

                    IconButton( 

                        onPressed: () { 

                          //se llamará a esta devolución de llamada cuando el usuario toque la etiqueta o las partes del avatar del chip. Si onPressed es nulo, el chip se desactivará. 

                          //elije lo que quiere llevar al carro 

                          setState(() { 

                            if (_lista[index].isAdd!) { 

                            } else { 

                              _listacarrito.add(_lista[index]); 

                              _lista[index].isAdd = true; 

                            } 

                          }); 

                        }, 

                      icon: Icon( Icons.favorite), 

                    ), 

                  ], 

                ), 

              ), 

            ); 

          }), 

    ); 

  } 

  

  void _productos() { 

    var list = <ListaProductos>[ 

      //se gregan las imagenes 

      ListaProductos(nombre: 'sudado', imagen: 'Imagen/comida.jpg', id: 1, isAdd: false ), 

      ListaProductos(nombre: 'hamburgesa', imagen: 'Imagen/hamburger.jpg', id: 2, isAdd: false), 

      ListaProductos(nombre: 'pasta Rica', imagen: 'Imagen/papitas.jpg', id: 3, isAdd: false), 

      ListaProductos(nombre: 'pasta Rica', imagen: 'Imagen/pasta.jpg', id: 4, isAdd: false), 

      ListaProductos(nombre: 'pasta', imagen: 'Imagen/pastra.jpg', id: 5, isAdd: false), 

      ListaProductos(nombre: 'pasta conalgo', imagen: 'Imagen/salchipatra.jpg', id: 6, isAdd: false), 

  

    ]; 

    setState(() { 

      //se agrega toda la lista al carrito 

      _lista = list; 

    }); 

  } 

} 

  

  

#datos guardados codigo 

import 'package:carrito_v3/main.dart'; 

import 'package:flutter/material.dart'; 

import 'package:carrito_v3/variables_globales.dart'; 

  

class carrito extends StatefulWidget { 

  final List<ListaProductos> _cart; 

  

  const carrito(this._cart, {super.key}); 

  

  @override 

  _carritoState createState() => _carritoState(_cart); 

  

} 

class _carritoState extends State<carrito> { 

  

  _carritoState(this._cart); 

  List<ListaProductos> _cart; 

  

  @override 

  Widget build(BuildContext context) { 

    return Scaffold( 

      appBar: AppBar( 

        title: const Text("Lista del pollo"), 

        leading: IconButton( 

            icon: const Icon(Icons.arrow_back), 

            onPressed: () { 

              Navigator.of(context).pop(); 

              setState(() { 

                _cart.length; 

              }); 

            }), 

      ), 

      body: 

      //usamos ListView para la creacion de la lista principal de productos 

      ListView.builder( 

          itemCount: _cart.length, 

          itemBuilder: (context, index) { 

            //cada producto estara dentro de una card 

            return Card( 

              elevation: 5, 

              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 8), 

              child: Container( 

                padding: EdgeInsets.all(8), 

                child: Row( 

                  mainAxisAlignment: MainAxisAlignment.center, 

                  crossAxisAlignment: CrossAxisAlignment.center, 

                  children: [ 

                    //se crea un container para contener lo que se guarda 

                    Container( 

                      width: 75, 

                      height: 75, 

                      child: Image( 

                        image: NetworkImage( 

                          _cart[index].imagen.toString(), 

                        ), 

                        fit: BoxFit.fill, 

                      ), 

                    ), 

                    Expanded( 

                      child: Container( 

                        padding: EdgeInsets.only(bottom: 8), 

                        child: Column( 

                          mainAxisAlignment: MainAxisAlignment.center, 

                          crossAxisAlignment: CrossAxisAlignment.start, 

                          children: [ 

                            Padding( 

                              padding: EdgeInsets.only(left: 8, right: 8), 

                              child: Text( 

                                _cart[index].nombre.toString(), 

                                style: TextStyle( 

                                  fontSize: 16, 

                                  fontWeight: FontWeight.bold, 

                                ), 

                              ), 

                            ), 

                          ], 

                        ), 

                      ), 

                    ), 

                  ], 

                ), 

              ), 

            ); 

          }), 

    ); 

  } 

} 

  

#variables  

class ListaProductos { 

  final String? nombre; 

  final String? imagen; 

  final int? id; 

  late final bool? isAdd; 

  

  ListaProductos({required this.nombre, required this.imagen, required this.id, required this.isAdd}); 

} 

##maqueta

![image](https://user-images.githubusercontent.com/101757213/194956386-b5f83f55-aaab-4d03-8292-c2b8dd97d3c5.png)

![image](https://user-images.githubusercontent.com/101757213/194956420-d718f0fd-5537-46f1-a2a3-c51736910bd2.png)



