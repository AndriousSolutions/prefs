// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'dart:async' show Future;

import 'package:prefs/prefs.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//    MyApp app = MyApp();
//
//    // Build our app and trigger a frame.
//    await tester.pumpWidget(app);
//
//    final keyCounter = app.keyCounter;
//
//    TextField counter = tester.widget(find.byKey(keyCounter));
//
//    String value = counter.controller.value.text;
//
//    // Verify the current counter.
//    expect(find.text(value), findsOneWidget);
//
//    // Tap the '+' icon and trigger a frame.
//    await tester.tap(find.byIcon(Icons.add));
//    await tester.pump();
//
//    // Verify the counter is no long there.
//    expect(find.text(value), findsNothing);
//
//    int increment = int.parse(value) + 1;
//
//    // Verify that our counter has incremented.
//    expect(find.text(increment.toString()), findsOneWidget);
  });
}

class MyApp extends StatelessWidget {
  // Define our test key
  final keyCounter = Key('counter');

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'SharedPreferences Demo',
      home: new SharedPreferencesDemo(keyCount: keyCounter),
    );
  }
}

class SharedPreferencesDemo extends StatefulWidget {
  SharedPreferencesDemo({this.keyCount, Key key}) : super(key: key);
  final Key keyCount;
  @override
  SharedPreferencesDemoState createState() => new SharedPreferencesDemoState();
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
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("SharedPreferences Demo"),
      ),
      body: Center(
          child: new FutureBuilder<int>(
              future: _counter,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  default:
                    if (snapshot.hasError)
                      return new Text('Error: ${snapshot.error}');
                    else
                      return new Text(
                        'Button tapped ${snapshot.data} time${snapshot.data == 1 ? '' : 's'}.\n\n'
                            'This should persist across restarts.',
                        key: widget.keyCount,
                      );
                }
              })),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
