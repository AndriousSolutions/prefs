import 'package:flutter/material.dart';

import 'package:prefs/prefs.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: _incrementCounter,
          child: Text('Increment Counter'),
        ),
      ),
    ),
  ));
}

_incrementCounter() async {
  int counter = await Prefs.getIntF('counter');
  counter = counter + 1;
  print('Pressed $counter times.');
  Prefs.setInt('counter', counter);
}
