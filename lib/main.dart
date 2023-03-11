import 'package:flutter/material.dart';
import 'package:signin/authenticate/register.dart';
import 'package:signin/authenticate/sign_in.dart';
import 'package:signin/home/home.dart';
import 'package:signin/screen/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: const Wrapper(),
      routes: <String, WidgetBuilder>{
        "/signin": (BuildContext context) => const SignIn(),
        "/register": (BuildContext context) => const Register(),
        "/home": (BuildContext context) => const Home(),
      },
    );
  }
}
