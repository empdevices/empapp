import 'package:empapp/barrel.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    // Handle navigation based on index
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const DevicesHome()))
          .then((_) {
        setState(() {
          _selectedIndex = 0;
        });
      });
    } else if (index == 2) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Notifications()))
          .then((_) {
        setState(() {
          _selectedIndex = 0;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final customWidth = CustomSliderWidths(
      trackWidth: 8,
      progressBarWidth: 8,
      shadowWidth: 1,
    );

    final customColors = CustomSliderColors(
      trackColor: Colors.grey[200],
      progressBarColors: [Colors.green, Colors.red],
      shadowColor: Colors.white,
      shadowMaxOpacity: 00,
      shadowStep: 1,
    );

    final info = InfoProperties(
      modifier: (double value) {
        final kgValue = value.toStringAsFixed(1);
        return '$kgValue kg';
      },
      mainLabelStyle: const TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.bold,
        color: Colors.green,
      ),
      topLabelText: 'CO₂',
      topLabelStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bottomLabelText: 'Today',
      bottomLabelStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
    );

    final customAppearance = CircularSliderAppearance(
      customWidths: customWidth,
      customColors: customColors,
      infoProperties: info,
      startAngle: 270,
      angleRange: 360,
      size: 200,
    );

    return Scaffold(
      backgroundColor: const Color(0xFF0F0159),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
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
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {
                  // navigate to settings page
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: const BoxDecoration(),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Hello ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 25.0),
                            ),
                            Text(
                              'Admin',
                              style: TextStyle(
                                  color: appGreen,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 25.0),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Profile()),
                            );
                          },
                          child: Image.asset(
                            "assets/img/usericon.png",
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        'See your carbon footprint for today!',
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SleekCircularSlider(
                            appearance: customAppearance,
                            initialValue: 30,
                            min: 0,
                            max: 100,
                            onChange: (double value) {
                              // Callback providing a value while it's being changed (with a pan gesture)
                            },
                            onChangeEnd: (double value) {
                              // Callback providing a value when the user ends the change with a pan gesture
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 16.0),
                            child: Text(
                              'Good Job!',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SmallAppButtonLight(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Details()),
                          );
                        },
                        buttonText: "View Details"),
                    const Column(
                      children: [
                        SizedBox(height: 10),
                        GasBar(
                            gas: "CO₂",
                            time: "captured 2 minutes ago",
                            weight: "23.5kg"),
                        SizedBox(height: 20),
                        GasBar(
                            gas: "NOx",
                            time: "captured 2 minutes ago",
                            weight: "15.3kg"),
                        SizedBox(height: 20),
                        GasBar(
                            gas: "SO₂",
                            time: "captured 2 minutes ago",
                            weight: "2.8kg"),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const DeviceBox(),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          const Text(
                            'Tips for ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25.0),
                          ),
                          Text(
                            'Sustainability',
                            style: TextStyle(
                                color: appGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const TipsBox(
                        heading: "Green Route",
                        tip:
                            "Leave your car behind and take a greener route, walking, biking or public transport. Reduce emissions, save money, and stay fit on the go."),
                    const TipsBox(
                        heading: "Reduce, Reuse, Recycle",
                        tip:
                            "A simple mantra that encourages us to be mindful of our consumption habits and minimize waste by finding new uses for existing items"),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          const Text(
                            'Ads For ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25.0),
                          ),
                          Text(
                            'You',
                            style: TextStyle(
                                color: appGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        "assets/img/ad.png",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white, // Set your desired background color
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Iconify(MaterialSymbols.home_rounded),
            label: 'Home', // Remove label text
          ),
          BottomNavigationBarItem(
            icon: Iconify(MaterialSymbols.devices_other), // widget
            label: 'Devices', // Remove label text
          ),
          BottomNavigationBarItem(
            icon: Iconify(Cil.bell),
            label: 'Notifications', // Remove label text
          ),
        ],
      ),
    );
  }
}
