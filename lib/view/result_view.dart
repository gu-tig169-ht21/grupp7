import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ResultView extends StatefulWidget {
  const ResultView({Key? key}) : super(key: key);

  @override
  _ResultViewState createState() => _ResultViewState();
}

final TextEditingController playerController = TextEditingController();

class _ResultViewState extends State<ResultView> {
  final Stream<QuerySnapshot> scorecardTest = FirebaseFirestore.instance
      .collection('ScorecardTest')
      .orderBy('score')
      .snapshots();

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 550,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: StreamBuilder<QuerySnapshot>(
                  stream: scorecardTest,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot,
                  ) {
                    if (snapshot.hasError) {
                      return const Text('this is not working');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text('Loading');
                    }

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
                    );
                  }),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => newScoreView()));
              },
              child: const Text('Add Score'),
            ),
          ],
        ),
      ),
    );
  }
}

class newScoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: const [AddOldScore()],
        ),
        appBar: AppBar(
          title: const Text('Add Score'),
          centerTitle: true,
        ));
  }
}

class AddOldScore extends StatefulWidget {
  const AddOldScore({Key? key}) : super(key: key);

  @override
  AddOldScoreState createState() {
    return AddOldScoreState();
  }
}

class AddOldScoreState extends State<AddOldScore> {
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
                hintText: 'Enter name',
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
              icon: Icon(Icons.numbers),
              hintText: 'Enter Score',
              labelText: 'Score',
            ),
            onChanged: (value) {
              if (value.isNotEmpty) score = int.parse(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter score please';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Uploading score to Firebase'),
                    ),
                  );

                  scorecardtest
                      .add({'name': name, 'score': score})
                      .then((value) => print('User Added'))
                      .catchError((error) => print('failed $error'));
                }
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
