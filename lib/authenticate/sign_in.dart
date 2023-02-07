import 'package:flutter/material.dart';
import 'package:signin/home/home.dart';
import 'package:signin/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade100,
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
        child: Form(
          child: Column(
            children: [
              Text(
                "Welcome ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown.shade400,
                    fontSize: 30),
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
                obscureText: true,
                decoration: InputDecoration(
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
              const Padding(padding: EdgeInsets.all(7)),
              Text(
                "Forget password?",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.brown.shade400),
              ),
              const Padding(padding: EdgeInsets.all(20)),
              SizedBox(
                width: 150,
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.brown.shade400),
                  ),
                  onPressed: () async {},
                  child: const Text("Sigin"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
/*style: ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(color: Colors.red)
    )
  )
)*/