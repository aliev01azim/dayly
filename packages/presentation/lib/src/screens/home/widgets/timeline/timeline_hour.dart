import 'package:collection/collection.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/src/configs/calendar_config.dart';
import 'package:presentation/src/modals/modals.dart';
import 'package:presentation/src/screens/home/blocs/users/users_cubit.dart';
import 'package:presentation/src/screens/home/widgets/widgets.dart';
import 'package:ui_kit/ui_kit.dart';

class TimeLineHour extends StatelessWidget {
  const TimeLineHour({super.key, required this.user, required this.time});

  final User user;
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    final slotHeight = CalendarConfig.hourSectorHeight / CalendarConfig.dividersCount;

    // Ищем сессию, которая занимает этот слот (включая продолжение)
    final occupyingSession = user.sessions.firstWhereOrNull((s) {
      final sessionEnd = s.startTime.add(s.duration);
      return time.isAtSameMomentAs(s.startTime) || (time.isAfter(s.startTime) && time.isBefore(sessionEnd));
    });

    if (occupyingSession == null) {
      // Слот свободен - показываем кликабельный пустой слот
      final borderSide = const BorderSide(color: MainPalette.border);
      return GestureDetector(
        onTap: () => showModalBottom(
          context: context,
          builder: (contextt) => BlocProvider.value(
            value: context.read<UsersCubit>(),
            child: CustomBottomSheet(
              hasBottomPadding: false,
              child: SessionCreate(userModel: user, startTime: time),
            ),
          ),
        ),
        child: Container(
          height: slotHeight,
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border(bottom: borderSide, right: borderSide, left: borderSide),
            color: Colors.white,
          ),
          margin: const EdgeInsets.only(right: 5),
        ),
      );
    } else if (isSameSlot(time, occupyingSession.startTime)) {
      // Это начало сессии - показываем сессию с соответствующей высотой
      return SizedBox(
        height: slotHeight * occupyingSession.duration.inMinutes / 15,
        child: Row(children: [Expanded(child: Card(occupyingSession))]),
      );
    } else {
      // Это продолжение сессии - просто пустое пространство без клика
      return const SizedBox(height: 0);
    }
  }
}
