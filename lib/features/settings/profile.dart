import 'package:empapp/barrel.dart';
import 'package:empapp/features/authentication/utils/provider.dart';
import 'package:empapp/features/settings/updateprofile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, // Set your desired color here
          ),
          title: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Emission Pulse',
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
          ),
          backgroundColor: Theme.of(context)
              .colorScheme
              .primaryFixed, // Setting the background color
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryFixed,
        body: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: profileProvider.image != null
                      ? MemoryImage(profileProvider.image!)
                      : const AssetImage("assets/img/usericon.png")
                          as ImageProvider,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "The Admin",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    Text("admin@gmail.com",
                        style: TextStyle(color: Colors.white)),
                    Text("Admin City", style: TextStyle(color: Colors.white)),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListView(
                        padding: const EdgeInsets.all(16.0),
                        children: [
                          ListTile(
                            leading: const Icon(Icons.edit),
                            title: const Text(
                              'Edit Profile',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Updateprofile()),
                              ); // Handle notifications settings
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SwitchListTile(
                            secondary: const Icon(Icons.notifications_on),
                            title: const Text(
                              'Push Notifications',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            value:
                                false, // Replace with the current value from your app's state
                            onChanged: (bool value) {
                              showEmpPopup(
                                  context: context,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  message: 'Feature not\nactive.',
                                  icon: Icons.dangerous,
                                  iconColor: Colors.red,
                                  buttontext: 'Continue');
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ListTile(
                            leading: const Icon(Icons.star_border),
                            title: const Text(
                              'Archievments',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            onTap: () {
                              showEmpPopup(
                                  context: context,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  message: 'Feature not\nactive.',
                                  icon: Icons.dangerous,
                                  iconColor: Colors.red,
                                  buttontext: 'Continue');
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ListTile(
                            leading: const Icon(Icons.cyclone_rounded),
                            title: const Text(
                              'App Usage',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            onTap: () {
                              showEmpPopup(
                                  context: context,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  message: 'Feature not\nactive.',
                                  icon: Icons.dangerous,
                                  iconColor: Colors.red,
                                  buttontext: 'Continue');
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ListTile(
                            leading: const Icon(Icons.lock_outline),
                            title: const Text(
                              'Change Password',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            onTap: () {
                              showEmpPopup(
                                  context: context,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  message: 'Feature not\nactive.',
                                  icon: Icons.dangerous,
                                  iconColor: Colors.red,
                                  buttontext: 'Continue');
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ListTile(
                            leading: const Icon(Icons.description_outlined),
                            title: const Text(
                              'FeedBack',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            onTap: () {
                              showEmpPopup(
                                  context: context,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  message: 'Feature not\nactive.',
                                  icon: Icons.dangerous,
                                  iconColor: Colors.red,
                                  buttontext: 'Continue');
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ListTile(
                            leading: const Icon(Icons.delete),
                            title: const Text(
                              'Delete Account',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            onTap: () {
                              showEmpPopup(
                                  context: context,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  message: 'Feature not\nactive.',
                                  icon: Icons.dangerous,
                                  iconColor: Colors.red,
                                  buttontext: 'Continue');
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ListTile(
                            leading: const Icon(Icons.logout_outlined),
                            title: const Text(
                              'log Out',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            onTap: () {
                              // Navigate to logout screen
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Logout()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ])))
        ]));
  }
}
