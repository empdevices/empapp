import 'dart:typed_data';
import 'package:empapp/features/authentication/utils/imagepicker.dart';
import 'package:empapp/features/authentication/utils/provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfilePhoto extends StatefulWidget {
  const ProfilePhoto({super.key});

  @override
  _ProfilePhotoState createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<ProfilePhoto> {
  void selectImage(ImageSource source) async {
    Uint8List img = await pickImage(source);
    Provider.of<ProfileProvider>(context, listen: false).setImage(img);
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Edit Photo', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showPicker(context);
        },
        child: const Icon(
          Icons.add_a_photo,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Hero(
          tag: 'Profile',
          child: CircleAvatar(
            radius: 50,
            backgroundImage: profileProvider.image != null
                ? MemoryImage(profileProvider.image!)
                : const AssetImage("assets/img/usericon.png") as ImageProvider,
          ),
        ),
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  Navigator.of(context).pop();
                  selectImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  selectImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
