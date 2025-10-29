import 'dart:io';

import 'package:assets/gen/assets.gen.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/configs/calendar_config.dart';
import 'package:ui_kit/ui_kit.dart';

class UserHeader extends StatelessWidget {
  const UserHeader(this.user, {super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    final slotHeight = CalendarConfig.hourSectorHeight / CalendarConfig.dividersCount;
    return Container(
      height: slotHeight * 3,
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(color: MainPalette.border),
          left: BorderSide(color: MainPalette.border),
          top: BorderSide(color: MainPalette.border),
        ),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 21,
            backgroundImage: user.avatarUrl != null && Platform.isIOS
                ? NetworkImage(user.avatarUrl!)
                : Image.asset(Assets.images.user.keyName).image,
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
