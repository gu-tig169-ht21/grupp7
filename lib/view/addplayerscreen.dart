import 'package:flutter/material.dart';
import '../providers/player_provider.dart';
import 'package:provider/provider.dart';

class AddPlayerScreen extends StatelessWidget {
  AddPlayerScreen({Key? key}) : super(key: key);

  final String title = 'Add Player';

  final TextEditingController _playerNameController = TextEditingController();
  final TextEditingController _playerScoreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _playerNameController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                hintText: 'player name',
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              child: Text('add player'),
              onPressed: () async {
                if (_playerNameController.text.isEmpty) {
                  return;
                }
                await Provider.of<AddPlayerNotifier>(context, listen: false)
                    .addPlayer(_playerNameController.text);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
