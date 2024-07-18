import 'package:empapp/barrel.dart';

class GasBar extends StatefulWidget {
  final String gas;
  final String time;
  final String weight;

  const GasBar(
      {required this.gas, required this.time, required this.weight, super.key});

  @override
  State<GasBar> createState() => _GasBarState();
}

class _GasBarState extends State<GasBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            width: 45,
            height: 45,
            child: Iconify(
              MdiLight.cloud,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: appGrey, width: 1)),
            ),
            width: 260,
            height: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.gas,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.time,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.weight,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 14,
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
