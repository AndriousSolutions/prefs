// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter/services.dart';

//const _location = '========================== integration_test.dart';

Future<void> integrationTesting(WidgetTester tester) async {
  //

  // Enter 'hi' into the TextField.
  await tester.enterText(find.byKey(const Key('string')), 'this that');
  await tester.sendKeyEvent(LogicalKeyboardKey.tab);
  await tester.pumpAndSettle();

  Finder finder = find.byKey(const Key('integer'));
  await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
  await tester.pumpAndSettle();
  await tester.enterText(finder, '12');
  await tester.sendKeyEvent(LogicalKeyboardKey.tab);
  await tester.pumpAndSettle();

  finder = find.byKey(const Key('double'));
  await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
  await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
  await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
  await tester.pumpAndSettle();
  await tester.enterText(finder, '0.352');
  await tester.sendKeyEvent(LogicalKeyboardKey.tab);
  await tester.pumpAndSettle();

  await tester.tap(find.byKey(const Key('true')));
  await tester.pumpAndSettle();

  await tester.tap(find.byKey(const Key('Save')));
  await tester.pumpAndSettle();
}
