import 'package:flutter/material.dart';
import 'package:responsive_dashboard_v0/responsive/4k_scaffold.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({Key? key, required this.mobileScafffold, required this.tabletScaffold, required this.desktopScaffold, required this.pantalla4kScaffold }) : super(key: key);

  final Widget mobileScafffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;
  final Widget pantalla4kScaffold;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if(constraints.maxWidth < 500){
          return mobileScafffold;
        }else if(constraints.maxWidth < 1100){
          return tabletScaffold;
        }else if(constraints.maxWidth<1920){
          return desktopScaffold;
        }else
          return pantalla4kScaffold;

      },
    );
  }
}
