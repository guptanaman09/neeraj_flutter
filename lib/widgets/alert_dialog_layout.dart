///Created by Naman Gupta on 19/4/21.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:neeraj_flutter_app/locale/languages/app_localizations.dart';
import 'package:neeraj_flutter_app/widgets/horizontal_gap.dart';

import 'vertical_gap.dart';

class AlertDialogLayout extends StatelessWidget {
  String title;
  String subTitle;
  bool showIcon;
  TextAlign titleAlign;
  Color titleColor;
  IconData iconImage;
  Color iconColor;
  Color backgroundColor;
  double dialogHeight;
  bool showActionButtons;
  bool showContactAdmin;

  AlertDialogLayout(this.title, this.subTitle,
      {this.showIcon = true,
      this.titleAlign = TextAlign.start,
      this.titleColor = AppColors.black,
      this.iconImage = Icons.warning,
      this.iconColor = AppColors.primaryColor,
      this.backgroundColor = AppColors.white,
      this.dialogHeight = 140,
      this.showActionButtons = true,
      this.showContactAdmin = true});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        height: dialogHeight,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (showIcon)
                    Icon(
                      iconImage,
                      color: iconColor,
                      size: 30,
                    ),
                  if (showIcon) HorizontalGap(8),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                        ),
                        VerticalGap(3),
                        Text(
                          subTitle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              VerticalGap(24),
              if (showActionButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(4),
                        child: Text(AppLocalizations.strings!.cancel!),
                      ),
                    ),
                    HorizontalGap(16),
                    if (showContactAdmin)
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(4),
                          child: Text("CONTACT ADMIN"),
                        ),
                      )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
