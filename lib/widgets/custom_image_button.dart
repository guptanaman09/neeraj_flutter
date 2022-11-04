import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/constants/dimensions.dart';
import 'package:neeraj_flutter_app/constants/styling/button_style.dart';
import 'package:neeraj_flutter_app/utils/device_utils.dart';
import 'package:neeraj_flutter_app/widgets/custom_text.dart';
import 'package:neeraj_flutter_app/widgets/horizontal_gap.dart';

///Created by Naman Gupta on 21/4/21.

// this class retuns the button with an image

class CustomImageButton extends StatelessWidget {
  final BoxDecoration _boxDecoration;
  final double imageSize;
  final EdgeInsets padding;
  final String _image;
  final String _text;
  final double borderRadius;
  final Function _onPressed;

  CustomImageButton(
      this._boxDecoration, this._text, this._image, this._onPressed,
      {this.imageSize = Dimensions.size_24,
      this.padding = const EdgeInsets.all(Dimensions.size_16),
      this.borderRadius = Dimensions.size_16});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onPressed(context),
      child: Card(
        elevation: Dimensions.size_5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Container(
          padding: EdgeInsets.all(Dimensions.size_16),
          decoration: _boxDecoration,
          width: DeviceUtils.getScreenWidtht(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                _image,
                height: imageSize,
                width: imageSize,
                fit: BoxFit.contain,
              ),
              HorizontalGap(Dimensions.size_50),
              CustomText(_text, ButtonStyles.getButtonTextStyle())
            ],
          ),
        ),
      ),
    );
  }
}
