import 'package:empapp/barrel.dart';

class TipsBox extends StatefulWidget {
  final String heading;
  final String tip;

  const TipsBox(
      {required this.tip, required this.heading, super.key});

  @override
  State<TipsBox> createState() => _TipsBoxState();
}

class _TipsBoxState extends State<TipsBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            width: 130,
            height: 130,
            child: Image.asset(
              "assets/img/tips1.png",
            ),
          ),
          SizedBox(
            width: 190,
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.heading,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.tip,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
