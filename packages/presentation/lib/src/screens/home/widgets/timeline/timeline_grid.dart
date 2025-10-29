import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/configs/calendar_config.dart';
import 'package:ui_kit/ui_kit.dart';

class TimeLineGrid extends StatelessWidget {
  const TimeLineGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final slotHeight = CalendarConfig.hourSectorHeight / CalendarConfig.dividersCount;

    return Column(
      children: [
        SizedBox(height: slotHeight * 3),
        ...List.generate(
          CalendarConfig.endDay - CalendarConfig.startDay + 1,
          (index) => SizedBox(
            height: CalendarConfig.hourSectorHeight,
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  clipBehavior: Clip.none,
                  children: [
                    Container(width: 42),
                    Positioned(
                      right: 9,
                      top: 0,
                      child: Text(
                        DateTime(1, 1, 1, (index + CalendarConfig.startDay)).hourReadable,
                        style: AppTextStyles.p(fontSize: 13, height: 1, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Positioned(
                      right: 9,
                      top: slotHeight * 2, // позиция для :30 (второй слот)
                      child: Text(
                        '30',
                        style: AppTextStyles.p(
                          fontSize: 11,
                          height: 1,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
