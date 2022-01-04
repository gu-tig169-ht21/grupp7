import 'package:flutter/material.dart';
import 'package:my_first_app/auth_firebase/authentication_service.dart';
import 'package:my_first_app/auth_firebase/sign_in.dart';
import 'package:my_first_app/view/scorecard.dart';
import 'package:my_first_app/view/scorecard_view.dart';
import 'package:provider/src/provider.dart';
import './ny_scorecard.dart';
import 'holeone.dart';
import 'scorecard_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'DiscMANIA',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScoreCard()));
              },
              child: Text('Skapa scorekort'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthenticationService>().signOut();
              },
              child: Text("Sign out"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewScorecardView()));
              },
              child: Text('testsida'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HoleIndex()));
              },
              child: Text('hole1'),
            ),
          ],
        ),
      ),
    );
  }
}
