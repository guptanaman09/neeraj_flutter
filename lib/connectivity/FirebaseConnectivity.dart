import 'package:firebase_database/firebase_database.dart';

///Created by Neeraj Vijayvargiya on 28/11/22.
class FirebaseConnctivity {
  FirebaseDatabase instance = FirebaseDatabase.instance;
  void start() {
    DatabaseReference ref = instance
        .refFromURL("https://iot-cloud-02-default-rtdb.firebaseio.com/");
    ref.child("INTELLECTO_00957").get().then((value) {
      if (value.exists) {
        print("firebase data:${value.children.first.value.toString()}");
      }
    });
  }
}
