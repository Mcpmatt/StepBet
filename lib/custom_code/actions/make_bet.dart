// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math' as math;

Future makeBet(int betAmount, int mineCount) async {
  List<bool> bombList = List.filled(25, false);
  List<int> bombPositions = [];

  while (bombPositions.length < mineCount) {
    int randomPosition = math.Random().nextInt(25);
    if (!bombPositions.contains(randomPosition)) {
      bombPositions.add(randomPosition);
      bombList[randomPosition] = true;
    }
  }

  // New balanced multiplier calculation
  double multiplierIncrement;
  if (mineCount == 24) {
    multiplierIncrement = 50.0; // Extreme risk = extreme reward
  } else {
    // Base multiplier starts very small and scales up with mine count
    // 1 mine: ~1.1x
    // 5 mines: ~1.5x
    // 10 mines: ~2.5x
    // 15 mines: ~5x
    // 20 mines: ~15x
    multiplierIncrement = 1.0 + (mineCount * 0.1) + math.pow(mineCount / 10, 2);
  }

  FFAppState().update(() {
    FFAppState().isBomb = bombList;
    FFAppState().isRevealed = List.filled(25, false);
    FFAppState().currentBet = betAmount;
    FFAppState().multiplierIncrement = multiplierIncrement;
    FFAppState().currentMultiplier = 1.0;
    FFAppState().isGameActive = true;
    FFAppState().mineCount = mineCount;
    FFAppState().bombHit = false; // Reset bombHit at start of new game
  });
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
