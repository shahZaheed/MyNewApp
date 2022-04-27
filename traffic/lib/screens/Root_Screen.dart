// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final _logo = Material(
    child: InkWell(
      splashColor: Colors.blueAccent,
      onTap: () {},
      child: Ink.image(
        image: const AssetImage('assets/logo.png'),
        height: 200,
        width: 200,
        fit: BoxFit.cover,
      ),
    ),
  );
  final _buttons = Material(
      child: ButtonBar(
    overflowDirection: VerticalDirection.up,
    alignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
        onPressed: () {},
        child: const Text("Login"),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 2, 96, 173),
        ),
      ),
      ElevatedButton(
        onPressed: () {},
        child: const Text("Sign Up"),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 2, 96, 173),
        ),
      ),
      ElevatedButton(
        onPressed: () {},
        child: const Text(
          "Admin",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 2, 96, 173),
        ),
      ),
    ],
  ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          _logo,
          _buttons,
        ]),
      ),
    );
  }
}
