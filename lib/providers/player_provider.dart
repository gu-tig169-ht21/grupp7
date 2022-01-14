import 'package:flutter/material.dart';
import 'package:my_first_app/providers/player.dart';
import './player.dart';

class AddPlayerNotifier extends ChangeNotifier {
  List<Player> playerList = [];

  addPlayer(String playerName) async {
    Player player = Player(playerName: playerName);
    playerList.add(player);
    notifyListeners();
  }

  void updatePlayerScoreCount(int index, int count) {
    playerList[index].scoreCount = count;
    notifyListeners();
  }
}
