import 'package:empapp/barrel.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  // A list of user data from firebase firestore
  final List<Map<String, dynamic>> userData = [
    {
      'name': 'Admin',
      'email': 'admin@gmail.com',
      'phone': '+233276801066',
      'hasprofpic': false,
      'userpicture': 'assets/img/usericon.png',
      'gender': 'female'
    },
  ];

  late bool defprofileboy;
  late bool defprofilegirl;

  @override
  void initState() {
    super.initState();
    if (userData[0]['hasprofpic'] == true) {
      defprofileboy = false;
      defprofilegirl = false;
  } else if (userData[0]['gender'] == 'male') {
      defprofileboy = true;
      defprofilegirl = false;
    } else {
      defprofileboy = false;
      defprofilegirl = true;
    }
    updateSharedPrefs();
  }

  // update shared preferences
  void updateSharedPrefs() async {
    SharedPreferences logindata = await SharedPreferences.getInstance();
    logindata.setBool('login', false);
  }

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
      topLabelText: 'Emission',
      topLabelStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
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
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                              userData[0]['name'],
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
                            defprofilegirl
                                ? "assets/img/userdefgirl.png"
                                : defprofileboy
                                    ? "assets/img/userdefboy.png"
                                    : "assets/img/usericon.png",
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          'See your carbon footprint for today!',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 14.0),
                        ),
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
                    Padding(
                      padding: const EdgeInsets.only(right:40.0),
                      child: SmallAppButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Details()),
                            );
                          },
                          buttonText: "View Details"),
                    ),
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
