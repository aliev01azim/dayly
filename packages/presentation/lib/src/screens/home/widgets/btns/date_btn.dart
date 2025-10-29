import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/screens/home/blocs/calendar/calendar_cubit.dart';
import 'package:presentation/src/screens/home/blocs/calendar/calendar_state.dart';
import 'package:ui_kit/ui_kit.dart';

class DateButton extends StatelessWidget {
  const DateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CalendarCubit, CalendarState, DateTime>(
      selector: (state) {
        return state.selectedDay ?? DateTime.now();
      },
      builder: (context, selectedDay) {
        return CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 0,
          onPressed: () =>
              showDatePicker(
                context: context,
                firstDate: DateTime(2025),
                lastDate: DateTime(2026),
                initialDate: selectedDay,
              ).then((pickedDate) {
                if (pickedDate != null && context.mounted) {
                  context.read<CalendarCubit>().setDate(pickedDate);
                }
              }),
          child: Row(
            children: [
              Text(selectedDay.dme, style: AppTextStyles.h1()),
              const SizedBox(width: 8),
              const Padding(padding: EdgeInsets.only(top: 2), child: Icon(Icons.keyboard_arrow_down, size: 16)),
            ],
          ),
        );
      },
    );
  }
}
