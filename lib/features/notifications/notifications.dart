import 'package:empapp/barrel.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryFixed,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: const Text(
            'Emission Pulse',
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w300,
                color: Colors.white),
          ),
          backgroundColor: Theme.of(context).colorScheme.primaryFixed,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
                },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding:  EdgeInsets.only(left:20.0),
              child: Text(
                'Notifications',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: const SingleChildScrollView(
                  child: Column(
                children: [
                  NotifBar(
                      heading: 'Account Created Successfully',
                      subheading: 'You have succesfully created and logged into your account',
                      icon: Icons.check_circle,
                      btnType: 'success',
                  ),
                  NotifBar(
                      heading: 'Device Connection Unsuccessful',
                      subheading: 'Your device was unable to connect to the server',
                      icon: Icons.error,
                      btnType: 'danger',
                  ),
                  NotifBar(
                      heading: 'Your Eco Profile is Ready',
                      subheading: 'Your Eco Profile has been created and is ready for use',
                      icon: Icons.eco,
                      btnType: 'info',
                  ),
                  
                ]
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
