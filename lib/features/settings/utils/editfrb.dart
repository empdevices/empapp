import 'package:empapp/barrel.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class UpdateService {
  Future<void> updateProfilePicture(File image) async {
    // get the user's id
    final userId = FirebaseAuth.instance.currentUser!.uid;
    // create a reference to the user's profile picture
    final ref = FirebaseStorage.instance.ref().child('userimage/$userId');
    // upload the image to the reference
    await ref.putFile(image);
    // get the download url of the image
    final url = await ref.getDownloadURL();
    // update the user's profile picture in the database
    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'userimage': url,
    });
  }
  
}
