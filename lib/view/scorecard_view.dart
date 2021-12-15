import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScoreCard extends StatefulWidget {
  const ScoreCard({Key? key}) : super(key: key);

  @override
  _ScoreCardState createState() => _ScoreCardState();
}

final TextEditingController playerController = TextEditingController();

class _ScoreCardState extends State<ScoreCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('scorecard1').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView(
                children: snapshot.data!.docs.map((document) {
                  return Container(
                    child:
                        Center(child: Text(document['namn']['ID'].toString())),
                  );
                }).toList(),

                /*  ElevatedButton(
                    // child: Icon(Icons.add),
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('scorecard1')
                          .add({'ID': '5', 'namn': 'jocke'});
                    },
                    child: Text('Sign Up'),
                  ),
                */
              );
            }),
      ),
    );

    /* body: StreamBuilder(
          stream;
              FirebaseFirestore.instance.collection('scorecard1').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Text('Loading data, hurry up');
            return Column(
              children: <Widget>[
                Text(snapshot.data.documents[0]['namn']),
                Text(snapshot.data.documents[0]['ID'].toString())
              ],
            );
          }), */
  }
}
