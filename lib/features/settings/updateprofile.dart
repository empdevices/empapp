import 'package:empapp/barrel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:empapp/features/settings/picturedit.dart';
import 'dart:io';

class Updateprofile extends StatefulWidget {
  const Updateprofile({super.key});

  @override
  State<Updateprofile> createState() => _UpdateprofileState();
}

class _UpdateprofileState extends State<Updateprofile> {
  File? _image;

  Future<void> selectImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      File imageFile = File(image.path);

      // Await the completion of the profile picture update
      await UpdateService().updateProfilePicture(imageFile);

      setState(() {
        _image = File(image.path);
      });
    }
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(color: mainCol, Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  Navigator.of(context).pop();
                  selectImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.photo_camera,
                  color: mainCol,
                ),
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

  final User? user = FirebaseAuth.instance.currentUser;

  late bool defprofileboy;
  late bool defprofilegirl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc(user!.uid)
                .get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SingleChildScrollView(
                  child: Container(
                    height: 800,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }

              if (snapshot.hasError) {
                return SingleChildScrollView(
                  child: Container(
                    height: 800,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: const Center(
                      child: Text('Error fetching user details'),
                    ),
                  ),
                );
              }

              Map<String, dynamic> userData =
                  snapshot.data!.data() as Map<String, dynamic>;

              if (userData['gender'] == 'male') {
                defprofileboy = true;
                defprofilegirl = false;
              } else {
                defprofileboy = false;
                defprofilegirl = true;
              }
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Back',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 16),
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            '    Update Profile',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(flex: 2),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ProfilePhoto(),
                                  ),
                                );
                              },
                              child: _image != null
                                  ? CircleAvatar(
                                      radius: 80,
                                      backgroundImage: FileImage(_image!),
                                    )
                                  : userData['hasprofpic']
                                      ? CircleAvatar(
                                          radius: 80,
                                          backgroundImage: NetworkImage(
                                              userData['userimage']),
                                        )
                                      : CircleAvatar(
                                          radius: 80,
                                          backgroundImage: AssetImage(
                                            defprofilegirl
                                                ? "assets/img/userdefgirl.png"
                                                : "assets/img/userdefboy.png",
                                          ),
                                        ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0F0159),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    _showPicker(context);
                                  },
                                  child: const Center(
                                    child: Icon(
                                      Icons.mode_edit_outline,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Text(
                          'Full Name',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '   Full Name',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Text(
                          'Email',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '   Active Email Address',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Text(
                          'Number/Phone',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '   Phone Number',
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Center(
                          child:
                              AppButton(onPressed: () {}, buttonText: 'Save'))
                    ]),
              );
            }));
  }
}
