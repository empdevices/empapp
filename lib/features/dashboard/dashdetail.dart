import 'package:empapp/barrel.dart';

class Details extends StatefulWidget {
  final Map<String, dynamic> empuser;
  final String daysPerformance; 
  const Details({
    required this.daysPerformance,
    required this.empuser, super.key});

  @override
  State<Details> createState() => DetailsState();
}

class DetailsState extends State<Details> {
  Map<String, dynamic>? currEmission;
  String appday = 'fri';
  late Color emotionColor;
  late String emotionLabel;
  late String emotiontext;
  late String emotionImg;

  @override
  void initState() {
    super.initState();
    reFetchEmission(appday);
  }

  Future<void> reFetchEmission(String day) async {
    setState(() {
      appday = day;
      currEmission = widget.empuser['userems'][day];
      if (widget.empuser['userems'][appday]['total'] < 25) {
        emotionColor = Colors.green;
        emotionLabel = 'Good';
        emotiontext =
            'You have done a great job with keeping your footprint low';
        emotionImg = 'assets/icons/good.png';
      } else if (widget.empuser['userems'][appday]['total'] < 50) {
        emotionColor = Colors.yellow;
        emotionLabel = 'Fair';
        emotiontext =
            'You tried to keep your footprint low, but there is room for improvement';
        emotionImg = 'assets/icons/fair.png';
      } else {
        emotionColor = Colors.red;
        emotionLabel = 'Poor';
        emotiontext = 'You have a high carbon footprint, you need to reduce it';
        emotionImg = 'assets/icons/poor.png';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: emotionColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, // Set your desired color here
          ),
          title: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text(
              'Emissions - ${currEmission?['total']}kg',
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
          backgroundColor: emotionColor, // Setting the background color
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
              emotionImg,
            ),
            const SizedBox(height: 10),
            Text(
              emotionLabel,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                emotiontext,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              decoration: BoxDecoration(
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
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CirclerIndicator(
                              timeframe: 'kg/day',
                              weight: currEmission?['total'].toDouble()),
                           Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Text(
                              widget.daysPerformance,
                              style: const TextStyle(
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
                    BarChat(inFunction: reFetchEmission, currentday: appday , barchartEms: widget.empuser['userems']),
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
                    Column(
                      children: [
                        GasBar(
                            gas: "CO₂",
                            time: "Captured 1 minute ago",
                            weight:
                                '${currEmission?['CO2']}.0kg'),
                        const SizedBox(height: 20),
                        GasBar(
                            gas: "NOx",
                            time: "Captured 4 days ago",
                            weight:
                                '${currEmission?['NOx']}.0kg'),
                        const SizedBox(height: 20),
                        GasBar(
                            gas: "SO₂",
                            time: "Captured 35 days ago",
                            weight:
                                '${currEmission?['SO2']}.0kg'),
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
                    Statistics(statsEms: currEmission!),
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