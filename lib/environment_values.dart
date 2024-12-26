import 'dart:convert';
import 'package:flutter/services.dart';

class FFDevEnvironmentValues {
  static const String currentEnvironment = 'Production';
  static const String environmentValuesPath =
      'assets/environment_values/environment.json';

  static final FFDevEnvironmentValues _instance =
      FFDevEnvironmentValues._internal();

  factory FFDevEnvironmentValues() {
    return _instance;
  }

  FFDevEnvironmentValues._internal();

  Future<void> initialize() async {
    try {
      final String response =
          await rootBundle.loadString(environmentValuesPath);
      final data = await json.decode(response);
      _RewardsPurchase = data['RewardsPurchase'];
      _StepLimit = data['StepLimit'];
    } catch (e) {
      print('Error loading environment values: $e');
    }
  }

  int _RewardsPurchase = 0;
  int get RewardsPurchase => _RewardsPurchase;

  bool _StepLimit = false;
  bool get StepLimit => _StepLimit;
}
