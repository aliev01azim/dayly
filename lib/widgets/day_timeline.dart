import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart' hide Card;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test_dayly/controllers/calendar_controller.dart';
import 'package:test_dayly/controllers/users_controller.dart';
import 'package:test_dayly/heplers/colors.dart';
import 'package:test_dayly/heplers/date_helper.dart';
import 'package:test_dayly/heplers/modals.dart';
import 'package:test_dayly/models/user_model.dart';
import 'package:test_dayly/widgets/current_time_indicator.dart';
import 'package:test_dayly/widgets/custom_bottom_sheet.dart';
import 'package:test_dayly/widgets/session_create.dart';
import 'package:test_dayly/widgets/session_details.dart';
import 'package:test_dayly/widgets/task_day_card.dart';

/// 1 час = 96 пикселей
const double hourSectorHeight = 96;

/// 4 деления в час
const int dividersCount = 4;

///начало дня в 10:00
const int startDay = 10;

///начало дня в 22:00
const int endDay = 22;

class DayTimeLine extends StatefulWidget {
  const DayTimeLine(this.day, {super.key});

  final DateTime day;

  @override
  State<DayTimeLine> createState() => _DayTimeLineState();
}

class _DayTimeLineState extends State<DayTimeLine> with SingleTickerProviderStateMixin {
  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController(initialScrollOffset: 0);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Future.delayed(const Duration(milliseconds: 400), () => _scrollToCurrentTime()),
    );
  }

  void _scrollToCurrentTime() {
    final now = DateTime.now();

    /// если сейчас - не сегодня и входит в начало и конец дня
    final needScrollToCurrentTime = now.isTheSameDayWith(widget.day) && (now.hour >= startDay && now.hour <= endDay);

    if (!needScrollToCurrentTime) {
      return;
    }

    final CalendarController controller = Get.find();

    /// на глаз высчитано, чтобы индикатор был чуть выше центра экрана
    final double offset = controller.timeIndicatorOffset - 116;

    final double offsetToZero = max(offset, 0);
    final double maxExtent = scrollController.position.maxScrollExtent;
    final double initial = min(maxExtent, offsetToZero);
    scrollController.animateTo(initial, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    final CalendarController controller = Get.find();
    final UsersController usersController = Get.find();

    return SingleChildScrollView(
      controller: scrollController,
      padding: const EdgeInsets.only(bottom: 100, left: 16, top: 40),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _TimeLineGrid(),
          Positioned(
            left: 42,
            right: 0,
            top: 0,
            bottom: 0,
            child: Obx(
              () => PageView.builder(
                padEnds: false,
                controller: controller.pageContoller,
                itemCount: usersController.users.length,
                itemBuilder: (context, i) {
                  final totalSlots = (endDay - startDay + 1) * 4; // 4 слота на каждый час

                  return SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        UserHeader(usersController.users[i]),
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            border: Border.symmetric(vertical: BorderSide(color: border, width: 1)),
                          ),
                          child: Stack(
                            children: [
                              const _Dividers(),

                              if (usersController.isLoading.value)
                                SizedBox()
                              else ...[
                                SingleChildScrollView(
                                  physics: NeverScrollableScrollPhysics(),
                                  child: Column(
                                    children: [
                                      ...List.generate(totalSlots, (index) {
                                        final hour = startDay + (index ~/ 4); // каждый 4-й индекс — новый час
                                        final minute = (index % 4) * 15; // каждые 15 минут внутри часа

                                        final slotTime = DateTime(
                                          widget.day.year,
                                          widget.day.month,
                                          widget.day.day,
                                          hour,
                                          minute,
                                        );

                                        return _Hour(
                                          user: usersController.users[i], // убедись, что индекс пользователя корректный
                                          time: slotTime,
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          CurrentTimeIndicator(widget.day),
        ],
      ),
    );
  }
}

class _Hour extends StatelessWidget {
  const _Hour({required this.user, required this.time});

  final UserModel user;
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    final slotHeight = hourSectorHeight / dividersCount;

    // Ищем сессию, которая занимает этот слот (включая продолжение)
    final occupyingSession = user.sessions.firstWhereOrNull((s) {
      final sessionEnd = s.startTime.add(s.duration);
      return time.isAtSameMomentAs(s.startTime) || (time.isAfter(s.startTime) && time.isBefore(sessionEnd));
    });

    if (occupyingSession == null) {
      // Слот свободен - показываем кликабельный пустой слот
      return InkWell(
        onTap: () => showModalBottom(
          context: context,
          builder: (context) => CustomBottomSheet(hasBottomPadding: false, child: SessionCreate(userModel: user, startTime: time)),
        ),
        child: SizedBox(height: slotHeight, width: double.maxFinite),
      );
    } else if (isSameSlot(time, occupyingSession.startTime)) {
      // Это начало сессии - показываем сессию с соответствующей высотой
      return SizedBox(
        height: slotHeight * occupyingSession.duration.inMinutes / 15,
        child: Row(children: [Expanded(child: Card(occupyingSession))]),
      );
    } else {
      // Это продолжение сессии - просто пустое пространство без клика
      return SizedBox(height: 0);
    }
  }
}

class UserHeader extends StatelessWidget {
  const UserHeader(this.user);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final slotHeight = hourSectorHeight / dividersCount;
    return Container(
      height: slotHeight * 3,
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(color: border, width: 1),
          left: BorderSide(color: border, width: 1),
          top: BorderSide(color: border, width: 1),
        ),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 21,
            backgroundImage: user.avatarUrl != null && Platform.isIOS
                ? NetworkImage(user.avatarUrl!)
                : Image.asset('assets/images/user.png').image,
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user.fullName,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                ),
                Text(
                  user.profession,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 84, 84, 84),
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TimeLineGrid extends StatelessWidget {
  const _TimeLineGrid();

  @override
  Widget build(BuildContext context) {
    final slotHeight = hourSectorHeight / dividersCount;

    return Column(
      children: [
        SizedBox(height: slotHeight * 3),
        ...List.generate(
          endDay - startDay + 1,
          (index) => SizedBox(
            height: hourSectorHeight,
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
                        DateTime(1, 1, 1, (index + startDay), 0).hourReadable,
                        style: const TextStyle(fontSize: 13, height: 1, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Positioned(
                      right: 9,
                      top: slotHeight*2, // позиция для :30 (второй слот)
                      child: Text(
                        '30',
                        style: const TextStyle(fontSize: 11, height: 1, fontWeight: FontWeight.w400, color: Colors.grey),
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

class _Dividers extends StatelessWidget {
  const _Dividers();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: List.generate(
          endDay - startDay + 1,
          (index) => SizedBox(
            height: hourSectorHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                5,
                (__) => __ == dividersCount
                    ? const SizedBox(height: 0.1)
                    : const Divider(height: 0.1, thickness: 1, color: Color.fromRGBO(222, 224, 227, 1)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
