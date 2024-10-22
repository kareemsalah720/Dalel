import 'package:dalel/features/hoom/presentation/widget/custom_hoom_view_appbar.dart';
import 'package:flutter/material.dart';

class HoomAppBarSection extends StatelessWidget {
  const HoomAppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      SizedBox(
        height: 28,
      ),
      CustomHoomViewAppbar(),
      SizedBox(
        height: 32,
      ),
    ]);
  }
}