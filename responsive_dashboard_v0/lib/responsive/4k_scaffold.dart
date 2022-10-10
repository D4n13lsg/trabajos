import 'package:flutter/material.dart';
import 'package:responsive_dashboard_v0/consants.dart';
import 'package:responsive_dashboard_v0/util/my_box.dart';
import 'package:responsive_dashboard_v0/util/my_tile.dart';

class pantalla4kScaffold extends StatefulWidget {
  const pantalla4kScaffold({Key? key}) : super(key: key);

  @override
  State<pantalla4kScaffold> createState() => _pantalla4kScaffoldState();
}

class _pantalla4kScaffoldState extends State<pantalla4kScaffold> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: myAppBar,
      backgroundColor: myDefaultBackground,
      body: Row(
        children: [
          myDrawer,
          Expanded(
            flex: 3,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 5,
                  child: SizedBox(
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index){
                          return const MyBox();
                        }
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context,index){
                      return const MyTile();
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                      child: Column(
                      children: [
                      Expanded(child: Image.asset('assens/imagen.jpg'))
              ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
