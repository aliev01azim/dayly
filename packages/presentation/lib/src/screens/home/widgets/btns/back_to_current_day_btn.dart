import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/screens/home/blocs/calendar/calendar_cubit.dart';
import 'package:presentation/src/screens/home/blocs/calendar/calendar_state.dart';
import 'package:ui_kit/ui_kit.dart';

class BackToCurrentDayButtons extends StatelessWidget {
  const BackToCurrentDayButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 80),
        child: Row(children: [_BackButton(isRight: false), Spacer(), _BackButton(isRight: true)]),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({required this.isRight});

  final bool isRight;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => const SizedBox(),
          loaded: (loaded) {
            final current = loaded.currentDateTime;
            final selected = loaded.selectedDay ?? DateTime.now();

            if (current.isTheSameDayWith(selected)) {
              return const SizedBox();
            }

            if (current.isAfter(selected) && !isRight) {
              return const SizedBox();
            }

            if (current.isBefore(selected) && isRight) {
              return const SizedBox();
            }

            return GestureDetector(
              onTap: () => context.read<CalendarCubit>().jumpToCurrentDay(),
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(8),
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  color: MainPalette.blue,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(offset: const Offset(5, 12), color: MainPalette.black.withOpacity(0.04), blurRadius: 20),
                    BoxShadow(
                      offset: const Offset(-5, -12),
                      color: MainPalette.black.withOpacity(0.04),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 16),
              ),
            );
          },
          error: (_) => const SizedBox(),
        );
      },
    );
  }
}
