import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
//import '../services/firestore_service.dart';

class Player {
  String name;
  int score;
  int totalScore;

  Player(this.name, this.score, this.totalScore);

  Map<String, dynamic> createMap() {
    return {
      'players.name': name,
      'players.score': score,
      'totalScore': totalScore
    };
  }

  Player.fromFirestore(Map<String, dynamic> firestoreMap)
      : name = firestoreMap['players.name'],
        score = firestoreMap['players.score'],
        totalScore = firestoreMap['totalScore'];
}









/*

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../services/firestore_service.dart';
import 'package:uuid/uuid.dart';

class Player {
  String name = '';
  List<int> scores = [];

  updateScore(int holeIndex, int newScore){
    scores[holeIndex] = newScore;
  }

  Player.fromJson(json){
    name = json['name'];
    scores = json['scores'];
  }
}

class Scorecard {
  String name;
  List<Player> players = [];

  Scorecard.fromJson(json) {
    name = json['name'];
    players = json['players'].map((nestedJson) => Player.fromJson(nestedJson));
  }
}


  class MyState extends ChangeNotifier {
    late List<Scorecard> scoreCards;

    Stream<List<Scorecard> getScoreCards() {
      return FirebaseFirestore.instance.collection('ScoreCard').snapshots().map((snapshot)) => snapshot
      .documents
      .map((document) => Product.fromFirestore(document.data))
      .toList();
    }
  }

Map<String, dynamic> json = {
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
Consumer<MyState>(builder: (context, state, blabla)
  return StreamBuilder(stream: state.getScoreCards()));
  }



*/