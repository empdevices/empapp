import 'package:empapp/barrel.dart';

class EmpPopup extends StatelessWidget {
  final String message;
  final IconData icon;
  final Color iconColor;
  final String buttontext;

  const EmpPopup({
    super.key,
    required this.message,
    required this.icon,
    required this.iconColor,
    required this.buttontext,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor, size: 50),
          const SizedBox(height: 20),
          Text(
            message,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Center(
            child: AppButton(
              onPressed: () {
                Navigator.pop(context);
              },
              buttonText: buttontext,
            ),
          ),
        ],
      ),
    );
  }
}

void showEmpPopup({
  required BuildContext context,
  required String message,
  required IconData icon,
  required Color iconColor,
  required String buttontext,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return EmpPopup(
        message: message,
        icon: icon,
        iconColor: iconColor,
        buttontext: buttontext,
      );
    },
  );
}
