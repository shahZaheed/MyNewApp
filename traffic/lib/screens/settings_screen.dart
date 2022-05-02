import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key, required this.changePage}) : super(key: key);
  final void Function(int) changePage;

  Widget buildButton({
    required String title,
    required IconData icon,
    required VoidCallback onClicked,
  }) =>ElevatedButton(

      style: ElevatedButton.styleFrom(
        elevation: 8,
        minimumSize: Size.fromHeight(56),
        primary: Colors.white,
        onPrimary: Colors.purple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
      ),

      onPressed: onClicked,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 20,),
            Text(title),
            const SizedBox(height: 28,width: 25,),
            Icon(icon,size: 26,),

          ],
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildButton(title: 'Guide', icon: Icons.warning_amber_rounded, onClicked: (){}),
            buildButton(title: 'View details', icon: Icons.account_circle, onClicked: (){}),
            buildButton(title: 'Rewards', icon: Icons.card_giftcard_rounded, onClicked: (){}),
            buildButton(title: 'Refer & earn', icon: Icons.supervisor_account, onClicked: (){}),
            buildButton(title: 'Contact us', icon: Icons.call_end, onClicked: (){}),
            buildButton(title: 'About us', icon: Icons.question_mark_rounded, onClicked: (){}),
            buildButton(title: 'logout', icon: Icons.logout, onClicked: (){logout(context);}),


          ],


        ),
      ),
    );
  }
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    showDialog(

      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          //backgroundColor: Colors.blueGrey,
          backgroundColor: Colors.grey,
          child: Container(
            height: 80,
            width: 100,
            //color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(

                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(color: Colors.red,),
                  SizedBox(width: 20,),
                  Text("Logging out..",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 3), () {

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen())); //pop dialog

    });
  }
}
/*ElevatedButton(
            onPressed: () => changePage(0),
            child: const Text('Switch to Home Page'),
          )*/