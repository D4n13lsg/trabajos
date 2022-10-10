import 'package:flutter/material.dart';
import 'package:responsive_dashboard_v0/consants.dart';
import 'package:responsive_dashboard_v0/util/my_box.dart';
import 'package:responsive_dashboard_v0/util/my_tile.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myDefaultBackground,
      drawer: myDrawer,
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 5,
            child: SizedBox(
              width: double.infinity,
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return const MyBox();
                  }),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.brown,
              child: const Text(
                ' pain that produces no resultant pleasure?',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded( // < -- SEE HERE
            child: Container(
              width: double.infinity, // < -- SEE HERE
              color: Colors.brown,
              child: const Text(
                'has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded( // < -- SEE HERE
            child: Container(
              width: double.infinity, // < -- SEE HERE
              color: Colors.brown,
              child: const Text(
                'pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded( // < -- SEE HERE
            child: Container(
              width: double.infinity, // < -- SEE HERE
              color: Colors.brown,
              child: const Text(
                ', or one who avoids a pain that produces no resultant pleasure?',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded( // < -- SEE HERE
            child: Container(
              width: double.infinity, // < -- SEE HERE
              color: Colors.brown,
              child: const Text(
                ' a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
