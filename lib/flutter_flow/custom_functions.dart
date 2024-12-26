import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

int convertStepsToTokens(
  int? stepCount,
  double? multiplier,
) {
  // Multiply step count by a multiplier, rounding down to always return an integer
  if (stepCount != null && multiplier != null) {
    return (stepCount * multiplier).floor();
  } else {
    return 0;
  }
}

String tokensToRanks(int? tokens) {
  // Make a function 'tokensToRanks' which takes in tokens as an argument, and returns the rank (a string variable). If a user has less than 100 tokens, the rank will be 'rookie' above 100 and less than 250 will be 'beginner'. Above 250 and less than 500 is 'intermediate', and above 500 is 'pro'.
  if (tokens != null) {
    if (tokens < 1000) {
      return 'Broke';
    } else if (tokens >= 1000 && tokens < 5000) {
      return 'Rookie';
    } else if (tokens >= 5000 && tokens < 10000) {
      return 'Gambler';
    } else if (tokens >= 10000 && tokens < 25000) {
      return 'Pro';
    } else if (tokens >= 25000 && tokens < 500000) {
      return 'Baller';
    } else {
      return 'High Roller';
    }
  } else {
    return '';
  }
}
