import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_dayly/controllers/calendar_controller.dart';
import 'package:test_dayly/controllers/users_controller.dart';
import 'package:test_dayly/heplers/colors.dart';
import 'package:test_dayly/heplers/date_helper.dart';
import 'package:test_dayly/widgets/day_timeline.dart';
import 'package:test_dayly/widgets/opacity_overlay.dart';

class DayView extends StatelessWidget {
  const DayView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [_DaysPageView(), _LoadingIndicator(), _BackToCurrentDayButtons(), OpacityOverlay()],
            ),
          ),
        ],
      ),
    );
  }
}

class _BackToCurrentDayButtons extends StatelessWidget {
  const _BackToCurrentDayButtons();

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
    final CalendarController calendarController = Get.find();

    return Obx(() {
      final current = calendarController.currentDateTime;
      final selected = calendarController.selectedDay;

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
        onTap: calendarController.jumpToCurrentDay,
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(8),
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            color: blue,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(offset: const Offset(5, 12), color: Colors.black.withOpacity(0.04), blurRadius: 20),
              BoxShadow(offset: const Offset(-5, -12), color: Colors.black.withOpacity(0.04), blurRadius: 20),
            ],
          ),
          child: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 16),
        ),
      );
    });
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    final UsersController usersController = Get.find();

    return Obx(() {
      final showIndicator = usersController.isLoading.value;

      if (!showIndicator) {
        return const SizedBox();
      }

      return IgnorePointer(
        child: Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator(color: blue),
        ),
      );
    });
  }
}

class _DaysPageView extends StatelessWidget {
  const _DaysPageView();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final CalendarController controller = Get.find();

      final day = controller.selectedDay;
      return DayTimeLine(day);
    });
  }
}
