import 'dart:typed_data';
import 'package:empapp/features/authentication/utils/imagepicker.dart';
import 'package:empapp/features/authentication/utils/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:empapp/barrel.dart';

class ProfilePhoto extends StatefulWidget {
  const ProfilePhoto({super.key});

  @override
  State<ProfilePhoto> createState() => _ProfilePhotoState();
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
      body: Center(
        child: 
        // Full profile image
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: profileProvider.image != null
                  ? MemoryImage(profileProvider.image!)
                  : const AssetImage('assets/img/userdefboy.png') as ImageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

}
