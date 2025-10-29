import 'package:assets/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/src/screens/home/widgets/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const path = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(child: SvgPicture.asset(Assets.icons.burger.keyName)),
        leadingWidth: 45,
        title: Row(
          children: [
            const DateButton(),
            const SizedBox(width: 8),
            const Spacer(),
            SvgPicture.asset(Assets.icons.bell.keyName),
          ],
        ),
      ),
      body: const DayView(),
    );
  }
}

