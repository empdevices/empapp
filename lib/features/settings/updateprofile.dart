import 'package:empapp/barrel.dart';
import 'package:empapp/features/authentication/utils/provider.dart';
import 'package:empapp/features/settings/picturedit.dart';

class Updateprofile extends StatefulWidget {
  const Updateprofile({super.key});

  @override
  State<Updateprofile> createState() => _UpdateprofileState();
}

class _UpdateprofileState extends State<Updateprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                '    Update Profile',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
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
                Consumer<ProfileProvider>(
                  builder: (context, profileProvider, child) {
                    return CircleAvatar(
                      radius: 64,
                      backgroundImage: profileProvider.image != null
                          ? MemoryImage(profileProvider.image!)
                          : const AssetImage("assets/img/usericon.png")
                              as ImageProvider,
                    );
                  },
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F0159),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 6,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePhoto(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.mode_edit_outline,
                      color: Colors.white,
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
            height: 250,
          ),
          Center(child: AppButton(onPressed: () {}, buttonText: 'Save'))
        ]),
      ),
    );
  }
}
