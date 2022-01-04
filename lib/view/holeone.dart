import 'package:flutter/material.dart';

class HoleIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: List.generate(
          18,
          (i) => ListTileScore(
            title: "Hole $i",
          ),
        ),
      ),
    );
  }
}

class ListTileScore extends StatefulWidget {
  String title;
  ListTileScore({Key? key, required this.title}) : super(key: key);
  @override
  _ListTileScoreState createState() => _ListTileScoreState();
}

class _ListTileScoreState extends State<ListTileScore> {
  int _itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _itemCount != 0
              ? IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => setState(() => _itemCount--),
                )
              : Container(),
          Text(_itemCount.toString()),
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => setState(() => _itemCount++)),
          Text(
            'My total score',
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            (_itemCount.toString()),
          )
        ],
      ),
    );
  }
}
