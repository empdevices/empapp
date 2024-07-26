import 'package:empapp/barrel.dart';

class CirclerIndicator extends StatefulWidget {
  
  final String timeframe;
  final double weight;

  const CirclerIndicator({required this.timeframe, required this.weight, super.key});

  @override
  State<CirclerIndicator> createState() => _CirclerIndicatorState();
}

class _CirclerIndicatorState extends State<CirclerIndicator> {
  late final customWidth = CustomSliderWidths(
    trackWidth: 8,
    progressBarWidth: 8,
    shadowWidth: 1,
  );

  late final customColors = CustomSliderColors(
    trackColor: Colors.grey[200]!,
    progressBarColors: [Colors.green, Colors.red],
    shadowColor: Colors.white,
    shadowMaxOpacity: 0,
    shadowStep: 1,
  );

  late final info = InfoProperties(
    modifier: (double value) {
      final kgValue = value.toStringAsFixed(1);
      return '$kgValue kg';
    },
    mainLabelStyle: const TextStyle(
      fontSize: 42,
      fontWeight: FontWeight.bold,
      color: Colors.green,
    ),
    topLabelText: "Emissions",
    topLabelStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
    ),
    bottomLabelText: widget.timeframe,
    bottomLabelStyle: const TextStyle(
      fontSize: 16,
      color: Colors.black,
    ),
  );

  late final customAppearance = CircularSliderAppearance(
    infoProperties: info,
    customWidths: customWidth,
    customColors: customColors,
    startAngle: 270,
    angleRange: 360,
    size: 200,
  );

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      appearance: customAppearance,
      initialValue: widget.weight,
      min: 0,
      max: 100,
    );
  }
}
