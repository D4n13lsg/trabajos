# carrito_v3

Este proyecto se muestra como realizar un carrito de compras que guarda lo que compren 
 

  

# main codigo 

import 'package:flutter/material.dart';

import 'package:fluttershoppingcart/models/cart.dart';

import 'package:fluttershoppingcart/models/item.dart';

import 'package:fluttershoppingcart/screens/checkout_page.dart';

import 'package:provider/provider.dart';

void main() {

  runApp(ChangeNotifierProvider(
  
    create: (context) => Cart(),
    
    child: MyApp(),
    
  ));
  
}

class MyApp extends StatelessWidget {

  @override
  
  Widget build(BuildContext context) {
  
    return MaterialApp(
    
      home: HomePage(),
      
      debugShowCheckedModeBanner: false,
      
    );
    
  }
  
}

class HomePage extends StatefulWidget {

  @override
  
  _HomePageState createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
 
  final List<Item> items = [
 
    Item(title: 'papa ', price: 5000.0,imagen: 'assets/papa.jpg'),
 
    Item(title: 'yuca ', price: 4000.0,imagen: 'assets/yuca.jpg'),
 
    Item(title: 'Tomate ', price: 2000.0,imagen: 'assets/tomate.jpg'),
 
    Item(title: 'cebolla ', price: 2000.0,imagen: 'assets/cebolla.jpg'),
 
    Item(title: 'Banano ', price: 5000.0,imagen: 'assets/platano.jpg'),
 
    Item(title: 'Papaya ', price: 1500.0,imagen: 'assets/papaya.jpg'),
 
    Item(title: 'Durazno ', price: 2900.0,imagen: 'assets/durazno.jpg'),
 
    Item(title: 'Fresa ', price: 3400.0,imagen: 'assets/Fresas.jpg'),
 
    Item(title: 'Berenjena ', price: 1500.0,imagen: 'assets/berenjena.jpg'),
 
  ];

  @override
 
  Widget build(BuildContext context) {
 
    return Consumer<Cart>(builder: (context, cart, child) {
 
      return Scaffold(
 
        backgroundColor: Colors.greenAccent,
 
        appBar: AppBar(
 
          backgroundColor: Colors.lime,
 
          title: Text('Super Mercado San Felipe'),
 
          actions: <Widget>[
 
            Padding(
 
              padding: EdgeInsets.all(8.0),
 
              child: Row(
 
                children: <Widget>[
 
                  IconButton(
 
                    icon: Icon(
 
                      Icons.shopping_cart,
 
                      color: Colors.white,
 
                    ),
                    onPressed: () {
 
                      Navigator.of(context).push(MaterialPageRoute(
 
                          builder: (context) => CheckoutPage()));
 
                    },
 
                  ),
 
                  Text(cart.count.toString())
 
                ],
 
              ),
 
            )
 
          ],
 
          centerTitle: true,
 
        ),

        body: cart.hola.length == 0
 
            ? Center(child:Text('no tenemos mas productos en la tienda'))
 
            : ListView.builder(
 
          itemCount:  cart.hola.length,
 
          itemBuilder: (context, index) {
 
            return Card(
 
              child: ListTile(
 
                /*
                leading: CircleAvatar(
 
                    child: Image.network("${cart.hola[index].imagen}")),

                 */
 
                leading: CircleAvatar(
 
                foregroundColor: Colors.black,
 
                backgroundImage: NetworkImage("${cart.hola[index].imagen}"),
 
            radius: 25.0,
 
            ),
 
              title: Text(cart.hola[index].title),
 
              subtitle: Text(cart.hola[index].price.toString()),
 
                trailing: IconButton(
 
                  icon: Icon(Icons.favorite),
 
                  onPressed: () {
 
                    cart.add(cart.hola[index]);
 
                  },
 
                ),
 
                onTap: () {

                },
 
              ),
 

            );
 
          },
 
      ),
 
      );
 
    });
 
  }
 
}
 
# checkout_page
 
import 'package:flutter/material.dart';
 
import 'package:fluttershoppingcart/models/cart.dart';
 
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
 
  @override
 
  _CheckoutPageState createState() => _CheckoutPageState();
 
}

class _CheckoutPageState extends State<CheckoutPage> {
 
  @override
 
  Widget build(BuildContext context) {
 
    return Consumer<Cart>(
 
      builder: (context, cart, child) {
 
        return Scaffold(
 
          backgroundColor: Colors.lime,
 
            appBar: AppBar(
 
              backgroundColor: Colors.greenAccent,
 
              title: Text('Carrito De Compras [\$ ${cart.totalPrice}]'),
 
              centerTitle: true,
 
            ),
            body: cart.basketItems.length == 0
 
                ? Center(child:Text('no tiene productos en la tienda'))
 
                : ListView.builder(
 
                    itemCount: cart.basketItems.length,
 
                    itemBuilder: (context, index) {
 
                      return Card(
 
                        child: ListTile(
 
                          leading: CircleAvatar(
 
                            foregroundColor: Colors.black,
 
                            backgroundImage: NetworkImage("${cart.basketItems[index].imagen}"),
 
                            radius: 25.0,
 
                          ),
 
                          title: Text(cart.basketItems[index].title),
 
                          subtitle:
 
                              Text(cart.basketItems[index].price.toString()),
 
                          trailing: IconButton(
 
                            icon: Icon(Icons.delete),
 
                            onPressed: () {
 
                              cart.remove(cart.basketItems[index]);
 
                            },
 
                          ),
 
                        ),
 
                      );
 
                    },

                  ));

      },
 
    );
 
  }
 
}
 
# cart

import 'package:flutter/material.dart';
 
import 'package:fluttershoppingcart/models/item.dart';
 

class Cart extends ChangeNotifier {

  List<Item> _items = [];
 
  List<Item> _item = [
 
    Item(title: 'papa ', price: 5000.0,imagen: 'assets/papa.jpg'),
 
    Item(title: 'yuca ', price: 4000.0,imagen: 'assets/yuca.jpg'),
 
    Item(title: 'Tomate ', price: 2000.0,imagen: 'assets/tomate.jpg'),
 
    Item(title: 'cebolla ', price: 2000.0,imagen: 'assets/cebolla.jpg'),
 
    Item(title: 'Banano ', price: 5000.0,imagen: 'assets/platano.jpg'),
 
    Item(title: 'Papaya ', price: 1500.0,imagen: 'assets/papaya.jpg'),
 
    Item(title: 'Durazno ', price: 2900.0,imagen: 'assets/durazno.jpg'),
 
    Item(title: 'Fresa ', price: 3400.0,imagen: 'assets/Fresas.jpg'),
 
    Item(title: 'Berenjena ', price: 1500.0,imagen: 'assets/berenjena.jpg'),
 
  ];
 
  double _totalPrice = 0.0;
 

  void add(item) {
 
    _item.remove(item);
 
    _items.add(item);
 
    _totalPrice += item.price;
 
    notifyListeners();
 
  }

  void remove(item) {
 
    _item.add(item);
 
    _items.remove(item);
 
    _totalPrice -= item.price;
 
    notifyListeners();

  }


  int get count {
 
    return _items.length;
 
  }

  double get totalPrice {
 
    return _totalPrice;
 
  }

  List<Item> get basketItems {
 
    return _items;
 
  }

  List<Item> get hola{
 
  return _item;
 
  }
 
}
 
# item
 
class Item {
 
  String imagen;
 
  String title;
 
  double price;
 
  Item({this.imagen,this.title ,this.price});
 
}

 ![image](https://user-images.githubusercontent.com/101757213/197035113-cdd4b00c-ad74-4c3d-a6fc-42c771b21c9b.png)

 
 ![image](https://user-images.githubusercontent.com/101757213/197035188-fa7a3b2c-c89d-4f6a-989b-7186591793e3.png)

