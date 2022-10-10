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


