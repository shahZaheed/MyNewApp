import 'package:flutter/material.dart';

import 'newrootbody.dart';
class NewRootScreen extends StatefulWidget {
  const NewRootScreen({Key? key}) : super(key: key);

  @override
  _NewRootScreenState createState() => _NewRootScreenState();
}

class _NewRootScreenState extends State<NewRootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
