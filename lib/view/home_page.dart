import 'package:flutter/material.dart';
import 'package:my_first_app/auth_firebase/authentication_service.dart';
import 'package:provider/provider.dart';
import 'scorecard_view.dart';
import './result_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createscorecardbutton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueGrey,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(120, 20, 120, 20),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ScoreCard()));
        },
        child: const Text(
          'Scorecard',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    final resultbutton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueGrey,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(130, 20, 130, 20),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ResultView()));
        },
        child: const Text(
          'Results',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    final signoutbutton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueGrey,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(125, 20, 125, 20),
        onPressed: () {
          context.read<AuthenticationService>().signOut();
        },
        child: const Text(
          'Sign Out',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('DiscMANIA'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            createscorecardbutton,
            const SizedBox(height: 30),
            resultbutton,
            const SizedBox(height: 30),
            signoutbutton,
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
