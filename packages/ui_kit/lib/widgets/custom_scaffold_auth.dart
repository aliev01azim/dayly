import 'package:assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_kit/ui_kit.dart';

class ScaffoldCustomAuth extends StatelessWidget {
  const ScaffoldCustomAuth({
    super.key,
    required this.body,
    this.appBar,
    this.showOnlyBackButton = false,
    this.showLogo = false,
    this.padding,
  });
  final Widget body;
  final AppBar? appBar;
  final bool showOnlyBackButton;
  final bool showLogo;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: showOnlyBackButton ? null : appBar,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.asset(Assets.images.bgBanner.keyName, alignment: Alignment.topCenter),
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Image.asset(Assets.images.logo.keyName, height: 67),
                  ),
                  if (showOnlyBackButton)
                    Positioned(
                      left: 32,
                      top: kToolbarHeight,
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: MainPalette.main),
                          width: 32,
                          height: 32,
                          child: Center(child: SvgPicture.asset(Assets.icons.arrowLeft.keyName)),
                        ),
                      ),
                    ),
                ],
              ),
          
             Padding(padding: padding ?? const EdgeInsets.symmetric(horizontal: 32), child: body)
            ],
          ),
        ),
      ),
    );
  }
}
