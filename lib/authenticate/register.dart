import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (Colors.brown.shade100),
      appBar: AppBar(
        backgroundColor: Colors.brown.shade100,
        elevation: 0.0,
      ),
      body: Row(
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 60)),
          Text(
            "Registration",
            style: TextStyle(
                color: Colors.brown.shade400,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
        ],
      ),
    );
  }
}
