import 'dart:async' show Future;

import 'package:flutter/material.dart';

import 'package:prefs/prefs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Define our test key
  final keyCounter = Key('counter');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SharedPreferences Demo',
      home: SharedPreferencesDemo(keyCount: keyCounter),
    );
  }
}

class SharedPreferencesDemo extends StatefulWidget {
  SharedPreferencesDemo({this.keyCount, Key key}) : super(key: key);
  final Key keyCount;
  @override
  SharedPreferencesDemoState createState() => SharedPreferencesDemoState();
}

class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  Future<int> _counter;

  void _incrementCounter() {
    final int counter = Prefs.getInt('counter') + 1;
    setState(() {
      _counter = Prefs.setInt('counter', counter).then((_) {
        return counter;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    Prefs.init();
    _counter = Prefs.getIntF('counter');
  }

  @override
  void dispose() {
    Prefs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SharedPreferences Demo"),
      ),
      body: Center(
          child: FutureBuilder<int>(
              future: _counter,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  default:
                    if (snapshot.hasError)
                      return Text('Error: ${snapshot.error}');
                    else
                      return Text(
                        'Button tapped ${snapshot.data} time${snapshot.data == 1 ? '' : 's'}.\n\n'
                        'This should persist across restarts.',
                        key: widget.keyCount,
                      );
                }
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
