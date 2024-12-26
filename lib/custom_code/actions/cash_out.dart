// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future cashOut() async {
  // Calculate and cast to integer first to get clean number
  //int winAmount = (FFAppState().currentBet * FFAppState().currentMultiplier).round();

  FFAppState().update(() {
    FFAppState().isGameActive = false;
    //FFAppState().currentBet = 0;
    FFAppState().isRevealed = List.filled(25, true);
    //FFAppState().winAmount = winAmount;
  });
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
