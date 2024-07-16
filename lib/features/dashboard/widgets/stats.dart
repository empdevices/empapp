import 'package:empapp/barrel.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List<OrdinalData> ordinalDataList = [
    OrdinalData(domain: 'SO2', measure: 3, color: Colors.red),
    OrdinalData(domain: 'CO₂', measure: 9, color: mainCol),
    OrdinalData(domain: 'NOX', measure: 5, color: const Color.fromARGB(255, 214, 211, 0)),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: appGrey, width: 1
              ),
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
                        const Text(
                          "CO₂ : 14.5 g/km",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.red,
                          size: 8,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "NOX : 7.8 g/km",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          color: Color.fromARGB(255, 214, 211, 0),
                          size: 8,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "SO2 : 6.2 g/km",
                          style: TextStyle(
                            color: Colors.black,
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
                  child: Stack(
                    children: [
                      DChartPieO(
                        data: ordinalDataList,
                        customLabel: (ordinalData, index) {
                          return ordinalData.domain;
                        },
                        configRenderPie: ConfigRenderPie(
                          arcLabelDecorator: ArcLabelDecorator(
                            labelPosition: ArcLabelPosition.auto,
                            insideLabelStyle: const LabelStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            outsideLabelStyle: LabelStyle(
                              color: mainCol,
                              fontSize: 11,
                            ),
                            labelPadding: 10,
                            leaderLineStyle: const ArcLabelLeaderLineStyle(
                              color: Colors.yellow,
                              length: 7,
                              thickness: 1,
                            ),
                            showLeaderLines: true,
                          ),
                          arcLength: 2 * pi,
                          // arcRatio: 0.25,
                          arcWidth: 8,
                          startAngle: -pi / 2,
                          strokeWidthPx: 2,
                        ),
                      ),
                       Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                                  '30kg',
                                  style: TextStyle(
                                    color: mainCol,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                          ),
                            Center(
                              child: Text(
                                  'of emissions',
                                  style: TextStyle(
                                    color: mainCol,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                            ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
