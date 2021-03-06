import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/player.dart';
import '../providers/player_provider.dart';
import 'addplayerscreen.dart';

class ScoreCard extends StatefulWidget {
  const ScoreCard({Key? key}) : super(key: key);

  @override
  _ScoreCardState createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  final String title = 'Scorecard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) {
                    return AddPlayerScreen();
                  },
                ),
              );
            },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            Consumer<AddPlayerNotifier>(
              builder: (context, addPlayerNotifier, child) {
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: addPlayerNotifier.playerList.length,
                    itemBuilder: (context, index) {
                      return PlayerItem(addPlayerNotifier.playerList[index],
                          addPlayerNotifier, index);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget PlayerItem(
      Player player, AddPlayerNotifier addPlayerNotifier, int index) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: ListTile(
          title: Text(
            player.playerName,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              player.scoreCount != 0
                  ? IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        addPlayerNotifier.updatePlayerScoreCount(
                          index,
                          player.scoreCount - 1,
                        );
                      })
                  : Container(),
              Text(player.scoreCount.toString()),
              IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    addPlayerNotifier.updatePlayerScoreCount(
                      index,
                      player.scoreCount + 1,
                    );
                  }),
              TextButton(
                  child: const Text('submit'),
                  onPressed: () {
                    uploadScore(player, addPlayerNotifier, index);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget? uploadScore(
      Player player, AddPlayerNotifier addPlayerNotifier, int index) {
    CollectionReference scorecardtest =
        FirebaseFirestore.instance.collection('ScorecardTest');

    scorecardtest
        .add({
          'name': player.playerName,
          'score': player.scoreCount,
        })
        .then((value) => print('User Added'))
        .catchError((error) => print('failed $error'));
  }
}
