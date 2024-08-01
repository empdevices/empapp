import 'package:empapp/barrel.dart';

class HostMachine extends StatelessWidget {
  const HostMachine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const Dashboard(),
                      ),
                    );
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
                ),
              ),
              addHorSpace(10),
              const Text(
                '  Host Machine',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const Spacer(flex: 2),
            ],
          ),
          const SizedBox(
            height: 120,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Text(
              'Vehicle Brand',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'type here...',
                hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                border: UnderlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Text(
              'Vehicle Model',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'type here...',
                hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                border: UnderlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Text(
              'Registeration Number',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'type here...',
                hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                border: UnderlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(height: 120),
          Center(
            child: AppButton(
              onPressed: () {
                showEmpPopup(
                    context: context,
                    onPressed: () {
                      // push replacement to dashboard
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const Dashboard()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    message: 'Adding Host \nRestricted.',
                    icon: Icons.dangerous,
                    iconColor: Colors.red,
                    buttontext: 'Continue');
              },
              buttonText: 'Confirm',
            ),
          ),
        ]),
      ),
    );
  }
}
