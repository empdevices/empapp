import 'package:empapp/barrel.dart';

class Statistics extends StatefulWidget {
  final Map<String, dynamic> statsEms;
  const Statistics({
    required this.statsEms,
    super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List<OrdinalData> ordinalDataList = [
    OrdinalData(domain: 'SO2', measure: 3, color: Colors.red),
    OrdinalData(domain: 'CO₂', measure: 9, color: mainCol),
    OrdinalData(
        domain: 'NOX',
        measure: 5,
        color: const Color.fromARGB(255, 214, 211, 0)),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.hardEdge,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: mainCol,
                          size: 8,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                         Text(
                          'CO2 : ${widget.statsEms['CO2']}.0kg',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.circle,
                          color: Colors.red,
                          size: 8,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'NOx : ${widget.statsEms['NOx']}.0kg',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.circle,
                          color: Color.fromARGB(255, 214, 211, 0),
                          size: 8,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'SO2 : ${widget.statsEms['SO2']}.0kg',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  child:  EmpPieChart(
                          statEms: widget.statsEms,
                          domain1: "SO2",
                          domain2: "CO₂",
                          domain3: "NOX",
                          measure1: 6,
                          measure2: 9,
                          measure3: 5),
                )
              ],
            )));
  }
}
