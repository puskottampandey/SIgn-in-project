import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return either home or authenticate widget
    return SizedBox(
      height: 10,
      child: Container(
        color: Colors.blue,
        child: ListView(
          children: const [
            Center(
              child: Text(
                "puskottam",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
