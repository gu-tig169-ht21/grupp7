/*
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Player {
  String name = '';
  List<int> scores = [];

  updateScore(int holeIndex, int newScore) {
    scores[holeIndex] = newScore;
  }

  Player.fromJson(json) {
    name = json['name'];
    scores = json['scores'];
  }
}

class Scorecard {
  late String name;
  List<Player> players = [];

  Scorecard.fromJson(json) {
    name = json['name'];
    players = json['players'].map((nestedJson) => Player.fromJson(nestedJson));
  }
}

class MyState extends ChangeNotifier {
  late List<Scorecard> scoreCards;

  Stream<List<Scorecard>> getScoreCards() {
    return FirebaseFirestore.instance
        .collection('ScorecardTest')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => Scorecard.fromJson(document.data))
            .toList());
  }
}

Map<String, dynamic> json = {
  'name': 'lördgasrunda',
  'players': [
    {
      'name': 'jocke',
      'scores': [3, 4, 5, 6]
    },
    {
      'name': 'jocke-2',
      'scores': [3, 4, 5, 6]
    }
  ]
};

Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Consumer<MyState>(builder: (context, state, __) {
        return StreamBuilder(stream: state.getScoreCards());
      }),
    ),
  );
}





*/






/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
//import 'package:services/firestore_service.dart';

class Player {
  String name;
  int score;
  int totalScore;

  Player(this.name, this.score, this.totalScore);

  Map<String, dynamic> createMap() {
    return {'name': name, 'score': score, 'totalScore': totalScore};
  }

  Player.fromFirestore(Map<String, dynamic> firestoreMap)
      : name = firestoreMap['name'],
        score = firestoreMap['score'],
        totalScore = firestoreMap['totalScore'];
}


*/
