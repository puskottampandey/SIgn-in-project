import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signin/authenticate/register.dart';
import 'package:signin/home/home.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  bool _obscureText = true;
  void visibletest() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade100,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
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
                  controller: _emailcontroller,
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
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  controller: _passwordcontroller,
                  cursorHeight: 30,
                  cursorColor: Colors.brown.shade400,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      color: (Colors.brown.shade400),
                      onPressed: visibletest,
                      icon: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
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
                ),
                const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 450)),
                Text(
                  "Forget password?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade400),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                SizedBox(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.brown.shade400),
                    ),
                    onPressed: () async {
                      await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _emailcontroller.text,
                              password: _passwordcontroller.text)
                          .then((value) {
                        Navigator.of(context).pushReplacementNamed('/home');
                      }).catchError((e) {
                        (e);
                      });
                    },
                    child: const Text(
                      "Sigin",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Row(
                  children: [
                    const Text(
                      "Don't have a Login?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                settings: const RouteSettings(),
                                builder: ((context) => const Register())));
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: (Colors.brown.shade400)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
