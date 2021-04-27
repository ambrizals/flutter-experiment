import 'package:experiment/notifier/counter.dart';
import 'package:experiment/screen/Home.dart';
import 'package:experiment/screen/NotFound.dart';
import 'package:experiment/screen/Popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'constant.dart' as routes;

Route<dynamic> generateRoute(RouteSettings setting) {
  switch (setting.name) {
    case routes.HOME:
      return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<CounterNotifier>(
              create: (_) => CounterNotifier(3), child: MyHomeScreen()));

    case routes.POPUP:
      return MaterialPageRoute(builder: (context) => PopupPage());

    default:
      return MaterialPageRoute(builder: (context) => NotFoundPage());
  }
}
