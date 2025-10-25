import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_dayly/widgets/day_timeline.dart';

class CalendarController extends GetxController {
  final Rx<DateTime> _currentDateTime = DateTime.now().obs;
  DateTime get currentDateTime => _currentDateTime.value;

  final RxDouble _timeIndicatorOffset = 0.0.obs;
  double get timeIndicatorOffset => _timeIndicatorOffset.value;

  late final Rx<DateTime> selectedDayObs = DateTime.now().obs;
  DateTime get selectedDay => selectedDayObs.value;

  late final Rx<DateTime> _selectedYear = DateTime.now().obs;
  DateTime get selectedYear => _selectedYear.value;
  set selectedYear(DateTime year) => _selectedYear.value = year;

  late PageController pageContoller;

  late Timer currentDateTimeTimer;

  @override
  void onInit() {
    _timeIndicatorOffset.value = _getIndicatorOffset;

    currentDateTimeTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _currentDateTime.value = DateTime.now();
      _timeIndicatorOffset.value = _getIndicatorOffset;
    });
    pageContoller = PageController(viewportFraction: 0.9);
    super.onInit();
  }

  @override
  void onClose() async {
    currentDateTimeTimer.cancel();
    super.onClose();
  }

  void setDate(DateTime day) {
    selectedDayObs.value = day;
    pageContoller = PageController(initialPage: selectedDayObs.value.day - 1);
  }

  void jumpToCurrentDay() {
    selectedDayObs.value = currentDateTime;
    pageContoller.jumpToPage(selectedDayObs.value.day - 1);
  }

  double get _getIndicatorOffset {
    final total =
        (_currentDateTime.value.hour - startDay) * hourSectorHeight +
        (_currentDateTime.value.minute * 1.6) -
        8 +
        (hourSectorHeight / 4 * 3); //корректировка на верхний отступ из-за UserHeader
    return total.toDouble();
  }
}
