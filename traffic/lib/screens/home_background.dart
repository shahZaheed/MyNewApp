import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:traffic/screens/login_screen.dart';

import '../model/user_model.dart';
class HomeBackground extends StatefulWidget {
  final Widget child;
  const HomeBackground({Key? key,required this.child}) : super(key: key);

  @override
  _HomeBackgroundState createState() => _HomeBackgroundState(child: this.child);
}

class _HomeBackgroundState extends State<HomeBackground> {

  final Widget child;



  _HomeBackgroundState({required this.child});
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });

  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          children: [

            //bg image
            Positioned(
              child: Image.asset('assets/svgimages/hometop3.png', width: size.width*1.2,),
            ),
            //Avatar
            SafeArea(child: Padding(
              padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
              child: Column(
                children: [
                  Container(

                    padding: EdgeInsets.only(bottom: 40.0),
                    //color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget>[
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/svgimages/avatar.PNG'),

                        ),
                        const SizedBox(width: 12,),

                        Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Hi, ${loggedInUser.firstName}",


                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 3.0,
                                      color: Color.fromARGB(124, 0, 0, 0),
                                    ),
                                  ], color: Colors.white),
                                ),
                                Text("${loggedInUser.lastName}",
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(1.0, 1.0),
                                      blurRadius: 3.0,
                                      color: Color.fromARGB(124, 0, 0, 0),
                                    ),
                                  ],
                                  color: Colors.white),),

                              ],
                            ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                   width: double.infinity,
                   child: GridView.count(
                     crossAxisCount: 2,
                     crossAxisSpacing: 10,
                     mainAxisSpacing: 10,
                     primary: false,
                     children: [

                     Card(
                       elevation: 10,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(20.0),

                       ),
                       child: Column(
                         children: [
                           Image.asset('assets/homesvgicons/safety and rules.png',height: 125,),
                           TextButton(onPressed: (){_safetyAndRules(context);},
                             child: Text("Safety & Rules",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.blueAccent,),),)
                         ],
                       ),
                     ),
                       Card(
                         elevation: 10,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(20.0),

                         ),
                         child: Column(
                           children: [
                             Image.asset('assets/homesvgicons/policestation.png',height: 120,),
                              TextButton(onPressed: (){_yourStation(context);}, child: Text("Near police station",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.blueAccent),),),
                           ],
                         ),
                       ),


                   ],),
                  ),
                  Container(

                    height: 150,
                    width: double.infinity,
                    //
                    decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(offset: Offset(2,5),color: Colors.grey,
                        blurRadius: 7,
                        spreadRadius: -0.5)
                      ],
                    ),
                    child: Row(

                      children: [
                        Image.asset('assets/homesvgicons/paychallan.png',height:150 ,width: 159,),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,top: 30),
                          child: Container(child: Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,

                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Pay Challan",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              SizedBox(height: 15,),

                              //Text("At fingertips away",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                              ElevatedButton(onPressed: (){}, child: Text("Pay Now",style: TextStyle(fontSize: 18,),),
                                style: ElevatedButton.styleFrom(
                                  elevation: 8,
                                  primary: Colors.purple,
                                  padding: EdgeInsets.fromLTRB(35, 15, 35, 15),
                                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                                ),
                              )
                            ],
                          ),),
                        )
                      ],
                    ),

                  ),
                  SizedBox(height: 15,),
                  Container(

                    height: 150,
                    width: double.infinity,
                    //
                    decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(offset: Offset(2,5),color: Colors.grey,
                            blurRadius: 7,
                            spreadRadius: -0.5)
                      ],
                    ),
                    child: Row(

                      children: [
                        Image.asset('assets/homesvgicons/stolen.png',height:150 ,width: 159,),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,top: 30),
                          child: Container(child: Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,

                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Report Stolen Vehicles",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              SizedBox(height: 20,),

                              //Text("At fingertips away",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                              ElevatedButton(onPressed: (){_reportNow(context);}, child: Text("Report Now",style: TextStyle(fontSize: 18,),),
                                style: ElevatedButton.styleFrom(
                                    elevation: 8,
                                    primary: Colors.purple,
                                    padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                                ),
                              )
                            ],
                          ),),
                        )
                      ],
                    ),

                  ),

                ],
              ),
            ),),

            //Icon menu
            Padding(

              padding: const EdgeInsets.only(left: 0,right: 20,top: 35),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    IconButton(

                      icon: Icon(
                        Icons.power_settings_new_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: (){logout(context);},
                      tooltip: "Logout",
                    ),
                  ],
                ),
            ),



            child,
          ],

        )

    );
  }
  /*Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }*/
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
  void _safetyAndRules(BuildContext context)
  {
    showGeneralDialog(context: context,
        barrierDismissible:  false,
        transitionDuration: Duration(milliseconds: 500),
        transitionBuilder: (context,animation ,secondaryAnimation,child){
      return FadeTransition(opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),);
        },
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Safety & Rules",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          backgroundColor: Colors.purple,
        ),
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(20.0),
            color: Colors.white,
                 child: ListView(
                   children: <Widget>[
                     Card(
                       elevation: 5,
                       child: ListTile(
                            title: Text("Rule No. 1 : Do Not Drink and Drive"),
                            subtitle: Text(
                                  "A statistic reveals that around 19 Indians are killed "
                               "daily due to drunk-driving road accidents (source), As per"
                               " the current law, the blood alcohol limit permissible for"
                               " driving is up to 0.03%, which is equivalent to 30 mg of alcohol per 100 ml of blood."
                        ),
                         trailing: Icon(Icons.verified,color: Colors.blueAccent,),
                        ),
                     ),
                     SizedBox(height: 20,),
                     Card(
                       elevation: 5,
                       child: ListTile(
                         title: Text("Rule No. 2 :Jumping the Red Light"),
                         subtitle: Text(
                             "If you do not intend to bear penalties of up to Rs.5000 and a one-year prison sentence, ensure you "
                                 "stick to the various traffic signals during a drive, "
                                 "even if you are in a hurry. Remember the old saying, ‘better late than never."),
                         trailing: Icon(Icons.verified,color: Colors.blueAccent,),
                       ),
                     ),
                     SizedBox(height: 20,),
                     Card(
                       elevation: 5,
                       child: ListTile(
                         title: Text("Rule No. 3 :  Over Speeding"),
                         subtitle: Text(
                             "Drivers should never exceed the recommended speed"
                                 " guidelines on roads, as doing so will draw the ire of traffic cops."

                         ),
                         trailing: Icon(Icons.verified,color: Colors.blueAccent,),
                       ),
                     ),
                     SizedBox(height: 20,),
                     Card(
                       elevation: 5,
                       child: ListTile(
                         title: Text("Rule No. 2 :Jumping the Red Light"),
                         subtitle: Text(
                             "If you do not intend to bear penalties of up to Rs.5000 and a one-year prison sentence, ensure you "
                                 "stick to the various traffic signals during a drive, "
                                 "even if you are in a hurry. Remember the old saying, ‘better late than never."),
                         trailing: Icon(Icons.verified,color: Colors.blueAccent,),
                       ),
                     ),
                     SizedBox(height: 15,),
                     ElevatedButton(onPressed: (){
                       Navigator.of(context).pop();
                     },


                         child: Text("Dismiss",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                     style: ElevatedButton.styleFrom(
                       padding: EdgeInsets.only(top: 15,bottom: 15),
                       primary: Colors.purple,
                       onPrimary: Colors.white,
                     ),)

                   ],
                 ),






          ),

        ),
      );

      },
    );

  }
  void _yourStation(BuildContext context)
  {
    showGeneralDialog(context: context,
      barrierDismissible:  false,
      transitionDuration: Duration(milliseconds: 500),
      transitionBuilder: (context,animation ,secondaryAnimation,child){
        return FadeTransition(opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),);
      },
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Near Me (Police Stations)",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            backgroundColor: Colors.purple,
          ),
          body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(20.0),
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text("Neredmet Police quaters"),
                      subtitle: Text(
                          "A statistic reveals that around 19 Indians are killed "
                              "daily due to drunk-driving road accidents (source), As per"
                              " the current law, the blood alcohol limit permissible for"
                              " driving is up to 0.03%, which is equivalent to 30 mg of alcohol per 100 ml of blood."
                      ),
                      trailing: Icon(Icons.directions,color: Colors.blueAccent,),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text("Jawahar Nagar Police Station"),
                      subtitle: Text(
                          "If you do not intend to bear penalties of up to Rs.5000 and a one-year prison sentence, ensure you "
                              "stick to the various traffic signals during a drive, "
                              "even if you are in a hurry. Remember the old saying, ‘better late than never."),
                      trailing:Icon(Icons.directions,color: Colors.blueAccent,
                    ),),
                  ),
                  SizedBox(height: 20,),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text("Jubilee Hills Police Station"),
                      subtitle: Text(
                          "Drivers should never exceed the recommended speed"
                              " guidelines on roads, as doing so will draw the ire of traffic cops."

                      ),
                      trailing: Icon(Icons.directions,color: Colors.blueAccent,),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text("Banjara Hills Police Station"),
                      subtitle: Text(
                          "If you do not intend to bear penalties of up to Rs.5000 and a one-year prison sentence, ensure you "
                              "stick to the various traffic signals during a drive, "
                              "even if you are in a hurry. Remember the old saying, ‘better late than never."),
                      trailing: Icon(Icons.directions,color: Colors.blueAccent,),
                    ),
                  ),
                  SizedBox(height: 15,),
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).pop();
                  },


                    child: Text("Dismiss",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(top: 15,bottom: 15),
                      primary: Colors.purple,
                      onPrimary: Colors.white,
                    ),)

                ],
              ),






            ),

          ),
        );

      },
    );

  }
  void _reportNow(BuildContext context)
  {
    showGeneralDialog(context: context,
      barrierDismissible:  false,
      transitionDuration: Duration(milliseconds: 500),
      transitionBuilder: (context,animation ,secondaryAnimation,child){
        return FadeTransition(opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),);
      },
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {


        final nameField = TextFormField(
          autofocus: false,
          readOnly: true,
          //textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person,color: Color(0xA3CC02D8),),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: '${loggedInUser.firstName} ${loggedInUser.lastName}',

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color:Color(0xA3CC02D8), width: 2 )
            ),
          ),
        );
        final phoneField = TextFormField(
          autofocus: false,
          readOnly: true,
          //textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.call,color: Color(0xA3CC02D8),),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: '${loggedInUser.phoneNumber}',

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color:Color(0xA3CC02D8), width: 2 )
            ),
          ),
        );
        final vField = TextFormField(
          autofocus: false,
          readOnly: true,
          //textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.bus_alert,color: Color(0xA3CC02D8),),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: '${loggedInUser.vehicleNumber}',

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color:Color(0xA3CC02D8), width: 2 )
            ),
          ),
        );
        final lField = TextFormField(
          autofocus: false,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.local_police,color: Color(0xA3CC02D8),),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: '${loggedInUser.licenseNumber}',

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color:Color(0xA3CC02D8), width: 2 )
            ),
          ),
        );
        final loginBtn = Material(
          elevation: 20,
          color:  Color(0xBE860590),
          borderRadius: BorderRadius.circular(30),
          child: MaterialButton(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            onPressed: () {
              //Navigator.pushReplacement(
              //context, MaterialPageRoute(builder: (context) => HomeScreen()));
              Navigator.of(context).pop();
              Fluttertoast.showToast(msg: "Reported Successfully..");
            },
            minWidth: MediaQuery.of(context).size.width,
            child: const Text(
              "Report Now",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        );
        return Scaffold(
          appBar: AppBar(
            title: Text("Report vehicle with ease.."),
            backgroundColor: Colors.purple,
          ),
            body:Center(
              
              child: Container(
                padding: EdgeInsets.only(top:40,left: 30,right: 30),

                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child:  Form(child: Column(
                      children: [
                        Image.asset("assets/homesvgicons/stolen1.png",height: 150,),
                        SizedBox(height: 20,),
                        //Text("Vehicle Number"),
                        nameField,
                        SizedBox(height: 20,),
                        phoneField,
                        SizedBox(height: 20,),
                        vField,
                        SizedBox(height: 15,),
                        //Text("License Number"),
                        lField,
                        SizedBox(height: 15,),
                        loginBtn
                      ],
                    ),

                    ),
                  )



              ),
            ),

        );
      },
    );

  }


}
