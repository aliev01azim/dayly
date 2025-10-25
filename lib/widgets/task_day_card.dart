import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_dayly/heplers/modals.dart';
import 'package:test_dayly/models/session_model.dart';
import 'package:test_dayly/models/user_model.dart';
import 'package:test_dayly/widgets/custom_bottom_sheet.dart';
import 'package:test_dayly/widgets/session_details.dart';

class Card extends StatelessWidget {
  const Card(this.sessionModel, {super.key});

  final SessionModel sessionModel;

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor = sessionModel.status?.bgcolor ?? Colors.transparent;
    Color? textColor = sessionModel.status?.color ?? Colors.black;

    return GestureDetector(
      onTap: () async {
        showModalBottom(
          context: context,
          builder: (context) =>
              CustomBottomSheet(hasBottomPadding: false, child: SessionDetails(sessionModel: sessionModel)),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: backgroundColor.withOpacity(1), width: 1),
        ),

        height: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!sessionModel.online && sessionModel.status != null) //статус и название на разных строке
              Container(
                color: backgroundColor.withOpacity(0.3),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),

                child: Row(
                  children: [
                    SvgPicture.asset('assets/images/icons/stroke.svg'),
                    Spacer(),
                    Icon(sessionModel.status!.icon, color: textColor, size: 16),
                    Text(
                      sessionModel.status!.text,
                      style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),

              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      sessionModel.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  if (sessionModel.online && sessionModel.status != null) ...[
                    //статус и название на одной строке
                    Icon(sessionModel.status!.icon, color: textColor, size: 16),
                    Text(
                      sessionModel.status!.text,
                      style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ],
                ],
              ),
            ),
            if (sessionModel.description != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Text(
                  sessionModel.description!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
