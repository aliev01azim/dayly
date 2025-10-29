// import 'package:flutter/material.dart';
// import 'package:presentation/src/configs/calendar_config.dart';

// class Dividers extends StatelessWidget {
//   const Dividers({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: Column(
//         children: List.generate(
//           CalendarConfig.endDay - CalendarConfig.startDay + 1,
//           (index) => SizedBox(
//             height: CalendarConfig.hourSectorHeight,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: List.generate(
//                 5,
//                 (__) => __ == CalendarConfig.dividersCount
//                     ? const SizedBox(height: 0.1)
//                     : const Divider(height: 0.1, thickness: 1, color: Color.fromRGBO(222, 224, 227, 1)),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
