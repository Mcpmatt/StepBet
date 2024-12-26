import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:fitness305_casino/flutter_flow/flutter_flow_drop_down.dart';
import 'package:fitness305_casino/flutter_flow/flutter_flow_icon_button.dart';
import 'package:fitness305_casino/flutter_flow/flutter_flow_widgets.dart';
import 'package:fitness305_casino/flutter_flow/flutter_flow_theme.dart';
import 'package:fitness305_casino/index.dart';
import 'package:fitness305_casino/main.dart';
import 'package:fitness305_casino/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:fitness305_casino/backend/firebase/firebase_config.dart';
import 'package:fitness305_casino/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();

    await FlutterFlowTheme.initialize();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  testWidgets('Successful Login', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: LoginPageWidget(),
      ),
    ));

    await tester.pumpAndSettle(Duration(milliseconds: 3000));
    await tester.enterText(
        find.byKey(ValueKey('emailAddress_qcto')), 'us2test@gmail.com');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.enterText(find.byKey(ValueKey('password_3v8d')), 'password');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.tap(find.byKey(ValueKey('Button_scn6')));
    await tester.pumpAndSettle(Duration(milliseconds: 3000));
    expect(find.byKey(ValueKey('Text_f0f3')), findsOneWidget);
  });

  testWidgets('Step Entry Navigation', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: LoginPageWidget(),
      ),
    ));

    await tester.pumpAndSettle(Duration(milliseconds: 3000));
    await tester.enterText(
        find.byKey(ValueKey('emailAddress_qcto')), 'us2test@gmail.com');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.enterText(find.byKey(ValueKey('password_3v8d')), 'password');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.tap(find.byKey(ValueKey('Button_scn6')));
    await tester.pumpAndSettle(Duration(milliseconds: 3000));
    await tester.tap(find.byKey(ValueKey('StepNavButton_c7ty')));
    await tester.pumpAndSettle(Duration(milliseconds: 3000));
    expect(find.byKey(ValueKey('EnterStepCount_zefj')), findsOneWidget);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
