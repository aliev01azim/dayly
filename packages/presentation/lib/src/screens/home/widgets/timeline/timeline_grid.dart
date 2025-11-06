import 'package:core_api/core_api.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/configs/calendar_config.dart';
import 'package:ui_kit/ui_kit.dart';

class TimeLineGrid extends StatelessWidget {
  const TimeLineGrid({super.key,required this.day});
  final DateTime day;

  @override
  Widget build(BuildContext context) {
    final slotHeight = CalendarConfig.hourSectorHeight / CalendarConfig.dividersCount;

    // return Column(
    //   children: [
    //     SizedBox(height: slotHeight * 3),
    //     ...List.generate(
    //       CalendarConfig.endDay - CalendarConfig.startDay + 1,
    //       (index) => SizedBox(
    //         height: CalendarConfig.hourSectorHeight,
    //         child: Row(
    //           children: [
    //             Stack(
    //               alignment: Alignment.bottomRight,
    //               clipBehavior: Clip.none,
    //               children: [
    //                 Container(width: 42),
    //                 Positioned(
    //                   right: 9,
    //                   top: 0,
    //                   child: Text(
    //                     DateTime(1, 1, 1, (index + CalendarConfig.startDay)).hourReadable,
    //                     style: AppTextStyles.p(fontSize: 13, height: 1, fontWeight: FontWeight.w400),
    //                   ),
    //                 ),
    //                 Positioned(
    //                   right: 9,
    //                   top: slotHeight * 2, // позиция для :30 (второй слот)
    //                   child: Text(
    //                     '30',
    //                     style: AppTextStyles.p(
    //                       fontSize: 11,
    //                       height: 1,
    //                       fontWeight: FontWeight.w400,
    //                       color: Colors.grey,
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );

    return Column(
      children: [
        ...List.generate(
          24,
          (index) => Container(
            height: CalendarConfig.hourSectorHeight,
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 53,
                    ),
                    if (index != 23)
                      Container(
                        width: 7,
                        height: 1,
                        color: MainPalette.borderActionNormal,
                      ),
                    if (index != 0)
                      Positioned(
                        right: 9,
                        top: -6,
                        child: Text(
                          DateTime(1, 1, 1, index, 0).hourReadable,
                          style: const TextStyle(
                            fontSize: 13,
                            height: 1,
                            fontFamily: 'Nexa',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                  ],
                ),
                Container(
                  width: 1,
                  color: MainPalette.borderActionNormal,
                ),
                Expanded(
                  child: Column(
                    children: [
                      // Expanded(child: _TaskSector(index: index, day: day)),
                      if (index != 23)
                        Container(
                          height: 1,
                          color: MainPalette.borderActionNormal,
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
