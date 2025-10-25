import 'package:flutter/cupertino.dart' show CupertinoButton;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_dayly/controllers/calendar_controller.dart';
import 'package:test_dayly/heplers/date_helper.dart';
import 'package:test_dayly/widgets/calendar_days_view.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CalendarController>();

    return Scaffold(
      appBar: AppBar(
        leading: Center(child: SvgPicture.asset('assets/images/icons/burger.svg')),
        leadingWidth:45,
        title: Row(
          children: [
            Obx(() => _DateButton(title: controller.selectedDay)),
            const SizedBox(width: 8),
            const Spacer(),
            SvgPicture.asset('assets/images/icons/bell.svg'),
          ],
        ),
      ),
      body: const DayView(),
    );
  }
}

class _DateButton extends StatelessWidget {
  const _DateButton({required this.title});

  final DateTime title;

  @override
  Widget build(BuildContext context) {
    final CalendarController controller = Get.find();

    final style = const TextStyle(fontSize: 17, fontWeight: FontWeight.w400,color: Colors.black );

    return CupertinoButton(
      padding: EdgeInsets.zero,
      minSize: 0,
      onPressed: () =>
          showDatePicker(
            context: context,
            firstDate: DateTime(2025),
            lastDate: DateTime(2026),
            initialDate: controller.selectedDay,
            locale: const Locale('ru', 'RU'),
            initialEntryMode: DatePickerEntryMode.calendar,
          ).then((pickedDate) {
            if (pickedDate != null) {
              controller.setDate(pickedDate);
            }
          }),
      child: Row(
        children: [
          Text(title.dme, style: style),
          const SizedBox(width: 8),
          const Padding(padding: EdgeInsets.only(top: 2), child: Icon(Icons.keyboard_arrow_down, size: 16)),
        ],
      ),
    );
  }
}
