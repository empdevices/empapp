import 'package:empapp/barrel.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
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
          backgroundColor: mainCol, // Setting the background color
        ),
        backgroundColor: const Color(0xFF0F0159),
        body: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: Row(
              children: [
                Image.asset(
                  "assets/img/usericon.png",
                  width: 90,
                  height: 90,
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
                    Text("theuser@gmail.com",
                        style: TextStyle(color: Colors.white)),
                    Text("User City",
                        style: TextStyle(color: Colors.white)),
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
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
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
                              // Handle notifications settings
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
                              // Handle dark mode toggle
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
                              // Handle app rating
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
                              // Handle app sharing
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
                              // Handle privacy policy
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
                              // Handle terms and conditions
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
                              // Handle cookies policy
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigate to logout screen
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Logout()));
                            },
                            child: ListTile(
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
                          ),
                        ],
                      ),
                    ),
                  ])))
        ]));
  }
}
