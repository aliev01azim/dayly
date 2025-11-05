import 'package:domain_api/domain_api.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

extension SessionStatusExtension on SessionStatus {
  Color get color {
    switch (this) {
      case SessionStatus.confirmed:
        return Colors.black; // подтверждено
      case SessionStatus.attended:
        return MainPalette.green; // пришел
      case SessionStatus.missed:
        return MainPalette.red; // не пришел
    }
  }

  Color get bgcolor {
    switch (this) {
      case SessionStatus.confirmed:
        return MainPalette.red; // подтверждено
      case SessionStatus.attended:
        return MainPalette.main; // пришел
      case SessionStatus.missed:
        return MainPalette.main; // не пришел
    }
  }

  String get text {
    switch (this) {
      case SessionStatus.confirmed:
        return 'Подтвердил';
      case SessionStatus.attended:
        return 'Пришел'; //
      case SessionStatus.missed:
        return 'Не пришел';
    }
  }

  IconData get icon {
    switch (this) {
      case SessionStatus.confirmed:
        return Icons.check;
      case SessionStatus.attended:
        return Icons.add; //
      case SessionStatus.missed:
        return Icons.remove;
    }
  }
}