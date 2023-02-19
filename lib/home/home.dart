import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown.shade100,
        appBar: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          scrolledUnderElevation: 10,
          backgroundColor: Colors.brown.shade400,
          title: const Text(
            "Welcome",
            style: TextStyle(fontStyle: FontStyle.normal),
          ),
          actions: [
            const Icon(
              Icons.logout_outlined,
            ),
            GestureDetector(
              onTap: () => {
                Navigator.of(context).pushReplacementNamed('/signin'),
              },
              child: const Text("Logout"),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5)),
          ],
        ));
  }
}
