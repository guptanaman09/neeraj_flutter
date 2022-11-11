import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/base/baseClass.dart';
import 'package:neeraj_flutter_app/constants/assets.dart';
import 'package:neeraj_flutter_app/utils/device_utils.dart';
import 'package:neeraj_flutter_app/widgets/custom_text.dart';
import 'package:neeraj_flutter_app/widgets/custom_text_field.dart';
import 'package:neeraj_flutter_app/widgets/horizontal_gap.dart';
import 'package:neeraj_flutter_app/widgets/vertical_gap.dart';

///Created by Naman Gupta on 11/11/22.

class LineFollowerGameScreen extends StatefulWidget {
  late final SubCategoryDetail;

  LineFollowerGameScreen(this.SubCategoryDetail);

  @override
  State<StatefulWidget> createState() {
    return LineFollowerGameScreenState(this.SubCategoryDetail);
  }
}

class LineFollowerGameScreenState extends BaseClass
    with SingleTickerProviderStateMixin {
  late final SubCategoryDetail;

  late final TextEditingController prox_1_black_controller;
  late final TextEditingController prox_1_white_controller;

  late final TextEditingController prox_2_black_controller;
  late final TextEditingController prox_2_white_controller;

  late AnimationController _animationController;

  LineFollowerGameScreenState(this.SubCategoryDetail);

  @override
  void initState() {
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 150));
    _animationController.repeat(reverse: true);

    super.initState();
    prox_1_black_controller = TextEditingController();
    prox_1_white_controller = TextEditingController();
    prox_2_black_controller = TextEditingController();
    prox_2_white_controller = TextEditingController();
  }

  @override
  Widget? setBody() {
    return Container(
      height: DeviceUtils.getScreenHeight(context),
      width: DeviceUtils.getScreenWidtht(context),
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: DeviceUtils.getScreenWidtht(context),
                  margin: EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          child: Image.asset(
                            Assets.BACK_BUTTON,
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ),
                      Image.asset(
                        Assets.BLUETOOTH_SIGN,
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                ),
                VerticalGap(12),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(child: proximity_1()),
                      HorizontalGap(24),
                      Expanded(child: proximity_2())
                    ],
                  ),
                )
              ]),
          Positioned(
            child: FadeTransition(
              opacity: _animationController,
              child: Image.asset(
                Assets.RED_DOT,
                height: 25,
                width: 25,
              ),
            ),
            top: 32,
            right: 150,
          ),
        ],
      ),
    );
  }

  Widget proximity_1() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.greenAccent,
            padding: EdgeInsets.all(8),
            child: CustomText("Proximity 1 :-    0",
                TextStyle(fontSize: 14, color: Colors.black)),
          ),
          VerticalGap(4),
          Container(
              color: Colors.grey,
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText("Black Value:-",
                      TextStyle(color: Colors.black, fontSize: 14)),
                  HorizontalGap(16),
                  Container(
                    height: 20,
                    width: 100,
                    color: Colors.white,
                    child: CustomTextField(
                        prox_1_black_controller,
                        TextInputType.number,
                        InputDecoration(border: InputBorder.none),
                        TextStyle(color: Colors.black)),
                  )
                ],
              )),
          VerticalGap(4),
          Container(
              color: Colors.pinkAccent,
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText("White Value:-",
                      TextStyle(color: Colors.black, fontSize: 14)),
                  HorizontalGap(16),
                  Container(
                    height: 20,
                    width: 100,
                    color: Colors.white,
                    child: CustomTextField(
                        prox_1_white_controller,
                        TextInputType.number,
                        InputDecoration(border: InputBorder.none),
                        TextStyle(color: Colors.black)),
                  ),
                ],
              )),
          ElevatedButton(
              onPressed: () {}, child: CustomText("Set", TextStyle())),
          VerticalGap(4),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
            color: Colors.yellow,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText("Black Value:-   ",
                    TextStyle(fontSize: 14, color: Colors.black)),
                CustomText("White Value:-   ",
                    TextStyle(fontSize: 14, color: Colors.black)),
                CustomText("Threshold Value:-   ",
                    TextStyle(fontSize: 14, color: Colors.black)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget proximity_2() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.greenAccent,
            padding: EdgeInsets.all(8),
            child: CustomText("Proximity 2 :-    0",
                TextStyle(fontSize: 14, color: Colors.black)),
          ),
          VerticalGap(4),
          Container(
              color: Colors.grey,
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText("Black Value:-",
                      TextStyle(color: Colors.black, fontSize: 14)),
                  HorizontalGap(16),
                  Container(
                    height: 20,
                    width: 100,
                    color: Colors.white,
                    child: CustomTextField(
                        prox_2_black_controller,
                        TextInputType.number,
                        InputDecoration(border: InputBorder.none),
                        TextStyle(color: Colors.black)),
                  )
                ],
              )),
          VerticalGap(4),
          Container(
              color: Colors.pinkAccent,
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText("White Value:-",
                      TextStyle(color: Colors.black, fontSize: 14)),
                  HorizontalGap(16),
                  Container(
                    height: 20,
                    width: 100,
                    color: Colors.white,
                    child: CustomTextField(
                        prox_2_white_controller,
                        TextInputType.number,
                        InputDecoration(border: InputBorder.none),
                        TextStyle(color: Colors.black)),
                  )
                ],
              )),
          ElevatedButton(
              onPressed: () {}, child: CustomText("Set", TextStyle())),
          VerticalGap(4),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
            color: Colors.yellow,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText("Black Value:-   ",
                    TextStyle(fontSize: 14, color: Colors.black)),
                CustomText("White Value:-   ",
                    TextStyle(fontSize: 14, color: Colors.black)),
                CustomText("Threshold Value:-   ",
                    TextStyle(fontSize: 14, color: Colors.black)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
