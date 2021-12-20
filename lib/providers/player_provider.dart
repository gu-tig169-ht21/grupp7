import 'package:flutter/cupertino.dart';

class PlayerProvider with ChangeNotifier {
  late String _name;
  late int _score;
  late int _totalScore;

  //getters

  String get getName => _name;
  int get getScore => _score;
  int get gettotalScore => _totalScore;

  void editScore(int val) {
    _score = val;
    notifyListeners();
  }
}
