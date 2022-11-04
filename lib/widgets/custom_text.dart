import 'package:flutter/cupertino.dart';

///Created by Naman Gupta on 21/4/21.

// This class is the common class for text only.

class CustomText extends StatelessWidget {
  final String _text;
  final TextStyle _textStyle;
  final TextAlign textAlign;
  final TextOverflow textOverflow;

  CustomText(this._text, this._textStyle,
      {this.textAlign = TextAlign.start,
      this.textOverflow = TextOverflow.visible});

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: _textStyle,
      textAlign: textAlign,
      overflow: textOverflow,
    );
  }
}
