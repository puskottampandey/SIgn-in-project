import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(Icons.person),
        ],
        title: GestureDetector(
          onTap: () async {
            FirebaseAuth.instance.signOut().then((value) {
              Navigator.of(context).pushReplacementNamed('/siginin');
            }).catchError((e) {
              (e);
            });
          },
          child: const Text(
            "logOut",
            textAlign: TextAlign.end,
          ),
        ),
      ),
    );
  }
}
