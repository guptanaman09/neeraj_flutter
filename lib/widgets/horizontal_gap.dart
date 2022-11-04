import 'package:flutter/material.dart';

///Created by Naman Gupta on 19/4/21.

class HorizontalGap extends StatelessWidget {
  final double value;

  HorizontalGap(this.value);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: value,
    );
  }
}
