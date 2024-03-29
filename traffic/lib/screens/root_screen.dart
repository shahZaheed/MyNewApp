// ignore: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traffic/screens/admin_screen.dart';
import 'package:traffic/screens/login_screen.dart';
import 'package:traffic/screens/newroot_background.dart';
import 'package:traffic/screens/register_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    final _logo = Material(
      shape: const CircleBorder(),
      child: InkWell(
        splashColor: const Color.fromARGB(150, 2, 45, 80),
        onTap: () {},
        child: Ink.image(
          image: const AssetImage('assets/Hawk_eye_facebook.jpg'),
          height: 200,
          width: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
    final _login = Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(30),
      //color:  Color(0xA3CC02D8),
      //color:  Color(0x94E60BF4),
      color:  Color(0x8B860590),

      child: MaterialButton(
        padding: const EdgeInsets.all(15.0),
        minWidth: double.infinity,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        child: const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
    final _singup = Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(30),
      color:  Color(0xBE860590),

      child: MaterialButton(
        padding: const  EdgeInsets.all(15.0),
        minWidth: double.infinity,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RegistrationScreen()));
        },
        child: const Text(
          "Sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
    final _admin = Material(
      elevation: 20,
      shadowColor: const Color.fromARGB(255, 2, 45, 80),
      borderRadius: BorderRadius.circular(30),
      color:  Color(0xE4860590),

      child: MaterialButton(
        padding: const EdgeInsets.all(15.0),
        minWidth: double.infinity,
        onPressed: () {
          
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AdminScreen()));
        },
        child: const Text(
          "Admin",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Background(
            //padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
            //color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 40.0),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/svgimages/2people.jpg',height: size.height*0.5,),

                  _login,
                  SizedBox(height: 10,),
                  _singup,
                  SizedBox(height: 10,),

                  _admin
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
