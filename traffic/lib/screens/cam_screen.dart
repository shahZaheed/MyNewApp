import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:traffic/screens/firebase_api_for_images.dart';
class CamScreen extends StatefulWidget {
  const CamScreen({Key? key}) : super(key: key);

  @override
  _CamScreenState createState() => _CamScreenState();
}

class _CamScreenState extends State<CamScreen> {
  File? image;
  String? fileName;

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
          children: [
            Icon(icon,size: 26,),
            const SizedBox(height: 28,width: 25,),
            Text(title),
          ],
        ),
      ));

  @override
  Widget build(BuildContext context) {
    final filename = image != null ? image!.path : "No image";

    return Center(
     child: Padding(
       padding: const EdgeInsets.only(top: 0,left: 30,right: 30,bottom: 40),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.end,
         children: [
           image != null? Image.file(image!,
             width: double.infinity,
             height: 300,

             fit: BoxFit.cover,
           ):
           //SizedBox(height: 30,),
           Column(
             children: [
               Image.asset("assets/homesvgicons/helmet.PNG",height: 350,width: double.infinity,),
                Text("Want to report voilation?",style:
                TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.red),),
             ],
           ),

           SizedBox(height: 15,),
           buildButton(
             title: "Pick from gallery",
             icon:Icons.image,
             onClicked: (){pickCamera(ImageSource.gallery);},
           ),
           SizedBox(height: 30,child:Text("")),
           buildButton(

           title: "Pick camera",
           icon:Icons.camera_alt,
           onClicked: (){pickCamera(ImageSource.camera);},
           ),
           const SizedBox(height: 20,),
           buildButton(
               title: "Upload Picture",
               icon:Icons.cloud_upload,
               onClicked: (){    Fluttertoast.showToast(msg: "Image Uploaded Successfully..");
               uploadImage();
               fileName!=null;},
           ),

         ],
       ),
     ),
    );
  }
  Future pickCamera(ImageSource source) async
  {

    try {
      final image=await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image=imageTemp;
      });
    } on PlatformException catch (e) {
      // TODO
    }
  }
  Future uploadImage() async
  {
    Fluttertoast.showToast(msg: "Image Uploaded Successfully..");
    if(image == null)return null;
    final fileLongpath = image!.path;
    int index = fileLongpath.lastIndexOf('/');
     fileName= fileLongpath.substring(index);
    final destination = '/files/$fileName';
    FirebaseApi.uploadImage(destination, image!);

  }

}

