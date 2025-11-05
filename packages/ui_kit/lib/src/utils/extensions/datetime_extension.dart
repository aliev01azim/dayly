import 'package:intl/intl.dart';

bool isSameSlot(DateTime slotTime, DateTime sessionTime) {
  return slotTime.year == sessionTime.year &&
      slotTime.month == sessionTime.month &&
      slotTime.day == sessionTime.day &&
      slotTime.hour == sessionTime.hour &&
      slotTime.minute == sessionTime.minute;
}

extension DateTimeExtension on DateTime {
  bool isTheSameDayWith(DateTime another) {
    final thisFormatted = DateTime(year, month, day);
    final anotherFormatted = DateTime(another.year, another.month, another.day);
    return thisFormatted.isAtSameMomentAs(anotherFormatted);
  }

  String get hourReadable {
    return DateFormat('HH:mm', 'ru').format(this);
  }

  String get dme {
    return DateFormat('d MMMM, E', 'ru').format(this);
  }

  bool isTheSameMonthWith(DateTime another) {
    final thisFormatted = DateTime(year, month);
    final anotherFormatted = DateTime(another.year, another.month);
    return thisFormatted.isAtSameMomentAs(anotherFormatted);
  }

  String get dayOfWeekShort {
    return DateFormat('E').format(this);
  }

  String get monthReadable {
    return DateFormat('LLLL yyyy').format(this);
  }

  String get forBackendRange {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String get monthOnlyReadable {
    return DateFormat('LLLL').format(this);
  }

  String get dayAndmonthReadable {
    return DateFormat('d MMMM').format(this);
  }

  String get dayMonthAndTimeReadable {
    return DateFormat('d MMMM в HH:mm').format(this);
  }

  int get numberOfDaysInMonth {
    if (month == DateTime.february) {
      final bool isLeapYear = (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      return isLeapYear ? 29 : 28;
    }
    const List<int> daysInMonth = <int>[31, -1, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    return daysInMonth[month - 1];
  }

  List<DateTime> get getDaysOfWeek {
    final firstDayOfWeek = subtract(Duration(days: weekday - 1));

    final daysOfWeek = <DateTime>[];

    for (int i = 0; i < 7; i++) {
      final day = firstDayOfWeek.add(Duration(days: i));
      daysOfWeek.add(day);
    }

    return daysOfWeek;
  }

  List<DateTime> get getDaysOfMonth {
    final daysOfMonth = <DateTime>[];
    final firstDayOfMonth = DateTime(year, month, 1);

    for (int i = 0; i < numberOfDaysInMonth; i++) {
      final day = firstDayOfMonth.add(Duration(days: i));
      daysOfMonth.add(day);
    }

    return daysOfMonth;
  }

  Map<int, List<DateTime>> get getYearMonths {
    final map = <int, List<DateTime>>{};
    int monthNumber = 1;

    while (monthNumber <= 12) {
      final listOfDays = <DateTime>[];

      final month = DateTime(year, monthNumber);
      final daysOfMonth = month.getDaysOfMonth;
      listOfDays.addAll(daysOfMonth);

      final daysOfFirstWeek = listOfDays.first.getDaysOfWeek;
      final daysOfLastWeek = listOfDays.last.getDaysOfWeek;
      final insertingDays = daysOfFirstWeek.where((day) => day.month != monthNumber);
      final appendingDays = daysOfLastWeek.where((day) => day.month != monthNumber);

      listOfDays.insertAll(0, insertingDays);
      listOfDays.addAll(appendingDays);

      map[monthNumber] = listOfDays;
      monthNumber++;
    }

    return map;
  }
}
