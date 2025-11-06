import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/screens/home/blocs/calendar/calendar_cubit.dart';
import 'package:presentation/src/screens/home/blocs/calendar/calendar_state.dart';
import 'package:presentation/src/screens/home/blocs/users/users_cubit.dart';
import 'package:presentation/src/screens/home/blocs/users/users_state.dart';
import 'package:presentation/src/screens/home/widgets/btns/buttons.dart';
import 'package:presentation/src/screens/home/widgets/timeline/day_timeline.dart';
import 'package:ui_kit/ui_kit.dart';

class DayView extends StatelessWidget {
  const DayView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          _DaysListView(),

          Expanded(
            child: Stack(children: [DaysPageView(), _LoadingIndicator(), BackToCurrentDayButtons(), OpacityOverlay()]),
          ),
        ],
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<UsersCubit, bool>((cubit) => cubit.state.isLoading);

    if (!isLoading) {
      return const SizedBox();
    }
    return const IgnorePointer(
      child: Align(child: CircularProgressIndicator(color: MainPalette.main)),
    );
  }
}

class _DaysListView extends StatelessWidget {
  const _DaysListView();

  @override
  Widget build(BuildContext context) {
    final currentDateTime = DateTime.now();
    final selectedday = context.select<CalendarCubit, DateTime>((cubit) => cubit.state.selectedDay ?? DateTime.now());
    final daysOfWeek = selectedday.getDaysOfWeek;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          ...List.generate(daysOfWeek.length, (index) {
            final day = daysOfWeek[index];

            return Expanded(
              child: _DayListItem(
                isCurrentDay: day.isTheSameDayWith(currentDateTime),
                isSelectedDay: day.isTheSameDayWith(selectedday),
                day: day,
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _DayListItem extends StatelessWidget {
  const _DayListItem({required this.isCurrentDay, required this.isSelectedDay, required this.day});

  final bool isCurrentDay;
  final bool isSelectedDay;
  final DateTime day;

  @override
  Widget build(BuildContext context) {
    final isWeekend = day.weekday == 6 || day.weekday == 7;
    final textColor = isCurrentDay && isSelectedDay
        ? MainPalette.backgroundButtonPrimaryDisabled
        : (isCurrentDay
              ? MainPalette.orange
              : (isSelectedDay
                    ? MainPalette.backgroundButtonPrimaryDisabled
                    : (isWeekend ? MainPalette.auroMetalSaurusColor : null)));

    final selectedDay = context.select<CalendarCubit, DateTime>((cubit) => cubit.state.selectedDay ?? DateTime.now());

    final belongsToCurrentMonth = day.isTheSameMonthWith(selectedDay);

    if (!belongsToCurrentMonth) {
      return const SizedBox();
    }

    return GestureDetector(
      onTap: () async {},
      child: Column(
        children: [
          Text(
            day.dayOfWeekShort,
            style: TextStyle(
              fontSize: 13,
              fontFamily: 'Nexa',
              fontWeight: FontWeight.w400,
              color: isCurrentDay ? MainPalette.orange : MainPalette.auroMetalSaurusColor,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 30,
            width: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: isSelectedDay ? MainPalette.orange : null,
              border: Border.all(color: isCurrentDay ? MainPalette.orange : Colors.transparent),
            ),
            child: Text(
              '${day.day}',
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                height: 1.28,
                fontFamily: 'Nexa',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
