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
      primary: Colors.white,
      onPrimary: Colors.white,
      primaryFixed: Colors.black,
      secondary: Colors.black,
    ),
    appBarTheme: EmpAppBarTheme.darkAppBarTheme,
    scaffoldBackgroundColor: Colors.black38,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    textTheme: EmpTextTheme.darkTextTheme,
  );
}
