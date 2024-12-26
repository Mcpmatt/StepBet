// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future handleCardTap(int position) async {
  if (!FFAppState().isGameActive) {
    return;
  }

  List<bool> newRevealed = List<bool>.from(FFAppState().isRevealed);
  newRevealed[position] = true;

  if (FFAppState().isBomb[position]) {
    FFAppState().update(() {
      FFAppState().isRevealed = List.filled(25, true);
      FFAppState().isGameActive = false;
      //FFAppState().currentBet = 0;
      FFAppState().bombHit = true;
      FFAppState().winAmount = 0;
    });
  } else {
    // First calculate the new multiplier
    double newMultiplier =
        FFAppState().currentMultiplier * FFAppState().multiplierIncrement;

    // Then calculate win amount using the new multiplier
    int winAmount = (FFAppState().currentBet * newMultiplier).round();

    FFAppState().update(() {
      FFAppState().isRevealed = newRevealed;
      FFAppState().currentMultiplier = newMultiplier;
      FFAppState().winAmount = winAmount;
    });
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
