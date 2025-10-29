import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_state.freezed.dart';

@freezed
class CalendarState with _$CalendarState {
  // начальная загрузка (например, при открытии экрана)
  const factory CalendarState.initial() = _Initial;

  // состояние, когда данные загружены и отображаются
  const factory CalendarState.loaded({
    required DateTime currentDateTime,
    DateTime? selectedDay,
    required double timeIndicatorOffset,
  }) = _Loaded;

  // состояние ошибки
  const factory CalendarState.error(String message) = _Error;
}

extension CalendarStateX on CalendarState {
  DateTime? get selectedDay => maybeMap(loaded: (l) => l.selectedDay, orElse: DateTime.now);
  double get timeIndicatorOffset => maybeMap(loaded: (l) => l.timeIndicatorOffset, orElse: () => 0);
  DateTime get currentDateTime => maybeMap(loaded: (l) => l.currentDateTime, orElse: DateTime.now);
}
