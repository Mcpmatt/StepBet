// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future initializeGame() async {
  List<bool> initialBombList = List.filled(25, false);
  List<bool> initialRevealedList = List.filled(25, false);

  FFAppState().update(() {
    FFAppState().isBomb = initialBombList;
    FFAppState().isRevealed = initialRevealedList;
    FFAppState().currentMultiplier = 1.0;
    FFAppState().isGameActive = false;
    FFAppState().currentBet = 0;
    FFAppState().mineCount = 1; // Default to 1 mine
    FFAppState().bombHit = false;
  });
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
