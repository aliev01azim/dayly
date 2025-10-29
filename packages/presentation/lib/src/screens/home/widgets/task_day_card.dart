import 'package:assets/gen/assets.gen.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/src/extensions/session_extensions.dart';
import 'package:presentation/src/modals/modals.dart';
import 'package:presentation/src/screens/home/widgets/session_details.dart';
import 'package:ui_kit/ui_kit.dart';

class Card extends StatelessWidget {
  const Card(this.sessionModel, {super.key});

  final Session sessionModel;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = sessionModel.status?.bgcolor ?? Colors.transparent;
    final textColor = sessionModel.status?.color ?? Colors.black;

    return GestureDetector(
      onTap: () => showModalBottom(
        context: context,
        builder: (context) =>
            CustomBottomSheet(hasBottomPadding: false, child: SessionDetails(sessionModel: sessionModel)),
      ),
      child: Container(
        margin: const EdgeInsets.only(right: 5),
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
                    SvgPicture.asset(Assets.icons.stroke.keyName),
                    const Spacer(),
                    Icon(sessionModel.status!.icon, color: textColor, size: 16),
                    Text(
                      sessionModel.status!.text,
                      style: AppTextStyles.p(color: textColor, fontSize: 12, fontWeight: FontWeight.w600),
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
                      style: AppTextStyles.p(fontSize: 13),
                    ),
                  ),
                  if (sessionModel.online && sessionModel.status != null) ...[
                    //статус и название на одной строке
                    Icon(sessionModel.status!.icon, color: textColor, size: 16),
                    Text(
                      sessionModel.status!.text,
                      style: AppTextStyles.p(color: textColor, fontSize: 12, fontWeight: FontWeight.w600),
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
                  style: AppTextStyles.p(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
