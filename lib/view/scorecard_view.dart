import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScoreCard extends StatefulWidget {
  const ScoreCard({Key? key}) : super(key: key);

  @override
  _ScoreCardState createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
//       body: StreamBuilder(
//           stream:
//               FirebaseFirestore.instance.collection('scorecard1').snapshots(),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) return Text('Loading data, hurry up');
//             return Column(
//               children: <Widget>[
//                 Text(snapshot.data.documents[0]['namn']),
//                 Text(snapshot.data.documents[0]['ID'].toString())
//               ],
//             );
//           }),
//     );
//   }
  
// }
