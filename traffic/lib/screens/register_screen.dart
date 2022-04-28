import 'package:flutter/material.dart';
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final TextEditingController firstNameController = new TextEditingController();
    final TextEditingController lastNameController = new TextEditingController();
    final TextEditingController emailController = new TextEditingController();
    final TextEditingController phoneController = new TextEditingController();
    final TextEditingController vehicleNumberController = new TextEditingController();
    final TextEditingController licenseNumberController = new TextEditingController();
    final DateTimeRange licenseExpireDateController =new DateTimeRange(start: DateTime(1900) , end:DateTime(2100) );
    final TextEditingController passwordController = new TextEditingController();
    final TextEditingController confirmPasswordController = new TextEditingController();

    //firstNameField
    final firstNameField = TextFormField(autofocus:  false,
      controller: firstNameController,
      //obscureText: true,
      //validator: (){},
      onSaved:(value){
        firstNameController.text = value!;
      } ,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "First Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),

      ),

    );

    //lastNameField
    final lastNameField =TextFormField(autofocus:  false,
      controller: lastNameController,
      //obscureText: true,
      //validator: (){},
      onSaved:(value){
        lastNameController.text = value!;
      } ,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Last Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),

      ),

    );

    //phone field
    final phoneField = TextFormField(autofocus:  false,
      controller: phoneController,

      //obscureText: true,
      //validator: (){},
      onSaved:(value){
        passwordController.text = value!;
      } ,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.call),
        contentPadding: EdgeInsets.fromLTRB(25, 20, 25, 20),
        hintText: "Phone Number",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),

      ),

    );


    //emailField
    final emailField = TextFormField(autofocus:  false,
      controller: emailController,
      obscureText: true,
      //validator: (){},
      onSaved:(value){
        emailController.text = value!;
      } ,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),

      ),

    );

    // vehicleField
    final vehicleField = TextFormField(autofocus:  false,
      controller: vehicleNumberController,
      obscureText: true,
      //validator: (){},
      onSaved:(value){
        vehicleNumberController.text = value!;
      } ,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.bus_alert),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Vehicle Number",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),

      ),

    );

    // licenseField
    final licenseField = TextFormField(autofocus:  false,
      controller: licenseNumberController,
      obscureText: true,
      //validator: (){},
      onSaved:(value){
        licenseNumberController.text = value!;
      } ,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.local_police),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "License Number",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),

      ),

    );

    // passwordField
    final passwordField = TextFormField(
      autofocus:  false,
      controller: passwordController,
      obscureText: true,
      //validator: (){},
      onSaved:(value){
        passwordController.text = value!;
      } ,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),

      ),

    );

    //confirmPasswordField
    final confirmPasswordField = TextFormField(

      autofocus: false,
      controller: confirmPasswordController,
      obscureText: true,
      //validator: (){},
      onSaved: (value){
        confirmPasswordController.text=value!;

      },
      textInputAction:  TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),

      ),

    );

    //signUp button
    final signUpButton =Material(
      elevation: 10,
      color:  const Color.fromARGB(255, 2, 45, 80),
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: (){},
        minWidth: MediaQuery.of(context).size.width,
        child: const Text("SignUp", textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),),
      ),
    );






    return Scaffold(
        appBar: AppBar(
          /* title: const Text(" Admin Login" ,style:
            TextStyle(
              color: const Color.fromARGB(255, 3, 43, 77),
            ),),*/
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: Color.fromARGB(255, 3, 43, 77) ,),
            onPressed: (){
              //Navigator.push(context, MaterialPageRoute(builder: (context) => RootScreen()));
              Navigator.of(context).pop();
            },
          ),
          //backgroundColor:const Color.fromARGB(255, 3, 43, 77),
        ),
        backgroundColor: Colors.white,
        body: Center(

          child: SingleChildScrollView(

            child: Container(
              //color: const Color.fromARGB(20, 3, 43, 77),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(

                  key: _formKey,
                  child:Column(
                    children: <Widget>[
                      SizedBox(
                        height: 200,
                        //child: Image.asset('assets/Hawk_eye_facebook.jpg',fit: BoxFit.contain,),
                        child:Icon(Icons.local_police,size: 200,color: const Color.fromARGB(255, 3, 43, 77),) ,
                      ),
                      SizedBox(height: 25,),
                      firstNameField,
                      SizedBox(height: 25,),
                      lastNameField,
                      SizedBox(height: 25,),
                      emailField,
                      SizedBox(height: 25,),
                      phoneField,
                      SizedBox(height: 25,),
                      vehicleField,
                      SizedBox(height: 25,),
                      licenseField,
                      SizedBox(height: 25,),
                      passwordField,
                      SizedBox(height: 25,),
                      confirmPasswordField,
                      SizedBox(height: 25,),
                      signUpButton,
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Text("Back to login",style: TextStyle(fontWeight: FontWeight.w400,color:Colors.blueAccent, ),),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),


                    ],
                  ) ,
                ),
              ),
            ),

          ),

        ));
  }
}

