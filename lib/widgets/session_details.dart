import 'package:flutter/material.dart';
import 'package:test_dayly/heplers/date_helper.dart';
import 'package:test_dayly/models/session_model.dart';

class SessionDetails extends StatelessWidget {
  const SessionDetails({super.key, required this.sessionModel});
  final SessionModel sessionModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(sessionModel.title),
            if (sessionModel.description != null) Text(sessionModel.description!, style: TextStyle(color: Colors.grey)),
            Text(
              'С: ${sessionModel.startTime.hourReadable} До: ${sessionModel.startTime.add(sessionModel.duration).hourReadable}',
            ),
          ],
        ),
      ),
    );
  }
}
