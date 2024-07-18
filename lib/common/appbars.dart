import 'package:empapp/barrel.dart';

class EmpAppBarTheme {
  EmpAppBarTheme._();
  static final lightAppBarTheme = AppBarTheme(
    backgroundColor: mainCol,
    elevation: 0,
    iconTheme: IconThemeData(color: mainCol),
    titleTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  );
  static final darkAppBarTheme = AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: mainCol,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  );
}