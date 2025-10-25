import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_dayly/controllers/calendar_controller.dart';
import 'package:test_dayly/heplers/colors.dart';
import 'package:test_dayly/heplers/date_helper.dart';

class CurrentTimeIndicator extends StatefulWidget {
  const CurrentTimeIndicator(this.day);

  final DateTime day;

  @override
  State<CurrentTimeIndicator> createState() => _CurrentTimeIndicatorState();
}

class _CurrentTimeIndicatorState extends State<CurrentTimeIndicator> {
  late bool hasIndicator;

  @override
  void initState() {
    final now = DateTime.now();
    hasIndicator = now.isTheSameDayWith(widget.day);
    // print('has indicator: $hasIndicator');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!hasIndicator) {
      return const SizedBox();
    }

    final CalendarController controller = Get.find();

    return Obx(() {
      final offset = controller.timeIndicatorOffset;
      final current = controller.currentDateTime;

      return Positioned(
        top: offset,
        left: 0,
        child: IgnorePointer(
          child: Row(
            children: [
              Container(
                height: 16,
                width: 43,
                decoration: BoxDecoration(color: orange, borderRadius: BorderRadius.circular(40)),
                alignment: Alignment.center,
                child: Text(
                  current.hourReadable,
                  style: TextStyle(fontSize: 13, height: 1.33, fontWeight: FontWeight.w400),
                ),
              ),
              Container(height: 1, width: MediaQuery.of(context).size.width - 49, color: orange),
            ],
          ),
        ),
      );
    });
  }
}
