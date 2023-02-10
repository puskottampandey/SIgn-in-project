import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Usermanagement {
  storeNewUser(user, context) {
    FirebaseFirestore.instance.collection('/users').add(
      {'email': user.email, 'uid': user.uid},
    ).then((value) {
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed("/home");
    }).catchError((e) {
      (e);
    });
  }
}
