import 'package:empapp/barrel.dart';

class EmpAppTheme {
  EmpAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      // Light = MainColor | Dark = White
      primary: mainCol,

      // Light = Black | Dark = White
      onPrimary: Colors.black,

      // Light = MainColor | Dark = Black
      primaryFixed: mainCol,

      // Light = White | Dark = Black
      secondary: Colors.white,
    ),
    appBarTheme: EmpAppBarTheme.lightAppBarTheme,
    scaffoldBackgroundColor: mainCol,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    textTheme: EmpTextTheme.lightTextTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      primary: Color.fromARGB(255, 195, 195, 195),
      onPrimary: Color.fromARGB(255, 187, 187, 187),
      primaryFixed: Color.fromARGB(255, 39, 39, 39),
      secondary: Color.fromARGB(255, 60, 60, 60),
    ),
    appBarTheme: EmpAppBarTheme.darkAppBarTheme,
    scaffoldBackgroundColor: Color.fromARGB(96, 31, 31, 31),
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    textTheme: EmpTextTheme.darkTextTheme,
  );
}
