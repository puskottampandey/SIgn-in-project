import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:signin/models/user.dart';
import 'package:signin/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:signin/models/user_management.dart';
import 'package:http/http.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Users user = Users();
  String email = "";
  String password = "";
  bool _obscureText = true;
  void visibletest() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (Colors.brown.shade100),
      appBar: AppBar(
        backgroundColor: Colors.brown.shade100,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 600)),
              Text(
                "Registration",
                style: TextStyle(
                    color: Colors.brown.shade400,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              const SizedBox(height: 40),
              TextFormField(
                cursorColor: Colors.brown.shade800,
                cursorHeight: 30,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide(color: Colors.brown.shade800)),
                  floatingLabelStyle: TextStyle(color: Colors.brown.shade800),
                  labelStyle: TextStyle(color: Colors.brown.shade200),
                  labelText: "Email",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: (Colors.brown.shade400),
                      ),
                      borderRadius: BorderRadius.circular(32)),
                ),
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              const SizedBox(
                height: 40.0,
              ),
              TextFormField(
                cursorHeight: 30,
                cursorColor: Colors.brown.shade400,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    color: (Colors.brown.shade400),
                    onPressed: visibletest,
                    icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide(color: Colors.brown.shade800)),
                  floatingLabelStyle: TextStyle(color: Colors.brown.shade800),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.brown.shade200),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              const Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                width: 150,
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.brown.shade400),
                  ),
                  onPressed: () async {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email, password: password)
                        .then((signedInUser) {
                      Usermanagement().storeNewUser(user, context);
                    }).catchError((e) {
                      (e);
                    });
                  },
                  child: const Text("Register"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
