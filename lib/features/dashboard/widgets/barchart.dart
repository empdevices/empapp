import 'package:empapp/barrel.dart';
import 'package:intl/intl.dart';

class BarChat extends StatefulWidget {
  const BarChat({super.key});

  @override
  State<BarChat> createState() => _BarChatState();
}

class _BarChatState extends State<BarChat> {
  // Create a DateTime object
  late DateTime today = DateTime.now();

  // Format the DateTime object
  late String formattedDate = DateFormat('d MMMM yyyy').format(today);

  // Add suffix to the day
  String daySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  late String dayWithSuffix = '${today.day}${daySuffix(today.day)}';
  late String finalFormattedDate =
      '$dayWithSuffix ${DateFormat('MMMM, yyyy').format(today)}';

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  finalFormattedDate,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SmallAppButtonLight(
                  onPressed: () {
                    // navigate to login page
                  },
                  buttonText: 'Week',
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                SizedBox(
                  height: 220,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Bar(
                            date: finalFormattedDate,
                            height: 160,
                            label: 'Mon'),
                        Bar(date: finalFormattedDate, height: 80, label: 'Tue'),
                        Bar(
                            date: finalFormattedDate,
                            height: 160,
                            label: 'Wed'),
                        Bar(
                            date: finalFormattedDate,
                            height: 200,
                            label: 'Thr'),
                        Bar(
                            date: finalFormattedDate,
                            height: 110,
                            label: 'Fri'),
                        Bar(
                            date: finalFormattedDate,
                            height: 150,
                            label: 'Sat'),
                        Bar(
                            date: finalFormattedDate,
                            height: 180,
                            label: 'Sun'),
                      ]),
                ),
                const SizedBox(
                  height: 7,
                ),
              ],
            )
          ],
        ));
  }
}

class Bar extends StatelessWidget {
  final String date;
  final double height;
  final String label;

  const Bar({
    required this.date,
    required this.height,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void showBarPopup() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [EmpExitBtn()],
                  ),
                  const SizedBox(height: 20),
                  const CirclerIndicator(timeframe: 'Mon', weight: 30),
                  const SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        date,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "645KM Covered",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            color: mainCol,
                            size: 10,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "CO₂ : 14.5 g/km",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.red,
                            size: 10,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "NOX : 7.80 g/km",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            color: Color.fromARGB(255, 214, 211, 0),
                            size: 10,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "SO2 : 6.20 g/km",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 250,
                        height: 150,
                        child: EmpPieChart(
                            domain1: "SO2",
                            domain2: "CO₂",
                            domain3: "NOX",
                            measure1: 4,
                            measure2: 9,
                            measure3: 6),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      );
    }

    return GestureDetector(
      onTap: showBarPopup,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              height: height,
              width: 12,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: null),
          const SizedBox(
            height: 5,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
