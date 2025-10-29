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
          Expanded(
            child: Stack(children: [_DaysPageView(), _LoadingIndicator(), BackToCurrentDayButtons(), OpacityOverlay()]),
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
      child: Align(child: CircularProgressIndicator(color: MainPalette.blue)),
    );
  }
}

class _DaysPageView extends StatelessWidget {
  const _DaysPageView();

  @override
  Widget build(BuildContext context) {
    final day = context.select<CalendarCubit, DateTime>((cubit) => cubit.state.selectedDay ?? DateTime.now());
    return DayTimeLine(day);
  }
}
