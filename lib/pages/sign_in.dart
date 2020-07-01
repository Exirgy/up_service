import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:up_service/state/user.state.dart';
import 'package:up_service/state/app.state.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  UserState userState;
  AppState appState;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (userState.initUserCalled == false) {
        appState.setPackageInfo();
        userState.initUser();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    userState = Provider.of<UserState>(context);
    appState = Provider.of<AppState>(context);

    PlatformWidget _buildText() {
      return PlatformWidget(
        // ignore: deprecated_member_use
        android: (_) => Text(
          'up_service',
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        // ignore: deprecated_member_use
        ios: (_) => Text(
          'up_service',
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
          textAlign: TextAlign.center,
        ),
      );
    }

    if (userState.loadingUser == true) {
      return SpinKitFoldingCube(color: Colors.white);
    }
    return PlatformScaffold(body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF800020),
            ),
            height: constraints.maxHeight / 2,
            child: Center(child: _buildText()),
          ),
          Container(
            height: constraints.maxHeight / 2,
            color: Color(0xFF800020),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  RaisedButton(
                    onPressed: () {
                      userState.handleSignIn();
                    },
                  ),
                  Text(
                    'You need to sign in to continue',
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Observer(
                        builder: (_) {
                          return Text(
                            '${appState.appName} ${appState.version}+${appState.buildNumber}',
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  color: Colors.white38,
                                  fontWeight: FontWeight.bold,
                                ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      );
    }));
  }
}
