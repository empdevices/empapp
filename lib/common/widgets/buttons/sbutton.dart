import 'package:empapp/barrel.dart';

class SmallAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const SmallAppButton(
      {required this.onPressed, required this.buttonText, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xFF0F0159),
        minimumSize: const Size(50, 25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
      onPressed: () {
        Navigator.of(context).push(
          PageTransition(
            type: PageTransitionType.size,
            alignment: Alignment.bottomCenter,
            childCurrent: this,
            duration: const Duration(milliseconds: 1000),
            reverseDuration: const Duration(milliseconds: 1000),
            child: const Details(),
          ),
        );
      },
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.white,
          fontWeight: FontWeight.w200,
        ),
      ),
    );
  }
}

class SmallAppButtonLight extends StatefulWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const SmallAppButtonLight(
      {super.key, required this.onPressed, required this.buttonText});

  @override
  State<SmallAppButtonLight> createState() => _SmallAppButtonLightState();
}

class _SmallAppButtonLightState extends State<SmallAppButtonLight> {
  String _dropdownValue = 'Week';
  final List<String> _items = ['Week', 'Month', 'Year'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: mainCol),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left:12.0, right: 6),
        child: DropdownButton<String>(
          value: _dropdownValue,
          borderRadius: BorderRadius.circular(10.0),
          underline: Container(),
          onChanged: (String? newValue) {
            setState(() {
              _dropdownValue = newValue!;
            });
          },
          items: _items.map<DropdownMenuItem<String>>((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
      ),
    );
  }
}
