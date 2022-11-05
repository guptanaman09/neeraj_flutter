import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/base/baseClass.dart';
import 'package:neeraj_flutter_app/models/main_category_model.dart';

///Created by Naman Gupta on 5/11/22.

class SubCategoryScreen extends StatefulWidget {
  late MainCategoryDetail model;

  SubCategoryScreen(this.model);

  @override
  State<StatefulWidget> createState() {
    return SubCategoryScreenState(model);
  }
}

class SubCategoryScreenState extends BaseClass {
  late MainCategoryDetail model;
  SubCategoryScreenState(this.model);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget? setBody() {
    return Text("HEllllfskjlhfkjshfjh");
  }
}
