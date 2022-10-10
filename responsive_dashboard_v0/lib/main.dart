import 'package:flutter/material.dart';
import 'package:responsive_dashboard_v0/responsive/responsive_lataut.dart';
import 'package:responsive_dashboard_v0/responsive/mobile_scaffold.dart';
import 'package:responsive_dashboard_v0/responsive/tablet_scaffold.dart';
import 'package:responsive_dashboard_v0/responsive/desktop_scaffold.dart';
import 'package:responsive_dashboard_v0/responsive/4k_scaffold.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
          mobileScafffold: MobileScaffold(),
          tabletScaffold: TabletScaffold(),
          desktopScaffold: DestopScaffold(),
          pantalla4kScaffold: pantalla4kScaffold(),
      ),
    );
  }
}
