import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/base/baseClass.dart';

///Created by Naman Gupta on 19/4/21.

class DrawerScreen extends StatefulWidget {
  int selectedIndex;
  BaseClass baseClassContext;

  DrawerScreen(this.selectedIndex, this.baseClassContext);

  @override
  State<StatefulWidget> createState() {
    return new DrawerScreenState(this.selectedIndex, this.baseClassContext);
  }
}

class DrawerScreenState extends State<DrawerScreen> {
  int selectedIndex;
  BaseClass baseClassContext;

  @override
  void initState() {
    super.initState();
  }

  DrawerScreenState(this.selectedIndex, this.baseClassContext) {}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [Text("Drawer screen")],
          ),
        ),
      ),
    );
  }
}
