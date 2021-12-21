/*
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
   Firestore _db = Firestore.instance;


  Future<void> saveScore(ScorecardTest scoreCardTest) {
    return _db.collection('ScorecardTest').document(MdHOFjWOImGH9adXSyyY.player).setData(MdHOFjWOImGH9adXSyyY.createMap());
)
  }

}


*/


/*
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseSevice {
  void inserData() async {
    var db = FirebaseFirestore.instance.collection('ScorecardTest');

    Map<String, List> ourData = {
      "player": ['jocke', '5'],
      "player2": ['laban', '3'],
      "player3": ['labbe', '8'],
    };

    db.doc("asdf").update(ourData).then((value) => print("success"));
  }
}
*/
