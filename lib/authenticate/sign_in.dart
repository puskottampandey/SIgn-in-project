import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signin/authenticate/register.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GoogleSignIn googleAuth = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isloading = false;
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  bool _obscureText = true;
  void visibletest() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final _formKey = GlobalKey<FormState>();
  signin(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isloading = true;
      });
    }
    await _auth
        .signInWithEmailAndPassword(
            email: _emailcontroller.text.trim(),
            password: _passwordcontroller.text.trim())
        .then((value) {
      Navigator.of(context).pushReplacementNamed('/home');
    }).catchError((e) {});

    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Form(
              key: _formKey,
              child: Column(children: [
                Text(
                  "Welcome ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade400,
                      fontSize: 30),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  obscuringCharacter: '.',
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email is required";
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password is required";
                    } else if (value.length < 8) {
                      return "At least 8 letters";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
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
                  child: isloading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.brown.shade400,
                            backgroundColor: Colors.brown.shade400,
                          ),
                        )
                      : ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.brown.shade400),
                          ),
                          onPressed: () async {
                            await signin(context);
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
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.brown.shade200),
                  ),
                  onPressed: () async {
                    googleAuth.signIn().then((result) {}).catchError((e) {
                      (e);
                    });
                  },
                  child: const Center(
                    child: Text(
                      "Signin with Google",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
