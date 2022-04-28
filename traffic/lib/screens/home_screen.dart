import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text("Welcome" ,style:
            TextStyle(

              color: Colors.white,
            ),
         //textAlign: TextAlign.center,
         ),
        centerTitle: true,

        //backgroundColor: Colors.transparent,
        backgroundColor: Color.fromARGB(255, 3, 43, 77) ,

        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu,color: Colors.white , size: 40,),
          onPressed: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context) => RootScreen()));
            //Navigator.of(context).pop();
          },
        ),
        //backgroundColor:const Color.fromARGB(255, 3, 43, 77),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget> [
              Text("welcome back",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.red),),
              Text("name",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.blueAccent),),
              Text("email ",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black),),
              SizedBox(height: 20,),
              ActionChip(label: const Text("logout"), onPressed: (){},)

            ],
          ),
        ),
      ),


    );
  }
}
