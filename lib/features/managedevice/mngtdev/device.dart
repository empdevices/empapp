import 'package:empapp/barrel.dart';

class Device extends StatefulWidget {
  const Device({super.key});

  @override
  State<Device> createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  void _showDeletePopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.dangerous, color: Colors.red, size: 50),
              const SizedBox(height: 20),
              const Text(
                'You are deleting the device \nCarbon EX 500\n from your account!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Center(
                child: AppButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  buttonText: 'Confirm',
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDisconectPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error, color: Colors.orange, size: 50),
              const SizedBox(height: 20),
              const Text(
                'Emission readinf from \nCarbon EX 500\n will be turned off!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Center(
                child: AppButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  buttonText: 'Confirm',
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryFixed,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, // Set your desired color here
          ),
          title: const Text(
            'Emission Pulse',
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w300,
                color: Colors.white),
          ),
          backgroundColor: Theme.of(context)
              .colorScheme
              .primaryFixed, // Setting the background color
          actions: [
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  const DeviceBox(),
                  const Text(
                    '38',
                    style: TextStyle(
                      fontSize: 120,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    'days',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: appGrey),
                          width: double.infinity,
                          height: 60,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: appGreen),
                          width: 60,
                          height: 60,
                        ),
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Text(
                              'Health',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Actions',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showEmpPopup(
                              context: context,
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              message: 'Action not\nallowed.',
                              icon: Icons.dangerous,
                              iconColor: Colors.red,
                              buttontext: 'Continue');
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: appGrey),
                            width: 120,
                            height: 50,
                            child: const Icon(
                                color: Colors.black,
                                Icons.change_circle)),
                      ),
                      GestureDetector(
                        onTap: () {
                          showEmpPopup(
                              context: context,
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              message: 'Action not\nallowed.',
                              icon: Icons.dangerous,
                              iconColor: Colors.red,
                              buttontext: 'Continue');
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: appGrey),
                            width: 120,
                            height: 50,
                            child: const Icon(
                                color: Colors.black,
                                Icons.delete_forever)),
                      ),
                    ],
                  )
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
