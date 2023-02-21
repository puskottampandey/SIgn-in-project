import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signin/home/additem.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /*
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut().then((value) {
      Navigator.of(context, rootNavigator: true)
          .pushReplacementNamed('/signin');
    });
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        centerTitle: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  backgroundColor: Colors.brown.shade100,
                  title: const Text("Do you want to Signout?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Cancel ",
                        style: TextStyle(color: Colors.brown.shade400),
                      ),
                    ),
                    TextButton(
                      onPressed: () => exit(0),
                      child: Text(
                        "Ok",
                        style: TextStyle(color: Colors.brown.shade400),
                      ),
                    )
                    /*
                    
                        onPressed: () async => await logout(),
                        child: const Text("ok"))*/
                  ],
                ),
              ),
            },
            child: const Text("Logout"),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5)),
        ],
      ),
      body: Column(),
    );
  }
}
