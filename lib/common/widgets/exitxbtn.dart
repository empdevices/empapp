import 'package:empapp/barrel.dart';

class EmpExitBtn extends StatelessWidget {

  const EmpExitBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Iconify(Iwwa.close, size: 16,),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
