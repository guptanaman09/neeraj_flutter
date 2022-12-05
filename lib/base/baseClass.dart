import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:neeraj_flutter_app/constants/classes.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:neeraj_flutter_app/constants/dimensions.dart';
import 'package:neeraj_flutter_app/data/shared_preference/my_shared_preference.dart';
import 'package:neeraj_flutter_app/ui/drawer/drawer_screen.dart';
import 'package:neeraj_flutter_app/widgets/alert_dialog_layout.dart';

///Created by Naman Gupta on 2/11/22.

class BaseClass extends State {
  bool appBarVisibility = false;
  bool backButtonVisibility = false;
  Color backgroundColor = AppColors.white;
  bool isLoading = false;
  bool drawerVisibility = false;
  int drawerSeletedOptionIndex = 0;
  String appBarTitle = "";
  String appBarSubTitle = "";
  bool appBarLeadingIconVisibility = true;
  bool appBarTitleCenter = false;
  late Function willPop;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  void setWillPop(Function willPop) {
    this.willPop = willPop;
  }

  void setIsLoading(bool isLoading) {
    setState(() {
      this.isLoading = isLoading;
    });
  }

  static void logout(context) {
    // MySharedPreference.clearAllData();
    // Navigator.pushNamedAndRemoveUntil(
    //     context, Classes.splashScreen, (route) => false);
  }

  void showInfoBar(String title) {
    /*  scaffoldKey.currentState!.showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      backgroundColor: AppColors.secondaryColor,
      content: Text(
        title,
      ),
    ));*/
  }

  void setDrawerVisibility(bool drawerVisibility,
      {int? drawerSeletedOptionIndex}) {
    setState(() {
      this.drawerVisibility = drawerVisibility;
      this.drawerSeletedOptionIndex = drawerSeletedOptionIndex!;
    });
  }

  setAppBarVisibility(
    bool appBarVisibility, {
    bool backButtonVisibility = false,
    Color backgroundColor = Colors.transparent,
    String appBarTitle = "",
    appBarLeadingIconVisibility = true,
    appBarTitleCenter = false,
  }) {
    this.setState(() {
      this.appBarVisibility = appBarVisibility;
      this.backButtonVisibility = backButtonVisibility;
      this.backgroundColor = backgroundColor;
      this.appBarTitle = appBarTitle;
      this.appBarSubTitle = appBarSubTitle;
      this.appBarLeadingIconVisibility = appBarLeadingIconVisibility;
      this.appBarTitleCenter;
    });
  }

  Widget? setBody() {}

  void showBottomSheet(BuildContext context, Widget wg) {}

  void makeFavourite(String msg) {
    //setAppBarIcon(Assets.redStar);
  }

  void makeUnfavourite() {
    // setAppBarIcon(Assets.unfil_star);
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      primary: true,
      toolbarHeight: 80,
      title: Text(
        appBarTitle,
      ),
      centerTitle: true,
      backgroundColor: backgroundColor,
      leading: backButtonVisibility
          ? GestureDetector(
              onTap: () {
                try {
                  if (Navigator.canPop(context)) {
                    Navigator.of(context).pop("result");
                  }
                } catch (error) {}
              },
              child: Container(
                  padding: EdgeInsets.all(Dimensions.size_4),
                  child: Icon(
                    Icons.keyboard_backspace,
                    color: AppColors.white,
                    size: Dimensions.size_28,
                  )),
            )
          : Container(),
      elevation: 0,
    );
  }

  void showAlertOkayMessage(String message, Function onOkayPressed) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Alert",
          style: TextStyle(color: Colors.red),
        ),
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context, true);
                onOkayPressed();
              },
              child: Container(
                color: Colors.deepPurple,
                padding: const EdgeInsets.all(14),
                child: const Text(
                  "okay",
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }

  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void showAlert(String title, String subTitle,
      {showIcon = true, showContactAdmin = true}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialogLayout(
          title,
          subTitle,
          showIcon: showIcon,
          showContactAdmin: showContactAdmin,
        );
      },
    );
  }

  void handleDrawerFunctionality() {
    if (scaffoldKey.currentState!.isDrawerOpen)
      scaffoldKey.currentState!.openEndDrawer();
    else
      scaffoldKey.currentState!.openDrawer();
  }

  bool getLoaderState() {
    return isLoading;
  }

  void onBackPressed() {}
  Future<bool> onWillPop() {
    print("inside wil pop scope");
    onBackPressed();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        primary: false,
        key: scaffoldKey,
        body: SafeArea(
            child: Stack(
          children: [
            if (isLoading)
              Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.black12,
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 3.0,
                            ),
                          ),
                        ),
                      ),
                    ]),
              )
            else
              setBody()!
          ],
        )),
        appBar: appBarVisibility ? getAppBar() : null,
        drawer: drawerVisibility
            ? DrawerScreen(drawerSeletedOptionIndex, this)
            : null,
      ),
    );
  }
}
