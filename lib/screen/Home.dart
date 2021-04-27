import 'dart:developer';

import 'package:experiment/notifier/counter.dart';
import 'package:experiment/routes/constant.dart' as route;
import 'package:experiment/services/Locator.dart';
import 'package:experiment/services/Navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final NavigatorService _navigatorService = locator<NavigatorService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomeScreen object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Rumah'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              context.watch<CounterNotifier>().count.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterNotifier>().increase(),
            tooltip: 'Increment',
            heroTag: 'increment',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 2),
          FloatingActionButton(
            onPressed: () => context.read<CounterNotifier>().decrease(),
            tooltip: 'Decrement',
            heroTag: 'decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(height: 2),
          FloatingActionButton(
            onPressed: () => _navigatorService.push(route.POPUP),
            tooltip: 'Next Page',
            heroTag: 'nextpage',
            child: Icon(Icons.next_plan),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
