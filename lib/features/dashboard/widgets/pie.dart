import 'package:empapp/barrel.dart';

class EmpPieChart extends StatelessWidget {
  final String domain1;
  final String domain2;
  final String domain3;
  final double measure1;
  final double measure2;
  final double measure3;

  const EmpPieChart({
    super.key,
    required this.domain1,
    required this.domain2,
    required this.domain3,
    required this.measure1,
    required this.measure2,
    required this.measure3,
  });

  @override
  Widget build(BuildContext context) {
    List<OrdinalData> ordinalDataList = [
      OrdinalData(domain: domain1, measure: measure1, color: Colors.red),
      OrdinalData(domain: domain2, measure: measure2, color: mainCol),
      OrdinalData(
          domain: domain3,
          measure: measure3,
          color: const Color.fromARGB(255, 214, 211, 0)),
    ];
    return Stack(
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
                color: Theme.of(context).colorScheme.primary,
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
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Center(
              child: Text(
                'of emissions',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 8,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
