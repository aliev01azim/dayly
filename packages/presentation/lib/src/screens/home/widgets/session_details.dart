import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class SessionDetails extends StatelessWidget {
  const SessionDetails({super.key, required this.sessionModel});
  final Session sessionModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(sessionModel.title),
            if (sessionModel.description != null) Text(sessionModel.description!, style: AppTextStyles.p(color: Colors.grey)),
            Text(
              'С: ${sessionModel.startTime.hourReadable} До: ${sessionModel.startTime.add(sessionModel.duration).hourReadable}',
            ),
          ],
        ),
      ),
    );
  }
}
