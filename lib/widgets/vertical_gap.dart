import 'package:flutter/material.dart';

///Created by Naman Gupta on 19/4/21.

class VerticalGap extends StatelessWidget {
  final double value;

  VerticalGap(this.value);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: value,
    );
  }
}
