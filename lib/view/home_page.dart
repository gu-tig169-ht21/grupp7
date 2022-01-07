import 'package:flutter/material.dart';
import 'package:my_first_app/auth_firebase/authentication_service.dart';
import 'package:my_first_app/view/result_view.dart';
import 'package:provider/provider.dart';
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
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Text('Skapa scorekort'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScoreCard()));
              },
              child: Text('See score'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthenticationService>().signOut();
              },
              child: Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}
