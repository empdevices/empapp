import 'package:empapp/barrel.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appGreen,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, // Set your desired color here
          ),
          title: const Padding(
            padding: EdgeInsets.all(40.0),
            child: Text(
              'Emissions - 30kg',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
          backgroundColor: appGreen, // Setting the background color
          actions: [
            IconButton(
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
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              "assets/icons/smiley.png",
            ),
            const SizedBox(height: 10),
            const Text(
              'Good',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'You have done a great job with keeping your footprint low',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              decoration:  BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        'See your carbon footprint for today!',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14.0),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CirclerIndicator(timeframe: 'Today', weight: 30),
                          Padding(
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
                    const SizedBox(
                      height: 20,
                    ),
                    const BarChat(),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          const Text(
                            'Test ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25.0),
                          ),
                          Text(
                            'Details',
                            style: TextStyle(
                                color: appGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Column(
                      children: [
                        GasBar(
                            gas: "CO₂",
                            time: "Captured 2 minutes ago",
                            weight: "14.6kg"),
                        SizedBox(height: 20),
                        GasBar(
                            gas: "NOx",
                            time: "Captured 2 minutes ago",
                            weight: "7.8kg"),
                        SizedBox(height: 20),
                        GasBar(
                            gas: "SO₂",
                            time: "Captured 2 minutes ago",
                            weight: "6.2kg"),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          const Text(
                            'Your ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25.0),
                          ),
                          Text(
                            'Statistics',
                            style: TextStyle(
                                color: appGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Statistics(),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
