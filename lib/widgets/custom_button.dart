import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/constants/dimensions.dart';
import 'package:neeraj_flutter_app/constants/styling/button_style.dart';
import 'package:neeraj_flutter_app/utils/device_utils.dart';
import 'package:neeraj_flutter_app/widgets/custom_text.dart';

///Created by Naman Gupta on 21/4/21.
// this class return the button

class CustomButton extends StatelessWidget {
  final Function _onPressed;
  final String _text;
  final EdgeInsetsGeometry padding;

  CustomButton(this._text, this._onPressed,
      {this.padding = const EdgeInsets.all(0)});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(Dimensions.size_10),
            ),
          ),
        ),
        onPressed: () => _onPressed(context),
        child: Container(
            width: DeviceUtils.getScreenWidtht(context),
            child: CustomText(
              _text,
              ButtonStyles.getButtonTextStyle(),
              textAlign: TextAlign.center,
            )));
  }
}
