import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class Scorecard {
  late String cardId;
  late String course;
  List<String> players = [];
}

class PlayerScore {
  List<int> scores = [];
  late String playername;
}

class Course {
  late String courseName;
  late int numberOfHoles;
}

class NewScorecardView extends StatefulWidget {
  const NewScorecardView({Key? key}) : super(key: key);

  @override
  _NewScorecardViewState createState() => _NewScorecardViewState();
}

class _NewScorecardViewState extends State<NewScorecardView> {
  late String chooseCourse = 'Skatås';
  List listCourse = ['Skatås', 'Slottskogen'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Scorecard!'),
      ),
      body: Center(
        child: Column(
          children: [
            DropdownButton(
                hint: Text('Choose Course'),
                dropdownColor: Colors.blue.shade900,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 40,
                value: chooseCourse,
                onChanged: (newValue) {
                  setState(() {
                    chooseCourse == newValue;
                  });
                },
                items: listCourse.map((valueItem) {
                  return DropdownMenuItem(
                      value: valueItem, child: Text(valueItem));
                }).toList()),
          ],
        ),
      ),
    );
  }
}
