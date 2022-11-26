import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///Created by Naman Gupta on 21/4/21.

// This class is the common class for text field.

class CustomTextField extends StatelessWidget {
  final TextEditingController _textEditingController;
  final TextInputType _textInputType;
  final InputDecoration _inputDecoration;
  final TextStyle _textStyle;
  Function? onChanged;
  final int? maxLength;

  CustomTextField(this._textEditingController, this._textInputType,
      this._inputDecoration, this._textStyle,
      {this.onChanged, this.maxLength = 100});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      keyboardType: _textInputType,
      decoration: _inputDecoration,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      maxLength: maxLength,
      style: _textStyle,
      onChanged: (value) => onChanged!(value) ?? (value) {},
    );
  }
}
