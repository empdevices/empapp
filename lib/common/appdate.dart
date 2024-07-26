import 'package:intl/intl.dart';

class EmpAppDate {
  final DateTime _date = DateTime.now();

  String _daySuffix(int day) {
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

  // Get the formatted date with suffix
  String getDate() {
    String dayWithSuffix = '${_date.day}${_daySuffix(_date.day)}';
    return '$dayWithSuffix ${DateFormat('MMMM, yyyy').format(_date)}';
  }
}
