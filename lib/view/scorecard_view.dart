// import 'dart:html';
// import 'package:http/http.dart';
// import 'dart:convert';
// import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ScoreCard extends StatefulWidget {
  const ScoreCard({Key? key}) : super(key: key);

  @override
  _ScoreCardState createState() => _ScoreCardState();
}

final TextEditingController playerController = TextEditingController();

class _ScoreCardState extends State<ScoreCard> {
  final Stream<QuerySnapshot> scorecardTest =
      FirebaseFirestore.instance.collection('ScorecardTest').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('players'),
            Container(
              height: 150,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: StreamBuilder<QuerySnapshot>(
                stream: scorecardTest,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
                  if (snapshot.hasError) {
                    return Text('this isnt workin');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading');
                  }
                  final data = snapshot.requireData;

                  return ListView.builder(
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      return Text('${data.docs[index]['players']}');
                    },
                  );
                },
              ),
            ),
            Text(
              'Wtire data to clod',
              style: TextStyle(fontSize: 20),
            ),
            MyCustomForm()
          ],
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  var name = '';
  var score = 0;

  @override
  Widget build(BuildContext context) {
    CollectionReference scorecardtest =
        FirebaseFirestore.instance.collection('ScorecardTest');
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'name pls',
                labelText: 'name plpx',
              ),
              onChanged: (value) {
                name = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'name ffs';
                }
                return null;
              }),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'score loser',
              labelText: 'score loooser',
            ),
            onChanged: (value) {
              if (value.isNotEmpty) score = int.parse(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'enter score pls';
              }
              return null;
            },
          ),
          SizedBox(height: 15),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('uploading score to firebase'),
                    ),
                  );

                  scorecardtest
                      .add({
                        'players': [
                          {
                            'name': name,
                            'score': [score]
                          }
                        ]
                      })
                      .then((value) => print('User Added'))
                      .catchError((error) => print('failed $error'));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}



   