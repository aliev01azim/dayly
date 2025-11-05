import 'dart:math';

import 'package:core_api/core_api.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/configs/calendar_config.dart';
import 'package:presentation/src/screens/home/blocs/calendar/calendar_cubit.dart';
import 'package:presentation/src/screens/home/blocs/calendar/calendar_state.dart';
import 'package:presentation/src/screens/home/blocs/users/users_cubit.dart';
import 'package:presentation/src/screens/home/blocs/users/users_state.dart';
import 'package:presentation/src/screens/home/widgets/current_time_indicator.dart';
import 'package:presentation/src/screens/home/widgets/timeline/timeline_grid.dart';
import 'package:presentation/src/screens/home/widgets/timeline/timeline_hour.dart';
import 'package:presentation/src/screens/home/widgets/user_header.dart';
import 'package:ui_kit/ui_kit.dart';

class DayTimeLine extends StatefulWidget {
  const DayTimeLine(this.day, {super.key});

  final DateTime day;

  @override
  State<DayTimeLine> createState() => _DayTimeLineState();
}

class _DayTimeLineState extends State<DayTimeLine> with SingleTickerProviderStateMixin {
  late final ScrollController scrollController;
  late final PageController pageController;

  @override
  void initState() {
    scrollController = ScrollController();
    pageController = PageController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Future.delayed(const Duration(milliseconds: 400), _scrollToCurrentTime),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    pageController.dispose();
    super.dispose();
  }

  void _scrollToCurrentTime() {
    final now = DateTime.now();

    /// если сейчас - не сегодня и входит в начало и конец дня
    final needScrollToCurrentTime =
        now.isTheSameDayWith(widget.day) && (now.hour >= CalendarConfig.startDay && now.hour <= CalendarConfig.endDay);

    if (!needScrollToCurrentTime) {
      return;
    }

    /// на глаз высчитано, чтобы индикатор был чуть выше центра экрана
    final timeIndicatorOffset = context.read<CalendarCubit>().state.maybeMap(
      loaded: (value) => value.timeIndicatorOffset,
      orElse: () => 0,
    );
    final double offset = timeIndicatorOffset - 116;

    final double offsetToZero = max(offset, 0);
    final double maxExtent = scrollController.position.maxScrollExtent;
    final double initial = min(maxExtent, offsetToZero);
    scrollController.animateTo(initial, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CalendarCubit, CalendarState>(
      listener: (context, state) {
        pageController.jumpToPage(0);
      },
      listenWhen: (previous, current) => previous.selectedDay != current.selectedDay,
      child: SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.only(bottom: 100, left: 16, top: 40),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const TimeLineGrid(),
            Positioned(
              left: 42,
              right: 0,
              top: 0,
              bottom: 0,
              child: BlocBuilder<UsersCubit, UsersState>(
                builder: (context, state) {
                  final users = state.mapOrNull(loaded: (value) => value.users) ?? [];
                  return PageView.builder(
                    controller: pageController,
                    itemCount: users.length,
                    itemBuilder: (context, userIndex) {
                      final totalSlots = (CalendarConfig.endDay - CalendarConfig.startDay + 1) * 4;

                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: scrollController,
                        itemCount: totalSlots + 1, // +1 для UserHeader
                        itemBuilder: (context, slotIndex) {
                          if (slotIndex == 0) return UserHeader(users[userIndex]);

                          final index = slotIndex - 1;
                          final hour = CalendarConfig.startDay + (index ~/ 4);
                          final minute = (index % 4) * 15;
                          final slotTime = DateTime(widget.day.year, widget.day.month, widget.day.day, hour, minute);

                          return TimeLineHour(user: users[userIndex], time: slotTime);
                        },
                      );
                    },
                  );
                },
              ),
            ),
            CurrentTimeIndicator(widget.day),
          ],
        ),
      ),
    );
  }


}
