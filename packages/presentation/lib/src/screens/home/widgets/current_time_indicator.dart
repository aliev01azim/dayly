import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/screens/home/blocs/calendar/calendar_cubit.dart';
import 'package:presentation/src/screens/home/blocs/calendar/calendar_state.dart';
import 'package:ui_kit/ui_kit.dart';

class CurrentTimeIndicator extends StatefulWidget {
  const CurrentTimeIndicator(this.day, {super.key});

  final DateTime day;

  @override
  State<CurrentTimeIndicator> createState() => _CurrentTimeIndicatorState();
}

class _CurrentTimeIndicatorState extends State<CurrentTimeIndicator> {
  late bool hasIndicator;

  @override
  void initState() {
    hasIndicator = DateTime.now().isTheSameDayWith(widget.day);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!hasIndicator) {
      return const SizedBox();
    }
    final offset = context.watch<CalendarCubit>().state.timeIndicatorOffset;
    final current = context.watch<CalendarCubit>().state.currentDateTime;
    return Positioned(
      top: offset,
      left: 0,
      child: IgnorePointer(
        child: Row(
          children: [
            Container(
              height: 16,
              width: 43,
              decoration: BoxDecoration(color: MainPalette.orange, borderRadius: BorderRadius.circular(40)),
              alignment: Alignment.center,
              child: Text(
                current.hourReadable,
                style: AppTextStyles.p(fontSize: 13, height: 1.33, fontWeight: FontWeight.w400),
              ),
            ),
            Container(height: 1, width: MediaQuery.of(context).size.width - 49, color: MainPalette.orange),
          ],
        ),
      ),
    );
  }
}
