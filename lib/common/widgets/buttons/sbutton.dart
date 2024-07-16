import 'package:empapp/barrel.dart';

class SmallAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const SmallAppButton({required this.onPressed, required this.buttonText, super.key});

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Details()),
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

class SmallAppButtonLight extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const SmallAppButtonLight({required this.onPressed, required this.buttonText, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: mainCol),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Row(
            children: [
              Text(
                buttonText,
                style: TextStyle(
                  color: mainCol,
                  fontSize: 13,
                  fontWeight: FontWeight.w200,
                ),
              ),
              const SizedBox(width: 20),
               Icon(
                Icons.arrow_drop_down,
                color: mainCol,
                size: 15,
              ),
            ],
          ),
      ),
    );
  }
}
