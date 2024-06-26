import 'package:empapp/barrel.dart';
import 'package:empapp/features/managedevice/mngtdev/devhome.dart';
import 'package:empapp/features/settings/settings.dart';

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
      trackWidth: 10,
      progressBarWidth: 13,
      shadowWidth: 20,
    );

    final customColors = CustomSliderColors(
      trackColor: Colors.grey,
      progressBarColors: [const Color.fromARGB(255, 179, 78, 78), Colors.cyan],
      shadowColor: Colors.black,
      shadowMaxOpacity: 0.2,
      shadowStep: 10,
    );

    final info = InfoProperties(
      topLabelText: 'CO₂',
      topLabelStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bottomLabelText: 'Today',
      bottomLabelStyle: const TextStyle(
        fontSize: 20,
        color: Colors.green,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Text(
                    "Emp App",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 250,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
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
                                  fontWeight: FontWeight.bold, fontSize: 25.0),
                            ),
                            Text(
                              'Grace',
                              style: TextStyle(
                                  color: appGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0),
                            ),
                          ],
                        ),
                        Image.asset(
                          "assets/icons/user.png",
                          fit: BoxFit.cover,
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
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 40.0),
                          child: SmallAppButton(
                            onPressed: () {
                              // navigate to login page
                            },
                            buttonText: 'View Details',
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        SizedBox(height: 60),
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
                    Image.asset(
                      "assets/img/ad.png",
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
