// import 'dart:html';
// import 'package:http/http.dart';
// import 'dart:convert';
// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_first_app/view/home_page.dart';

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
      appBar: AppBar(
        title: const Text('Highscores'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: StreamBuilder<QuerySnapshot>(
                  stream: scorecardTest,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot,
                  ) {
                    if (snapshot.hasError) {
                      return const Text('this isnt workin');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text('Loading');
                    }
                    final data = snapshot.requireData;

                    return ListView(
                      shrinkWrap: true,
                      children: snapshot.data!.docs.map((doc) {
                        return Card(
                          child: ListTile(
                            title: Text((doc.data() as Map)['name'].toString()),
                            subtitle:
                                Text((doc.data()! as Map)['score'].toString()),
                          ),
                        );
                      }).toList(),

                      /* return ListView.builder(
                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          var players = data.docs[index]['players'];
                          var name = players. name;
                          var score = players['score'][0];
                          return Text('$name - $score');
                        });
*/
                      /* return ListView.builder(
                      itemCount: data.size,
                      itemBuilder: (context, index) {
                        return Text('${data.docs[index]['name']}');
                      },
                    ); */
                    );
                  }),
            ),
            const Text(
              'Enter score',
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
                hintText: 'Name',
                labelText: 'Name',
              ),
              onChanged: (value) {
                name = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'name';
                }
                return null;
              }),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'score',
              labelText: 'score',
            ),
            onChanged: (value) {
              if (value.isNotEmpty) score = int.parse(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'enter score please';
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
                    const SnackBar(
                      content: Text('uploading score to firebase'),
                    ),
                  );

                  scorecardtest
                      .add({'name': name, 'score': score})
                      .then((value) => print('User Added'))
                      .catchError((error) => print('failed $error'));
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
