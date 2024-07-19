import 'package:empapp/barrel.dart';
import 'package:empapp/features/settings/cookies.dart';
import 'package:empapp/features/settings/privacy.dart';
import 'package:empapp/features/settings/terms.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
        backgroundColor: Theme.of(context).colorScheme.primaryFixed,
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryFixed,
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Row(
            children: [
              Text(
                "Settings",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
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
                    const SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      leading: Iconify(
                          color: Theme.of(context).colorScheme.onPrimary,
                          Carbon.brightness_contrast),
                      title: const Text(
                        'Dark Mode',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      trailing: Switch(
                        value: Provider.of<ThemeProvider>(context).themeMode ==
                            ThemeMode.dark,
                        onChanged: (bool value) {
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme(value);
                        },
                        activeColor:
                            Colors.black, // Color of the switch when it is on
                        inactiveThumbColor:
                            Colors.black, // Color of the switch when it is off
                        activeTrackColor: Colors
                            .white, // Color of the track when switch is on
                        inactiveTrackColor: Colors
                            .white, // Color of the track when switch is off
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      leading: const Icon(Icons.star_border),
                      title: const Text(
                        'Rate App',
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
                      leading: const Icon(Icons.share_outlined),
                      title: const Text(
                        'Share App',
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
                        'Privacy Policy',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          PageTransition(
                            type: PageTransitionType.leftToRightWithFade,
                            childCurrent: this,
                            duration: const Duration(milliseconds: 400),
                            reverseDuration: const Duration(milliseconds: 400),
                            child: const Privacy(),
                          ),
                        ); // Handle privacy policy
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      leading: const Icon(Icons.description_outlined),
                      title: const Text(
                        'Terms and Conditions',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          PageTransition(
                            type: PageTransitionType.leftToRightWithFade,
                            childCurrent: this,
                            duration: const Duration(milliseconds: 400),
                            reverseDuration: const Duration(milliseconds: 400),
                            child: const Terms(),
                          ),
                        ); // Handle terms and conditions
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      leading: const Icon(Icons.cookie_outlined),
                      title: const Text(
                        'Cookies Policy',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          PageTransition(
                            type: PageTransitionType.leftToRightWithFade,
                            childCurrent: this,
                            duration: const Duration(milliseconds: 400),
                            reverseDuration: const Duration(milliseconds: 400),
                            child: Cookies(),
                          ),
                        ); // Handle cookies policy
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      leading: const Icon(Icons.mail_outline),
                      title: const Text(
                        'Contact',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      onTap: () {
                        // Handle contact
                      },
                    ),
                  ],
                ),
              ),
            ]),
          ),
        )
      ]),
    );
  }
}
