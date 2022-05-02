import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:traffic/screens/home_background.dart';
import 'package:traffic/screens/login_screen.dart';
import 'package:traffic/model/user_model.dart';
class Home extends StatelessWidget
{
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return Center(
      child: SingleChildScrollView(

        child: Container(
          //color: Colors.yellow,
          child: HomeBackground(

            child: Padding(

              padding: EdgeInsets.all(20),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //adding  floating button here
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



}