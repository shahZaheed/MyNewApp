import 'package:flutter/material.dart';
import 'package:traffic/screens/root_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final _logo = Material(
      shape: const CircleBorder(),
      child: InkWell(
        splashColor: const Color.fromARGB(150, 2, 45, 80),
        onTap: () {},
        child: Ink.image(
          image: const AssetImage('assets/Hawk_eye_facebook.jpg'),
          height: 150,
          width: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
          backgroundColor: Color.fromARGB(255, 3, 43, 77),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            padding: EdgeInsets.all(40.0),
            child: Column(
              children: [_logo],
            ),
          ),
        ));
  }
}
