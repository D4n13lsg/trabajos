import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  const MyBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: Image.asset('assens/payaso.jpg')),
          Expanded(child: Image.asset('assens/pana.jpg')),
          Expanded(child: Image.asset('assens/messsi.jpg')),
          Expanded(child: Image.asset('assens/bicho.jpg')),
        ],
      ),
    );
  }
}
