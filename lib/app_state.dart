import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _LastLogin = prefs.containsKey('ff_LastLogin')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_LastLogin')!)
          : _LastLogin;
    });
    _safeInit(() {
      _LoginStreak = prefs.getInt('ff_LoginStreak') ?? _LoginStreak;
    });
    _safeInit(() {
      _DailySteps = prefs.getInt('ff_DailySteps') ?? _DailySteps;
    });
    _safeInit(() {
      _blackjackVisited =
          prefs.getBool('ff_blackjackVisited') ?? _blackjackVisited;
    });
    _safeInit(() {
      _stepGoalReached =
          prefs.getBool('ff_stepGoalReached') ?? _stepGoalReached;
    });
    _safeInit(() {
      _plinkoVisited = prefs.getBool('ff_plinkoVisited') ?? _plinkoVisited;
    });
    _safeInit(() {
      _stepsEntered = prefs.getBool('ff_stepsEntered') ?? _stepsEntered;
    });
    _safeInit(() {
      _leaderboardVisited =
          prefs.getBool('ff_leaderboardVisited') ?? _leaderboardVisited;
    });
    _safeInit(() {
      _minesweeperVisited =
          prefs.getBool('ff_minesweeperVisited') ?? _minesweeperVisited;
    });
    _safeInit(() {
      _appExplored = prefs.getBool('ff_appExplored') ?? _appExplored;
    });
    _safeInit(() {
      _userFeedback = prefs.getBool('ff_userFeedback') ?? _userFeedback;
    });
    _safeInit(() {
      _profileUrl = prefs.getString('ff_profileUrl') ?? _profileUrl;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _gameTokens = 0;
  int get gameTokens => _gameTokens;
  set gameTokens(int value) {
    _gameTokens = value;
  }

  DateTime? _LastLogin = DateTime.fromMillisecondsSinceEpoch(1720094400000);
  DateTime? get LastLogin => _LastLogin;
  set LastLogin(DateTime? value) {
    _LastLogin = value;
    value != null
        ? prefs.setInt('ff_LastLogin', value.millisecondsSinceEpoch)
        : prefs.remove('ff_LastLogin');
  }

  List<bool> _isBomb = [];
  List<bool> get isBomb => _isBomb;
  set isBomb(List<bool> value) {
    _isBomb = value;
  }

  void addToIsBomb(bool value) {
    isBomb.add(value);
  }

  void removeFromIsBomb(bool value) {
    isBomb.remove(value);
  }

  void removeAtIndexFromIsBomb(int index) {
    isBomb.removeAt(index);
  }

  void updateIsBombAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    isBomb[index] = updateFn(_isBomb[index]);
  }

  void insertAtIndexInIsBomb(int index, bool value) {
    isBomb.insert(index, value);
  }

  int _LoginStreak = 0;
  int get LoginStreak => _LoginStreak;
  set LoginStreak(int value) {
    _LoginStreak = value;
    prefs.setInt('ff_LoginStreak', value);
  }

  int _DailySteps = 0;
  int get DailySteps => _DailySteps;
  set DailySteps(int value) {
    _DailySteps = value;
    prefs.setInt('ff_DailySteps', value);
  }

  List<bool> _isRevealed = [];
  List<bool> get isRevealed => _isRevealed;
  set isRevealed(List<bool> value) {
    _isRevealed = value;
  }

  void addToIsRevealed(bool value) {
    isRevealed.add(value);
  }

  void removeFromIsRevealed(bool value) {
    isRevealed.remove(value);
  }

  void removeAtIndexFromIsRevealed(int index) {
    isRevealed.removeAt(index);
  }

  void updateIsRevealedAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    isRevealed[index] = updateFn(_isRevealed[index]);
  }

  void insertAtIndexInIsRevealed(int index, bool value) {
    isRevealed.insert(index, value);
  }

  bool _blackjackVisited = false;
  bool get blackjackVisited => _blackjackVisited;
  set blackjackVisited(bool value) {
    _blackjackVisited = value;
    prefs.setBool('ff_blackjackVisited', value);
  }

  bool _stepGoalReached = false;
  bool get stepGoalReached => _stepGoalReached;
  set stepGoalReached(bool value) {
    _stepGoalReached = value;
    prefs.setBool('ff_stepGoalReached', value);
  }

  double _currentMultiplier = 0.0;
  double get currentMultiplier => _currentMultiplier;
  set currentMultiplier(double value) {
    _currentMultiplier = value;
  }

  bool _plinkoVisited = false;
  bool get plinkoVisited => _plinkoVisited;
  set plinkoVisited(bool value) {
    _plinkoVisited = value;
    prefs.setBool('ff_plinkoVisited', value);
  }

  bool _stepsEntered = false;
  bool get stepsEntered => _stepsEntered;
  set stepsEntered(bool value) {
    _stepsEntered = value;
    prefs.setBool('ff_stepsEntered', value);
  }

  bool _isGameActive = false;
  bool get isGameActive => _isGameActive;
  set isGameActive(bool value) {
    _isGameActive = value;
  }

  bool _leaderboardVisited = false;
  bool get leaderboardVisited => _leaderboardVisited;
  set leaderboardVisited(bool value) {
    _leaderboardVisited = value;
    prefs.setBool('ff_leaderboardVisited', value);
  }

  int _mineCount = 0;
  int get mineCount => _mineCount;
  set mineCount(int value) {
    _mineCount = value;
  }

  bool _minesweeperVisited = false;
  bool get minesweeperVisited => _minesweeperVisited;
  set minesweeperVisited(bool value) {
    _minesweeperVisited = value;
    prefs.setBool('ff_minesweeperVisited', value);
  }

  double _multiplierIncrement = 0.0;
  double get multiplierIncrement => _multiplierIncrement;
  set multiplierIncrement(double value) {
    _multiplierIncrement = value;
  }

  bool _appExplored = false;
  bool get appExplored => _appExplored;
  set appExplored(bool value) {
    _appExplored = value;
    prefs.setBool('ff_appExplored', value);
  }

  bool _bombHit = false;
  bool get bombHit => _bombHit;
  set bombHit(bool value) {
    _bombHit = value;
  }

  int _winAmount = 0;
  int get winAmount => _winAmount;
  set winAmount(int value) {
    _winAmount = value;
  }

  int _currentBet = 0;
  int get currentBet => _currentBet;
  set currentBet(int value) {
    _currentBet = value;
  }

  bool _userFeedback = false;
  bool get userFeedback => _userFeedback;
  set userFeedback(bool value) {
    _userFeedback = value;
    prefs.setBool('ff_userFeedback', value);
  }

  String _profileUrl = '';
  String get profileUrl => _profileUrl;
  set profileUrl(String value) {
    _profileUrl = value;
    prefs.setString('ff_profileUrl', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
