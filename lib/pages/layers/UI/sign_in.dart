import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:up_service/pages/layers/UI/menu_dashboard_layout.dart';
import 'package:up_service/pages/layers/UI/pages/messages.dart';

import '../../../state/app.state.dart';
import '../../../state/user.state.dart';
import '../widgets/google_sign_inbutton.dart';

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

    Image _buildLogo() {
      return Image.asset(
        "assets/images/final_logo.jpg",
        height: 200.0,
        width: 200.0,
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
              color: Color(0xFFFFFFFF),
            ),
            height: constraints.maxHeight / 2,
            child: Center(child: _buildLogo()),
          ),
          Container(
            height: constraints.maxHeight / 2,
            color: Color(0xFFFFFFFF),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  GoogleSignInButton(
                    onPressed: () {
                      userState.handleSignIn();
                      Future.delayed(Duration(seconds: 10), () {
                        // 5s over, navigate to a new page
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MenuDashboardLayout()));
                      });
                    },
                  ),
                  Text(
                    'You need to sign in to continue',
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: Colors.black87,
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
                                  color: Colors.black87,
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
