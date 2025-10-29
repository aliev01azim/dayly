import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/configs/calendar_config.dart';
import 'package:presentation/src/screens/home/blocs/calendar/calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(const CalendarState.initial()) {
    _onCreate();
  }
  late final Timer _timer;

  void _onCreate() {
    initTimes( DateTime.now());
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
     initTimes(state.selectedDay);
    });
  }

  void initTimes(DateTime? selectedDay ) {
     final now = DateTime.now();
    emit(
      CalendarState.loaded(currentDateTime: now, timeIndicatorOffset: _calculateIndicatorOffset(now), selectedDay: selectedDay),
    );
  }

  double _calculateIndicatorOffset(DateTime currentTime) {
    final total =
        (currentTime.hour - CalendarConfig.startDay) * CalendarConfig.hourSectorHeight +
        (currentTime.minute * 1.6) -
        8 +
        (CalendarConfig.hourSectorHeight / 4 * 3); //корректировка на верхний отступ из-за UserHeader
    return total.toDouble();
  }

  void setDate(DateTime day) {
    state.mapOrNull(
      loaded: (s) {
        emit(s.copyWith(selectedDay: day));
      },
    );
  }

  void jumpToCurrentDay() {
    final now = DateTime.now();
    state.mapOrNull(
      loaded: (s) {
        emit(s.copyWith(selectedDay: now));
      },
    );
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
