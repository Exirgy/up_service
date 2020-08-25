import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:up_service/state/navigation.state.dart';

import 'pages/layers/views/menu_dashboard_layout.dart';
import 'pages/layers/views/sign_in.dart';
import 'state/app.state.dart';
import 'state/user.state.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        Provider<UserState>(
          create: (_) => UserState(),
        ),
        Provider<AppState>(
          create: (_) => AppState(),
        ),
        Provider<NavigationState>(
          create: (_) => NavigationState(),
        ),
      ],
      child: MaterialApp(
        title: 'UpService',
        //home: HomeScreen()
        routes: {
          '/': (context) => SignIn(),
          '/home': (context) => MenuDashboardLayout(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFFFFD54F),
          accentColor: Color(0xFFFEF9EB),
        ),
        // home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
