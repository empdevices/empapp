import 'package:empapp/barrel.dart';
import 'package:intl/intl.dart';

class BarChat extends StatefulWidget {
  final Map<String, dynamic> barchartEms;

  final String currentday;
  final Function(String) inFunction;
  const BarChat(
      {required this.barchartEms,
      required this.inFunction,
      required this.currentday,
      super.key});

  @override
  State<BarChat> createState() => _BarChatState();
}

class _BarChatState extends State<BarChat> {
  String? selectedLabel;
  late DateTime today = DateTime.now();

  void onBarTap(String label) {
    setState(() {
      selectedLabel = label;
    });
    widget.inFunction(label);
  }

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
                  widget.currentday == 'mon'
                      ? 'Monday'
                      : widget.currentday == 'tue'
                          ? 'Tuesday'
                          : widget.currentday == 'wed'
                              ? 'Wednesday'
                              : widget.currentday == 'thu'
                                  ? 'Thursday'
                                  : widget.currentday == 'fri'
                                      ? 'Friday'
                                      : widget.currentday == 'sat'
                                          ? 'Saturday'
                                          : 'Sunday',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SmallAppButtonLight(
                  onPressed: () {
                    // navigate to login page
                  },
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
                            isSelected: widget.currentday == 'mon',
                            barColor: mainCol,
                            onTap: widget.inFunction,
                            height: (widget.barchartEms['mon']['total'] * 2).toDouble(),
                            label: 'Mon'),
                        Bar(
                            isSelected: widget.currentday == 'tue',
                            barColor: mainCol,
                            onTap: widget.inFunction,
                            height: (widget.barchartEms['tue']['total'] * 2).toDouble(),
                            label: 'Tue'),
                        Bar(
                            isSelected: widget.currentday == 'wed',
                            barColor: mainCol,
                            onTap: widget.inFunction,
                            height: (widget.barchartEms['wed']['total'] * 2).toDouble(),
                            label: 'Wed'),
                        Bar(
                            isSelected: widget.currentday == 'thu',
                            barColor: mainCol,
                            onTap: widget.inFunction,
                            height: (widget.barchartEms['thu']['total'] * 2).toDouble(),
                            label: 'Thu'),
                        Bar(
                            isSelected: widget.currentday == 'fri',
                            barColor: mainCol,
                            onTap: widget.inFunction,
                            height: (widget.barchartEms['fri']['total'] * 2).toDouble(),
                            label: 'Fri'),
                        Bar(
                            isSelected: widget.currentday == 'sat',
                            barColor: mainCol,
                            onTap: widget.inFunction,
                            height: (widget.barchartEms['sat']['total'] * 2).toDouble(),
                            label: 'Sat'),
                        Bar(
                            isSelected: widget.currentday == 'sun',
                            barColor: mainCol,
                            onTap: widget.inFunction,
                            height: (widget.barchartEms['sun']['total'] * 2).toDouble(),
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

class Bar extends StatefulWidget {
  final double height;
  final String label;
  final Color barColor;
  final Function(String) onTap;
  final bool isSelected; // New property to indicate if the bar is selected

  const Bar({
    required this.barColor,
    required this.onTap,
    required this.height,
    required this.label,
    required this.isSelected, // Initialize the new property
    super.key,
  });

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap(widget.label.toLowerCase());
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: widget.height,
            width: 15,
            decoration: BoxDecoration(
              color: widget.isSelected ? Colors.purple : widget.barColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: widget.isSelected ? Colors.purple : widget.barColor,
                width: 2.0,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.label,
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
