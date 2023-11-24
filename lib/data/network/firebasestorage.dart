  import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

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
