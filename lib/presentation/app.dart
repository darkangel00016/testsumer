import 'package:flutter/material.dart';
import 'package:test_sumer/common/constants/route_constants.dart';
import 'package:test_sumer/presentation/themes/theme_data.dart';
import 'routes.dart';

class App extends StatelessWidget {

  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gifs trending",
      debugShowCheckedModeBanner: false,
      theme: appTheme(context),
      routes: Routes.getAll(),
      initialRoute: RouteList.dashboard,
    );
  }

}