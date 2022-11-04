import 'package:flutter/cupertino.dart';

///Created by Naman Gupta on 21/4/21.

// this class returns the container with border

class BorderContainer extends StatelessWidget {
  Widget _child;
  BoxDecoration _decoration;

  BorderContainer(this._child, this._decoration);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _decoration,
      child: _child,
    );
  }
}
