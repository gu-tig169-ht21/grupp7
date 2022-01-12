import 'package:flutter/material.dart';
import '../providers/player_provider.dart';
import 'package:provider/provider.dart';

class AddPlayerScreen extends StatelessWidget {
  AddPlayerScreen({Key? key}) : super(key: key);

  final String title = 'Add Player';

  final TextEditingController _playerNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _playerNameController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                hintText: 'player name',
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              child: const Text('add player'),
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
