// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:integration_test/integration_test.dart'
    show IntegrationTestWidgetsFlutterBinding;

import 'package:prefs/prefs.dart';

//ignore: avoid_relative_lib_imports
import '../lib/main.dart';

import '../integration_test/integration_test.dart';

String dynamicKey = 'dynamic';
String booleanKey = 'boolean';
String integerKey = 'integer';
String doubleKey = 'double';
String stringKey = 'string';
String listKey = 'list';

void main() => testMyApp();

const _location = '========================== integration_test.dart';

void testMyApp() {
  //
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Preference Package Tester', (WidgetTester tester) async {
    //
    await _asyncTests();

    const app = PrefsDemoApp();

    // Build our app and trigger a frame.
    await tester.pumpWidget(app);

    /// Flutter won’t automatically rebuild your widget in the test environment.
    /// Use pump() or pumpAndSettle() to ask Flutter to rebuild the widget.
    /// pumpAndSettle() waits for all animations to complete.
    await tester.pumpAndSettle();

    await integrationTesting(tester);

    _getTests();
  });
}

/// Asynchronous testing
Future<void> _asyncTests() async {
  //
  bool contains;
  dynamic value;
  bool boolean;
  int integer;
  double number;
  String string;
  List<String> strings;

  bool set;

  // This works best along with integration testing.
  // Call the following command:   IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  if (WidgetsBinding.instance is! IntegrationTestWidgetsFlutterBinding) {
    return;
  }

  /// Retrieve all the 'keys' in Shared Preferences if any.
  final Set<String> keys = await Prefs.getKeysF();

  final testKeys = <String>{
    dynamicKey,
    booleanKey,
    integerKey,
    doubleKey,
    stringKey,
    listKey
  };

  // If not preforming any integration testing.
  if (!keys.containsAll(testKeys)) {
    //
    set = await Prefs.setString(dynamicKey, 'whatever');

    set = await Prefs.setStringList(listKey, ['this', 'that', 'other']);

    set = await Prefs.setBool(booleanKey, true);

    expect(set, isTrue, reason: _location);

    set = await Prefs.setInt(integerKey, 12);

    expect(set, isTrue, reason: _location);

    set = await Prefs.setDouble(doubleKey, 0.352);

    expect(set, isTrue, reason: _location);

    set = await Prefs.setString(stringKey, 'this that');

    expect(set, isTrue, reason: _location);
  } else {
    //
    contains = await Prefs.containsKeyF(dynamicKey);

    // Depending on the test run, could be true or false
    expect(contains, isA<bool>(), reason: _location);

    value = await Prefs.getF(dynamicKey);

    // Could be null; could be 'whatever'
    expect(value, anything, reason: _location);

    boolean = await Prefs.getBoolF(booleanKey);

    expect(boolean, isTrue, reason: _location);

    integer = await Prefs.getIntF(integerKey);

    expect(integer, 12, reason: _location);

    number = await Prefs.getDoubleF(doubleKey);

    expect(number, 0.352, reason: _location);

    string = await Prefs.getStringF(stringKey);

    expect(string, 'this that', reason: _location);

    strings = await Prefs.getStringListF(listKey);

    // Could be an empty List; Could be ['this', 'that', 'other']
    expect(strings, anything, reason: _location);

    final remove = await Prefs.remove(stringKey);

    expect(remove, isTrue, reason: _location);

    /// Completes with true once the user preferences for the app has been cleared.
    final clear = await Prefs.clear();

    // Clear it all for the integration testing to place back in again.
    expect(clear, isTrue, reason: _location);
  }
}

void _getTests() {
  //
  bool contains;
  dynamic value;
  bool boolean;
  int integer;
  double decimal;
  String string;
  List<String> strings;

  contains = Prefs.containsKey(dynamicKey);

  expect(contains, isA<bool>(), reason: _location);

  value = Prefs.get(dynamicKey);

  // Could be null; could be 'whatever'
  expect(value, anything, reason: _location);

  boolean = Prefs.getBool(booleanKey);

  expect(boolean, isTrue, reason: _location);

  integer = Prefs.getInt(integerKey);

  expect(integer, 12, reason: _location);

  decimal = Prefs.getDouble(doubleKey);

  expect(decimal, 0.352, reason: _location);

  string = Prefs.getString(stringKey);

  expect(string, 'this that', reason: _location);

  strings = Prefs.getStringList(listKey);

  // Could be an empty List; Could be ['this', 'that', 'other']
  expect(strings, anything, reason: _location);

  /// Fetches the latest values from the host platform.
  /// In case there were changes made by another part of the app for example.
  Prefs.reload();
}
