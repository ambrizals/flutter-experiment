import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  BuildContext get _currentContext {
    return navigatorKey.currentState!.overlay!.context;
  }

  void back() {
    return navigatorKey.currentState!.pop();
  }

  Future<dynamic> push(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplace(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  void showSnackbar(
      {required String message,
      String? title,
      IconData? icon,
      bool dismissable = false}) {
    ScaffoldMessenger.of(_currentContext).showSnackBar(SnackBar(
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (icon != null)
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(icon, color: Colors.white),
              ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [if (title != null) Text(title), Text(message)],
            ),
            Spacer(),
            if (dismissable)
              IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () => ScaffoldMessenger.of(_currentContext)
                      .removeCurrentSnackBar())
          ],
        ),
        behavior: SnackBarBehavior.floating));
  }
}
