import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:neeraj_flutter_app/constants/classes.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:neeraj_flutter_app/constants/dimensions.dart';
import 'package:neeraj_flutter_app/constants/styling/auth_styles.dart';
import 'package:neeraj_flutter_app/constants/styling/container_styles.dart';
import 'package:neeraj_flutter_app/data/network/response_listener.dart';
import 'package:neeraj_flutter_app/store/connectivity/connection_store.dart';
import 'package:neeraj_flutter_app/store/post/fetch_detail.dart';
import 'package:neeraj_flutter_app/utils/internet_connectivity.dart';
import 'package:neeraj_flutter_app/utils/logger.dart';
import 'package:neeraj_flutter_app/widgets/border_container.dart';
import 'package:neeraj_flutter_app/widgets/custom_button.dart';
import 'package:neeraj_flutter_app/widgets/custom_text.dart';
import 'package:neeraj_flutter_app/widgets/custom_text_field.dart';
import 'package:neeraj_flutter_app/widgets/vertical_gap.dart';

///Created by Naman Gupta on 19/4/21.

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  late GlobalKey<ScaffoldState> _scaffoldMessengerKey;

  ConnectionStore _connectionStore = ConnectionStore();
  late ReactionDisposer _disposer;

  FetchDetail fetchDetailStore = FetchDetail();

  @override
  void initState() {
    _scaffoldMessengerKey = GlobalKey<ScaffoldState>();
    _disposer =
        reaction((_) => _connectionStore.connectionStream.value, (effect) {
      Logger.logd("internet state changed ****");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "internet connectivity.",
          style:
              TextStyle(color: AppColors.white, fontSize: Dimensions.size_14),
        ),
        duration: Duration(seconds: 3),
      ));
    });

    // fetchDetailStore.fetchAgentDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final future = fetchDetailStore.fetchAgentDetail();
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Observer(
                    builder: (_) => future.status == FutureStatus.pending
                        ? CircularProgressIndicator()
                        : future.status == FutureStatus.rejected
                            ? CustomText(
                                "Something Went Wrong", AuthStyles.textStyle())
                            : Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: Dimensions.size_48,
                                    horizontal: Dimensions.size_40),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                        child: Icon(
                                          Icons.supervised_user_circle_rounded,
                                          size: 50,
                                        ),
                                      ),
                                      VerticalGap(Dimensions.size_24),
                                      BorderContainer(
                                        CustomTextField(
                                          _emailController,
                                          TextInputType.text,
                                          AuthStyles.inputDecoration(
                                              hintText: future
                                                  .value!.result!.isSuccessful
                                                  .toString()),
                                          AuthStyles.textStyle(),
                                          onChanged: onChanged,
                                        ),
                                        ContainerStyle
                                            .getBorderContainerStyle(),
                                      ),
                                      VerticalGap(Dimensions.size_24),
                                      BorderContainer(
                                        CustomTextField(
                                          _passwordController,
                                          TextInputType.text,
                                          AuthStyles.inputDecoration(
                                              hintText:
                                                  "Please enter password"),
                                          AuthStyles.textStyle(),
                                        ),
                                        ContainerStyle
                                            .getBorderContainerStyle(),
                                      ),
                                      Spacer(),
                                      CustomButton(
                                        "Submit",
                                        onLogin,
                                        padding:
                                            EdgeInsets.all(Dimensions.size_16),
                                      )
                                    ]))))));
  }

  void onChanged(String value) {}

  void onLogin(BuildContext context) async {
    bool result = await InternetConnectivity().checkConnection();
    Logger.logd("internet check >>> ${result}");
    Navigator.popAndPushNamed(context, Classes.signUpScreen);
  }

  @override
  void dispose() {
    _disposer.reaction.dispose();
    super.dispose();
  }
}

class Response extends ResponseListener {
  @override
  updateIfLive(t) {
    return super.updateIfLive(t);
  }

  @override
  onErrorGet(String error) {
    return super.onErrorGet(error);
  }
}
