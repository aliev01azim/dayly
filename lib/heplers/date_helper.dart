import 'package:intl/intl.dart';

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
}



bool isSameSlot(DateTime slotTime, DateTime sessionTime) {

  return slotTime.year == sessionTime.year &&
         slotTime.month == sessionTime.month &&
         slotTime.day == sessionTime.day &&
         slotTime.hour == sessionTime.hour &&
         slotTime.minute == sessionTime.minute;
}