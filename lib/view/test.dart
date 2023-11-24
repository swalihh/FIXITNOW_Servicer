import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _RegisterationState();
}

class _RegisterationState extends State<Test> {
File?imagetemp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
body: Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Column(
  
    children: [
// ignore: prefer_const_constructors
SizedBox(height: 50,),
      InkWell(
        onTap: () {
          imagepick();
        },
        child: CircleAvatar(
      radius: 50,
      child:imagetemp !=null? Container(
        decoration: BoxDecoration(image: DecorationImage(image: FileImage(File(imagetemp!.path)),fit: BoxFit.cover)),
      ):const SizedBox(),
        ),
      ),
      ElevatedButton(onPressed: (){
 addTofirebase(imagetemp);
      }, child: const Text('Add'))
    ],
  
  ),
),

    );

  }

  imagepick() async{
    final  image=await ImagePicker().pickImage(source: ImageSource.gallery);
  if(image!=null){
setState(() {
  imagetemp=File(image.path);

});
  }
  }

  addTofirebase(File ?imagetemp)async{
    if(imagetemp!=null){
       String? imageFirebaseUrl;
    {
      String uniqueName = DateTime.now().millisecond.toString();
      Reference fireBaseRootReference = FirebaseStorage.instance.ref();
      Reference toUploadImgReference =
          fireBaseRootReference.child('myPictures$uniqueName.png');
      try {
        await toUploadImgReference.putFile(File(imagetemp.path));
        imageFirebaseUrl = await toUploadImgReference.getDownloadURL();
        print(imageFirebaseUrl);
        return imageFirebaseUrl;
      } catch (e) {
        print(e);
        return null;
 }
}
    }   
   
}
}

